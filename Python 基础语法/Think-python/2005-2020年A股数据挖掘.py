#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
#以下是自己写的脚本文件，包括数据获取和画图
from base import ts_pro,sql_engine
pro=ts_pro()
from update_sql import update_sql,get_trade_date,info_sql
from RPS import get_data,RPS
from plot_stock import stock_plot
#更新数据库
update_sql(table_name='daily_data')
#数据库已更新至20200225日数据


# In[1]:


path = '~/downloads/all_price_data.h5'
df_all = pd.read_hdf(path,encoding='utf8',index_col=0,parse_dates=['trade_date'])


# In[7]:


df_all


# # 2020年以来涨跌统计分析

# In[58]:


from pyecharts.charts import Bar
#注意这里用的pyecharts为0.5.11旧版本
df_2020=df_all['2020-1-1':'2020-2-24']


# In[53]:


df=df_2020_ret.sort_values(ascending=r)[:10]


# In[57]:


df.plot.bar()
plt.title('最大涨幅')


# # 2005-2020年历年收益率统计分析

# In[76]:


df_all.describe()


# # 2005-2020年区间累计涨幅

# In[68]:


def ret_2005_xx():
    ret_df=pd.DataFrame()
    for y in range(2005,2021):
        year=str(y)
        data=df_all[:year]
        total_ret=data.apply(lambda x: (((x/x.shift(1)-1).fillna(0)+1.0).cumprod()).iloc[-1]-1)
        tret=total_ret.sort_values(ascending=False).round(2)
        ret_df[year]=list(zip(tret.index,tret.values))
    return ret_df
ret_2005_xx()


# In[ ]:





# ![image.png](attachment:image.png)

# In[70]:


def cal_cum_ret(year):
    year=str(year)
    data=df_all[year:]
    total_ret=data.apply(lambda x: (((x/x.shift(1)-1).fillna(0)+1.0).cumprod()).iloc[-1]-1)
    first_=(total_ret.sort_values(ascending=False)[:10]).round(2)
    last_=(total_ret.sort_values(ascending=False)[-10:]).round(2)
    return first_,last_

def ret_rank():
    up,down=pd.DataFrame(),pd.DataFrame()
    for year in range(2005,2021):
        u,d=cal_cum_ret(year)
        up[str(year)]=list(zip(u.index,u.values))
        down[str(year)]=list(zip(d.index,d.values))
    return up,down
up_ret,down_ret=ret_rank()


# In[71]:


up_ret


# In[72]:


down_ret


# In[ ]:





# # 2005年至2019收益率评价指标

# In[63]:


def performance(all_df):
    cum_ret=df_all.apply(lambda x: ((x/x.shift(1)-1).fillna(0)+1.0).cumprod())
    total_ret=(cum_ret.iloc[-1]-1).sort_values(ascending=False)
    annual_ret=total_ret.apply(lambda x:pow(1+x,1/15)-1)
    dd=(cum_ret.cummax()-cum_ret)/cum_ret.cummax()
    d=dd.max()
    exReturn=all_df.apply(lambda x: (x/x.shift(1)-1).fillna(0)-0.03/250)
    sharper_atio=np.sqrt(len(exReturn))*exReturn.mean()/exReturn.std()
    perf_df=pd.DataFrame()
    perf_df['总收益率']=round(total_ret,3)
    perf_df['年化收益率%']=round(annual_ret*100,2)
    perf_df['最大回撤%']=round(d*100,2)
    perf_df['夏普比率']=round(sharper_atio,2)
    return perf_df


# In[65]:


perf_df=performance(df_all)
perf0=perf_df.sort_values('年化收益率%',ascending=False)
perf0[:15].T


# In[66]:


perf_df.describe().round(2)


# # 总结

# 本文使用Python对A股2005-2020历史数据进行了统计分析，试图从个股收益率的维度为大家揭示市场的某种微观结构及其演变。本文并未对中长期牛股及其涨跌背景深入展开分析，对此感兴趣的读者可以结合宏观背景、公司基本面进一步总结国内牛股的特征，分析某些行业某些个股之所以能持续走强的深层次原因。尽管过去不能代表未来，但历史总是惊人的相似。多层次多维度去总结和分析股市的历史走势，有助于我们更好的把握当下和未来。实际上任何技术、方法、工具都必须依托在对股市本质认识的基础上。经历、教育背景、资金大小、交易周期等不同，对股市的理解必然不一样，但关键是要形成与自己操作风格相匹配的股市交易系统。比如你做长线投资，必须从长线的角度去理解股市长期波动的主导因素是什么。
# 
# 当前疫情的阴霾还未退散，经济难言触底反弹，很多人感到迷茫与彷徨，但我坚信我们生活在一个拥有无穷机会的时期，是一个新理念、新产业和新领域层出不穷的时代。但是，你只有系统地学习和不断总结，才能学会如何认清并充分利用这些新机遇。

# In[23]:


from sqlalchemy import create_engine

db_flag = "mysql"
host_ip = "localhost"
host_port = 3306
db_name = "Stocks"
table_name = "s1"
user = "root"
pawd = "yxfabc123"
charset = "utf-8"

engine_config = '%s%s%s%s%s%s%s%s%s%s%s' % ('mysql+pymysql://', user, ':', pawd, '@', host_ip, ':',host_port, '/', db_name,'?charset=UTF8')
# print(engine_config)
engine = create_engine(engine_config)
conn = engine.connect()

df1.to_sql( table_name, conn, if_exists='append',index=False)


# In[15]:


df2.values


# In[24]:


df1 = pd.DataFrame(df2.values[1:10][1:10])


# In[20]:


df2.values[1:10][1:10]


# In[ ]:




