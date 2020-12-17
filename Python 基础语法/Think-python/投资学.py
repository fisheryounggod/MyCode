# 这篇笔记是FIN 567课程的最后一次作业的笔记，它是一个典型的金融学作业和Python练习题目，包含了股价的下载、收益率和协方差的计算，补全NaN值，矩阵的点乘和叉乘，蒙特卡洛模拟，最优化问题，Python绘图等。尤其是其中的minimize方法，它几乎可以解决所有excel中solver可以解决的问题，说它是Python中的solver也不为过。

#%% 1最大限度获取有效历史数据
import pandas as pd
import numpy as np
import pandas_datareader.data as web
import matplotlib.pyplot as plt
import scipy.optimize as solver
import datetime as dt
from functools import *

#%%  
database = pd.DataFrame()
tickers = ['AAPL', 'FB', 'GOOG', 'MSFT']
q = len(tickers)
records = 0
for i in tickers:
    tmp = web.DataReader(i, 'yahoo', '1/1/2010', dt.date.today())
    database[i] = tmp['Adj Close']
    if records == 0:
        records = len(tmp)
    else:
        records = min(records, len(tmp))
        
#%% 2 计算单个资产年化收益率和标准差
returns = returns.tail(records - 1)
returns.fillna(value=0, inplace=True)
print (returns.head())
print (returns.tail())

mean = returns.mean() * 252
cov = returns.cov() * 252
print (mean)
print (cov)

#%% 3计算某一投资组合的年化收益率和风险水平
w = np.array([.1, .2, .3, .4])
r = sum(w * mean) # multiply
s = np.sqrt(reduce(np.dot, [w, cov, w.T])) # dot multiply

plt.plot(r, s, 'y*')

#%% 4 使用蒙特卡洛方法找出可行域
sds = []
rtn = []

for _ in range(100000):
    w = np.random.rand(q)
    w /= sum(w)
    rtn.append(sum(mean * w))
    sds.append(np.sqrt(reduce(np.dot, [w, cov, w.T])))

plt.plot(sds, rtn, 'ro') # ro for red dot


#%% 5描出有效边界
def sd(w):
    return np.sqrt(reduce(np.dot, [w, cov, w.T]))
    
x0 = np.array([1.0 / q for x in range(q)])
bounds = tuple((0, 1) for x in range(q))

constraints = [{'type': 'eq', 'fun': lambda x: sum(x) - 1},
               {'type': 'eq', 'fun': lambda x: sum(x * mean) - .18}]
            
def sd(w):
    return np.sqrt(reduce(np.dot, [w, cov, w.T]))

x0 = np.array([1.0 / q for x in range(q)])
bounds = tuple((0, 1) for x in range(q))
constraints = [{'type': 'eq', 'fun': lambda x: sum(x) - 1},
               {'type': 'eq', 'fun': lambda x: sum(x * mean) - .18}]

outcome = solver.minimize(sd, x0=x0, constraints=constraints, bounds=bounds)
print(outcome)

print (sum(outcome.x * mean))

given_r = np.arange(.18, .26, .005)

def sd(w):
    return np.sqrt(reduce(np.dot, [w, cov, w.T]))

x0 = np.array([1.0 / q for x in range(q)])
bounds = tuple((0, 1) for x in range(q))

given_r = np.arange(.16, .28, .005)
risk = []

for i in given_r:
    constraints = [{'type': 'eq', 'fun': lambda x: sum(x) - 1},
                   {'type': 'eq', 'fun': lambda x: sum(x * mean) - i}]
    outcome = solver.minimize(sd, x0=x0, constraints=constraints, bounds=bounds)
    risk.append(outcome.fun)

plt.plot(risk, given_r, 'x')

constraints = {'type': 'eq', 'fun': lambda x: sum(x) - 1}
minv = solver.minimize(sd, x0=x0, constraints=constraints, bounds=bounds).fun
minvr = sum(solver.minimize(sd, x0=x0, constraints=constraints, bounds=bounds).x * mean)
plt.plot(minv, minvr, 'w*') # w* for white star
plt.grid(True)
plt.title('Efficient Frontier: AAPL, FB, GOOG, MSFT')
plt.xlabel('portfolio volatility')
plt.ylabel('portfolio return')

