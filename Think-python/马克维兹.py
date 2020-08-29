"""
根据马科维茨（Markowitz）理论，我们可以对多资产的组合配置进行三方面的优化。

1.找到有效前沿。在既定的收益率下使组合的方差最小。

2.找到sharpe最优的组合（收益-风险均衡点）

3.找到风险最小的组合
"""

#%% 导入需要的包
import pandas as pd
import numpy as np
import statsmodels.api as sm #统计运算
import scipy.stats as scs #科学计算
import tushare as ts
import matplotlib.pyplot as plt #绘图
import scipy.optimize as sco


#%%  1.选取几只感兴趣的股票
df = pd.DataFrame()
df = ts.get_hist_data('600519', start='2015-01-05', end='2018-12-28') 
s600519 = df['p_change']
s600519.name = '600519'

df = pd.DataFrame()
df = ts.get_hist_data('000651', start='2015-01-05', end='2018-12-28') 
s000651 = df['p_change']
s000651.name = '000651'

df = pd.DataFrame()
df = ts.get_hist_data('000002', start='2015-01-05', end='2018-12-28') 
s000002 = df['p_change']
s000002.name = '000002'

df = pd.DataFrame()
df = ts.get_hist_data('601318', start='2015-01-05', end='2018-12-28') 
s601318 = df['p_change']
s601318.name = '601318'

df = pd.DataFrame()
df = ts.get_hist_data('601857', start='2015-01-05', end='2018-12-28') 
s601857 = df['p_change']
s601857.name = '601857'

data = pd.DataFrame({'600519':s600519,'000651':s000651,'000002':s000002, '601318':s601318,'601857':s601857})
data = data.dropna()


#%% 
#2.计算年化收益率和协方差矩阵（以一年252个交易日计算）
returns_annual = data.mean() * 252
cov_annual = data.cov() * 252


# %%   模拟投资组合
number_of_assets = 5
weights = np.random.random(number_assets)
weights /= np.sum(weights)

portfolio_returns = []
portfolio_volatilities = []
sharpe_ratio = []
for single_portfolio in range (50000):
      weights = np.random.random(number_of_assets)
      weights /= np.sum(weights) 
      returns = np.dot(weights, returns_annual)
      volatility = np.sqrt(np.dot(weights.T, np.dot(cov_annual, weights)))
      portfolio_returns.append(returns)
      portfolio_volatilities.append(volatility)
      sharpe = returns / volatility
      sharpe_ratio.append(sharpe)

portfolio_returns = np.array(portfolio_returns)
portfolio_volatilities = np.array(portfolio_volatilities)


# %%   作图
plt.style.use('seaborn-dark')
plt.figure(figsize=(9, 5))
plt.scatter(portfolio_volatilities, portfolio_returns, c=sharpe_ratio,cmap='RdYlGn', edgecolors='black',marker='o') 
plt.grid(True)
plt.xlabel('expected volatility')
plt.ylabel('expected return')
plt.colorbar(label='Sharpe ratio')


# %%   找出最优组合
def statistics(weights):        
    weights = np.array(weights)
    pret = np.sum(data.mean() * weights) * 252
    pvol = np.sqrt(np.dot(weights.T, np.dot(data.cov() * 252, weights)))
    return np.array([pret, pvol, pret / pvol])

def min_func_sharpe(weights):
    return -statistics(weights)[2]

bnds = tuple((0, 1) for x in range(number_assets))
cons = ({'type': 'eq', 'fun': lambda x: np.sum(x) - 1})
opts = sco.minimize(min_func_sharpe, number_assets * [1. / number_assets,], method='SLSQP',  bounds=bnds, constraints=cons)
opts['x'].round(3)  #得到各股票权重
statistics(opts['x']).round(3)  #得到投资组合预期收益率、预期波动率以及夏普比率


# %%
