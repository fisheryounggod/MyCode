#  学习搭建量化分析数据库
#  resource：公众号--python 爬虫与数据挖掘
#  日期：2020—1-6
#  杨雄飞

# %% 先引入后面分析、可视化等可能用到的库
import tushare as ts
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# %% 正常显示画图时出现的中文和负号
from pylab import mpl
mpl.rcParams['font.sans-serif']=['SimHei']
mpl.rcParams['axes.unicode_minus']=False

# %% 设置token
token='693c84c2aca4dc7b941439006bd946413706e7a9560bf3cce0369bb3'
pro = ts.pro_api(token)

# %% 定义数据获取函数
# 如果报错，把tushare升级到最新
def get_data(code,start='20190101',end='20190425'):
    df=ts.pro_bar(ts_code=code, adj='qfq', start_date=start, end_date=end)
    return df

#%% 获取当前交易日最新的股票代码和简称
def get_code():
    codes = pro.stock_basic(list_status='L').ts_code.values
    return codes


# %% 插入sql 数据库操作
#  使用try ... except ...pass 避免数据出错崩溃
from sqlalchemy import create_engine
import psycopg2
engine = create_engine('postgresql+psycopg2://postgres:123456@localhost:5432/postgres')
def insert_sql(data,db_name,if_exists='append'):
    # %%使用try...except..continue避免出现错误，运行崩溃
    try:
        data.to_sql(db_name,engine,index=False,if_exists=if_exists)
        # %%print(code+'写入数据库成功')
    except:
        pass

# %%下载20190101-20190425数据并插入数据库stock_data
#  此步骤比较耗费时间，大致25-35分钟左右
for code in get_code():
    data=get_data(code)
    insert_sql(data,'stock_data')

# %%读取整张表数据
df=pd.read_sql('stock_data',engine)
print(len(df))
# 输出结果：270998

# %%选取ts_code=000001.SZ的股票数据
df=pd.read_sql("select * from stock_data where ts_code='000001.SZ'",engine)
print(len(df))

#更新数据或下载其他期间数据
def update_sql(start,end,db_name):
    from datetime import datetime,timedelta
    for code in get_code():
        data=get_data(code,start,end)
        insert_sql(data,db_name)
    print(f'{start}:{end}期间数据已成功更新')

#%% 下载20180101-20181231期间数据
#只需运行一次，不再运行后可以注释掉
#下载数据比较慢，需要20-35分钟左右
start='20180101'
end='20181231'
db_name='stock_data'
#数据下载和存入数据库
update_sql(start,end,db_name)
#使用pandas的read_sql读取数据
df_all_data=pd.read_sql('stock_data',engine)
print(len(df_all_data))
#输出结果：1087050
#查看交易代码和交易日期个数
print(len(df_all_data.ts_code.unique()))
print(len(df_all_data.trade_date.unique()))
#输出结果：3604；319
d=df_all_data.trade_date.unique()
print(d.max())
print(d.min())
2019-04-25T00:00:00.000000000
2018-01-02T00:00:00.000000000
#获取交易日2019年4月25日数据
pd.read_sql("select * from stock_data where trade_date='2019-04-25' ",engine).head()

# %%构建数据查询和可视化函数
def plot_data(condition,title):
    from pyecharts import Bar
    from sqlalchemy import create_engine
    engine = create_engine('postgresql+psycopg2://postgres:123456@localhost:5432/postgres')
    data=pd.read_sql("select * from stock_data where+"+ condition,engine)
    count_=data.groupby('trade_date')['ts_code'].count()
    attr=count_.index
    v1=count_.values
    bar=Bar(title,title_text_size=15)
    bar.add('',attr,v1,is_splitline_show=False,linewidth=2)
    return bar

# 查询股价低于2元个股数据分布
c1="close<2"
t1="股价低于2元个股时间分布"
plot_data(c1,t1)

