#%%

#%%
# 1、获取数据

# 导入工具包
import pandas_datareader as pdr

# 获取阿里巴巴股票数据
alibaba = pdr.get_data_yahoo("BABA")

# 显示数据前5行
alibaba.head()

# 看看数据量
alibaba.shape

# 数据基本信息
alibaba.info()

# 数据描述统计信息
alibaba.describe()

#%%
# 2、历史趋势分析

#基本信息
import numpy as np
import pandas as pd
from pandas import Series,DataFrame
 
#股票数据读取
import pandas_datareader as pdr
 
#可视化
import matplotlib.pyplot as plt
import seaborn as sns
# %matplotlib inline，在数据可视化中使用，引入了这个魔法命令，就不用每次展示图都写一个plt.show()
%matplotlib inline             

 
#时间
from datetime import datetime

start = datetime(2015,8,24)
alibaba = pdr.get_data_yahoo("BABA",start = start)
amazon = pdr.get_data_yahoo("AMZN",start = start)
alibaba.head()

alibaba["Adj Close"].plot(kind="line",legend=True)

#%%
# 将阿里巴巴数据和亚马逊数据画在同一张图里

#重命名一下，方便设置图例
alibaba["Ali_Adu Close"]=alibaba["Adj Close"]
amazon["Ama_Adj Close"] = amazon["Adj Close"]
#对比展示
alibaba["Ali_Adu Close"].plot(legend = True)
amazon["Ama_Adj Close"].plot(legend = True)
#%%
# 3、风险分析

company = ['AAPL','GOOG','MSFT','AMZN','FB']
top_tech_df = pdr.get_data_yahoo(company)['Adj Close']
top_tech_df.head()

# 画个Adj Close数据折线图
top_tech_df.plot()
#%%
# 4、如要比较数据之间是否具有相关性，可以绘制一下差值数据散点图，下面以谷歌和亚马逊为例，绘制这连个公司的收盘价差值散点图
sns.jointplot('AMZN','GOOG', top_tech_df, kind='scatter')

# 做一个所有公司的股票相关性比较：
sns.pairplot(top_tech_df.dropna())

#%%
