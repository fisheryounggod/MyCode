# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %% Change working directory from the workspace root to the ipynb file location. Turn this addition off with the DataScience.changeDirOnImportExport setting
# ms-python.python added
import os
try:
	os.chdir(os.path.join(os.getcwd(), '../../../../../var/folders/f4/vwn8qlbj0dgb2m77_9sh1m5m0000gn/T'))
	print(os.getcwd())
except:
	pass
# %%
from IPython import get_ipython


# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')
plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
plt.rcParams['axes.unicode_minus']=False #用来正常显示负号


# %%
# import os
# os.chdir("D:/投资学")
price = pd.read_excel('Project two example.xlsx',sheet_name="Sheet3",header=1)
# df = pd.DataFrame(date, index ="Date", columns = list('ABCDEFGH'))


#%%
#求资产的月收益率
log_return=np.log(price.pct_change()+1)
log_return.head()


# %%
#生成不同权重的资产组合
n=3
stock_num=5
rs=np.random.RandomState(10)
weights=rs.rand(n,stock_num)
# print(weights) #检验是否生成对应得权重
weights/=np.sum(weights,axis=1).reshape(n,1)
print(weights)

#%%
#计算组合的期望收益
pret_m=np.dot(weights,log_return.mean())#不同权重下的月期望收益率
pret_y=(1+pret_m)**12-1
print(pret_y)


#计算组合的方差
pvol_m=np.diag(np.sqrt(np.dot(weights,np.dot(log_return.cov(),weights.T))))#不同权重的月标准差
pvol_y=pvol_m*np.sqrt(12)#年标准差
print('======')
print(pvol_y)


#sharp比率
risk_free=0.04
s=(pret_y-risk_free)/pvol_y
print('-----')
print(s)


# %%
#有效边界图版
plt.figure(figsize=(10,6))
plt.scatter(pvol_y,pret_y,marker=".")
#资本市场线
s_max=s.max()
print(s_max)
x=np.linspace(0,0.16)
y=0.04+s_max*x
plt.plot(x,y,label='资本市场线')
plt.grid(True)
plt.xlim([0,0.16])
plt.xlabel('预期波动率')
plt.ylabel('预期收益率')
plt.legend()


# %%
#优化计算
#年平均收益率，年标准差，夏普比率
import scipy.optimize as sco
def statistics(weights):
    weights=np.array(weights)
    pret=(1+np.dot(weights, log_return.mean()))**12-1
    pvol=np.sqrt(np.dot(weights.T,np.dot(log_return.cov()*12,weights)))
    return np.array([pret, pvol, (pret-0.04)/pvol])
#求解夏普比率最大的权重
def min_neg_sharp(weights):
    return -1*statistics(weights)[2]-0.04#最大化sharp radio函数

#最优化条件
cons=({'type':'eq','fun': lambda x: np.sum(x)-1})#约束权重和为1
bnd=tuple((0,1) for i in range(stock_num))#约束权重为大于0小于1
#优化求解
opts_maxSharpRatio = sco.minimize(min_neg_sharp,stock_num*[1/stock_num],method='SLSQP',bounds=bnd,constraints=cons)
print('夏普比率最大时资产的权重为：',opts_maxSharpRatio['x'].round(3))
print('年平均收益率，年标准差，夏普比率为:',statistics(opts_maxSharpRatio['x']))
sharp=statistics(opts_maxSharpRatio['x'])[2]
print(sharp)


# %%
def min_vol(weights):
    return statistics(weights)[1]
opts_minVolatility = sco.minimize(min_vol,stock_num*[1/stock_num], method='SLSQP',bounds=bnd ,constraints=cons)
print('风险最小时资产的权重为：',opts_minVolatility['x'].round(3))
print('年平均收益率，年标准差，夏普比率为:',statistics(opts_minVolatility['x']))


# %%
##构建有效边界组合
trets=np.linspace(0.04,0.20,100)
tvols=[]
for trets_i in trets:
    cons1=({'type':'eq','fun': lambda x: np.sum(x)-1},{'type':'eq','fun': lambda x: statistics(x)[0]-trets_i})#约束是所有参数(权重)的总和为1,且预期收益等于目标收益
    res=sco.minimize(min_vol,stock_num*[1/stock_num], method='SLSQP', bounds=bnd, constraints=cons1)
    tvols.append(res['fun'])
tvols=np.array(tvols)
##作图
plt.figure(figsize=(10,6))
plt.scatter(pvol_y, pret_y, marker='o', c=pret_y/pvol_y)
plt.scatter(tvols, trets,marker='x',c=trets/tvols, label='有效边界')
plt.plot(statistics(opts_maxSharpRatio['x'])[1],statistics(opts_maxSharpRatio['x'])[0],marker='*',markersize=15,label='最大夏普率组合')
plt.plot(statistics(opts_minVolatility['x'])[1],statistics(opts_minVolatility['x'])[0],marker='*',markersize=15,label='最小方差组合')
plt.grid(True)
plt.colorbar(label='夏普率')
plt.xlabel('预期波动率')
plt.ylabel('预期收益率')
x=np.linspace(0,0.16,50)
y=0.04+sharp*x
plt.plot(x, y,label='资本市场线')
plt.xlim([0,0.16])
plt.legend()