#%% 查询股价日涨幅超过9.5%个股数据分布
c2="pct_chg>9.5"
t2="股价涨幅超过9.5%个股时间分布"
plot_data(c2,t2)

#%% 查询股价日跌幅超过-9.5%个股数据分布
c3="pct_chg<-9.5"
t3="股价跌幅超过-9.5%个股时间分布"
plot_data(c3,t3)

#%% 结合选股策略对数据库进行查询和提取数据

#%% 筛选代码
#获取当前交易的股票代码和名称

def get_new_code(date):
    #获取当前所有交易股票代码
    df0 = pro.stock_basic(exchange='', list_status='L')
    df1 =pro.daily_basic(trade_date=date)
    df=pd.merge(df0,df1,on='ts_code')
    #剔除2017年以后上市的新股次新股
    df=df[df['list_date'].apply(int).values<20170101]
    #剔除st股
    df=df[-df['name'].apply(lambda x:x.startswith('*ST'))]
    #剔除动态市盈率为负的
    df=df[df.pe_ttm>0]
    #剔除大市值股票
    df=df[df.circ_mv<10**5]
    #剔除价格高于20元股票
    #df=df[df.close<20]
    codes=df.ts_code.values
    return codes
len(get_new_code('20190425'))
#输出结果：46

import talib as ta

#%% 20日均线交易策略

def find_stock(date):
    f_code=[]
    for code in get_new_code(date):
        try:
            data=df_all_data.loc[df_all_data.ts_code==code].copy()
            data.index=pd.to_datetime(data.trade_date)
            data=data.sort_index()
            data['ma_20']=ta.MA(data.close,timeperiod=20)
            if data.iloc[-1]['close']>data.iloc[-1]['ma_20']:
                f_code.append(code)
        except:
            pass
    return f_code
fs=find_stock('20190305')
print(f'筛选出的股票个数：{len(fs)}')
if fs:
    df_find_stocks=pd.DataFrame(fs,columns=['ts_code'])
    #将选出的股票存入数据库，如果表已存在，替换掉，相当于每次更新
    insert_sql(df_find_stocks,'find_stocks',if_exists='replace')
    print('筛选的股票已入库')
# 筛选出的股票个数：9
# 筛选的股票已入库

# %%查看数据库中筛选的股票池
codes=pd.read_sql('find_stocks',engine)
codes=codes.values.tolist()
codes=[c[0] for c in codes]
#print(codes)

#%% 对筛选的股票作进一步分析
select_data=pd.DataFrame()
for code in codes:
    try:
        df_= df_all_data[df_all_data.ts_code.values==code]
        df_.index=pd.to_datetime(df_.trade_date)
        df_=df_.sort_index()
        select_data[code]=df_.close
    except:
        pass
select_data.fillna(method='ffill',inplace=True)
select_data.tail()
ret=select_data.apply(lambda x:x/x.shift(1)-1)
ret=ret.dropna()
ret.tail()
prod_ret=ret.apply(lambda x:(1+x).cumprod())
prod_ret.plot(figsize=(12,5))
plt.xlabel('',fontsize=15)
plt.title('股票池累计净值',size=15)
ax = plt.gca()
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
plt.show()

#%% 根据代码从数据库中获取数据
def get_data_from_sql(code):
    from sqlalchemy import create_engine
    engine = create_engine('postgresql+psycopg2://postgres:123456@localhost:5432/postgres')
    data=pd.read_sql(f"select * from stock_data where ts_code='{code}'",engine)
    data.index=pd.to_datetime(data.trade_date)
    data=data.sort_index()
    #计算20日均线
    data['ma20']=data.close.rolling(20).mean()
    return data

#%% 002790、0573股票的K线图
kline_plot('002790.SZ')
kline_plot('300573.SZ')

# 文中用到的数据仅为百万条左右，实际上使用excel的csv来读写也很快，并且比较直观，但随着数据的不断增多，要建立自己完善的量化分析系统，数据库的学习就显得尤为重要。
