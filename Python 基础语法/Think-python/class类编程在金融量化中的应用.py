#!/usr/bin/env python
# coding: utf-8

# 使用tushare获取所有A股每日交易数据，保存到本地数据库，同时每日更新数据库；根据行情数据进行可视化和简单的策略分析与回测。由于篇幅有限，本文着重介绍股票数据管理（下载、数据更新）的面向对象编程应用实例。

# In[2]:


#导入需要用到的模块
import numpy as np
import pandas as pd
from dateutil.parser import parse
from datetime import datetime,timedelta
#操作数据库的第三方包，使用前先安装pip install sqlalchemy
from sqlalchemy import create_engine
#tushare包设置
import tushare as ts
import pymysql


# In[3]:


token='693c84c2aca4dc7b941439006bd946413706e7a9560bf3cce0369bb3'
pro=ts.pro_api(token) #初始化pro接口


# In[133]:


df = pro.trade_cal(exchange='', start_date='20000101',
                   end_date='20200225', 
                   fields='exchange,cal_date,is_open,pretrade_date', is_open='0')


# In[134]:


df


# In[131]:


class Data(object):
    def __init__(self,
                 start='20050101',
                 end='20191115',
                 table_name='daily_data'):
        self.start=start
        self.end=end
        self.table_name=table_name
        self.codes=self.get_code()
        self.cals=self.get_cals()       
    #获取股票代码列表    
    def get_code(self):
        codes = pro.stock_basic(list_status='L').ts_code.values
        return codes
    #获取股票交易日历
    def get_cals(self):
        #获取交易日历
        cals=pro.trade_cal(exchange='')
        cals=cals[cals.is_open==1].cal_date.values
        return cals
    #每日行情数据
    def daily_data(self,code):
        try:
            df0=pro.daily(ts_code=code,start_date=self.start,
                end_date=self.end)            
            df1=pro.adj_factor(ts_code=code,trade_date='') 
            #复权因子
            df=pd.merge(df0,df1)  #合并数据
        except Exception as e:
            print(code)
            print(e)
        return df
    #保存数据到数据库
    def save_sql(self):
        for code in self.codes:
            data=self.daily_data(code)
            data.to_sql(self.table_name,engine,
                 index=False,if_exists='append')
    #获取最新交易日期
    def get_trade_date(self):
        #获取当天日期时间
        pass
    #更新数据库数据
    def update_sql(self):
        pass #代码省略
    #查询数据库信息            
    def info_sql(self):
        pass #代码省略


# In[ ]:


# 代码运行

#假设你将上述代码封装成class Data
#保存在'C:\zjy\db_stock'目录下的down_data.py中
import sys
#添加到当前工作路径
sys.path.append(r'C:\zjy\db_stock')
#导入py文件中的Data类
from download_data import Data
#实例类
data=Data()
#data.save_sql() #只需运行一次即可
data.update_sql()      
data.info_sql() 


# In[ ]:


#另外又根据画图需要，从数据库中提取数据画K线图
#写了一个stock_plot类保存在plot_stock.py文件中
from plot_stock import stock_plot
shfz=stock_plot('双汇发展')
shfz.kline_plot() #普通K线图


# In[ ]:


#画修正版K线图
shfz.kline_plot(ktype=1)


# In[142]:


hs300s = ts.get_hs300s() #获取沪深300当前成份股及所占权重


# In[136]:


money_supply = ts.get_money_supply()


# In[152]:


cpi = ts.get_cpi()


# In[153]:


from sqlalchemy import create_engine

db_flag = "mysql"
host_ip = "localhost"
host_port = 3306
db_name = "First"
table_name = "cpi"
user = "root"
pawd = "yxfabc123"
charset = "utf-8"

engine_config = '%s%s%s%s%s%s%s%s%s%s%s' % ('mysql+pymysql://', user, ':', pawd, '@', host_ip, ':',host_port, '/', db_name,'?charset=UTF8MB4')
# print(engine_config)
engine = create_engine(engine_config)
conn = engine.connect()


# In[154]:


cpi.to_sql( table_name, conn, if_exists='append',index=False)


# In[4]:


data = ts.pro_bar(pro_api=api,ts_code='000009.SZ', adj='qfq', start_date='20170101', end_date='20181011',ma=5,freq='D')


# In[ ]:




