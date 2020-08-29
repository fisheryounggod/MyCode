#%%    pandas-datareader包下载雅虎财经股价数据
import datetime
import pandas as pd
import pandas_datareader.data as web
## !!! here it is 'pandas_datareader' rather than 'pandas-datareader'

#%%
# import os
# os.mkdir('.\\out')


# %%  1 获取股价数据
start = datetime.datetime(2016, 1, 1) # or start = '1/1/2016'
end = datetime.date.today()
prices = web.DataReader('AAPL', 'yahoo', start, end)
print (prices.head())  # print first rows of the prices data


# %%   2 获取股利数据
actions = web.DataReader('AAPL', 'yahoo-actions', start, end)
print (actions.head())

# %%   3.合并股利和股价数据
prices['action'], prices['value'] = actions.action, actions.value
print (prices)

# %%   4.输出为CSV文件
prices.to_csv('AAPL.csv')

# %%
