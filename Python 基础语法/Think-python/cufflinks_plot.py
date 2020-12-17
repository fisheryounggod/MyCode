#%% cufflinks介绍
"""
就像seaborn封装了matplotlib一样，cufflinks在plotly的基础上做了一进一步的包装，方法统一，参数配置简单。其次它还可以结合pandas的dataframe随意灵活地画图。可以把它形容为"pandas like visualization"。
毫不夸张地说，画出各种炫酷的可视化图形，只需一行代码，效率非常高，同时也降低了使用的门槛儿。cufflinks的github链接如下：
https://github.com/santosjorge/cufflinks
"""
#%%
import cufflinks as cf
cf.help()
#%%
# 对iplot中的参数不熟练，直接输入以下代码即可查询。
help(cf.iplot)


#%%
import pandas as pd
import cufflinks as cf
import numpy as np

# 我们这里先设置为offline模式，这样就避免了出现次数限制问题。
cf.set_config_file(offline=True)


# %%  lines线图
cf.datagen.lines(1,500).ta_plot(study='sma',periods=[13,21,55])

# 1）cufflinks使用datagen生成随机数；
# 2）figure定义为lines形式，数据为(1,500)；
# 3）然后再用ta_plot绘制这一组时间序列，参数设置SMA展现三个不同周期的时序分析。


# %%
# box箱型图
cf.datagen.box(20).iplot(kind='box',legend=False)


# %%
# histogram直方图
cf.datagen.histogram(3).iplot(kind='histogram')


# %%
# histogram条形图
df=pd.DataFrame(np.random.rand(10, 4), columns=['a', 'b', 'c', 'd'])
df.iplot(kind='bar',barmode='stack')

# %%
# scatter散点图
df = pd.DataFrame(np.random.rand(50, 4), columns=['a', 'b', 'c', 'd'])
df.iplot(kind='scatter',mode='markers',colors=['orange','teal','blue','yellow'],size=10)


# %%
# bubble气泡图
df.iplot(kind='bubble',x='a',y='b',size='c')

# %%
# scatter matrix 散点矩阵图
df = pd.DataFrame(np.random.randn(1000, 4), columns=['a', 'b', 'c', 'd'])
df.scatter_matrix()


# %%
# subplots 子图
df=cf.datagen.lines(4)
df.iplot(subplots=True,shape=(4,1),shared_xaxes=True,vertical_spacing=.02,fill=True)

# %%
df.iplot(subplots=True,subplot_titles=True,legend=False)

# %%
df=cf.datagen.bubble(10,50,mode='stocks')
figs=cf.figures(df,[dict(kind='histogram',keys='x',color='blue'),
                    dict(kind='scatter',mode='markers',x='x',y='y',size=5),
                    dict(kind='scatter',mode='markers',x='x',y='y',size=5,color='teal')],asList=True)
figs.append(cf.datagen.lines(1).figure(bestfit=True,colors=['blue'],bestfit_colors=['pink']))
base_layout=cf.tools.get_base_layout(figs)
sp=cf.subplots(figs,shape=(3,2),base_layout=base_layout,vertical_spacing=.15,horizontal_spacing=.03,
               specs=[[{'rowspan':2},{}],[None,{}],[{'colspan':2},None]],
               subplot_titles=['Histogram','Scatter 1','Scatter 2','Bestfit Line'])
sp['layout'].update(showlegend=False)
cf.iplot(sp)

# %% shapes 形状图
# 如果我们想在lines图上增加一些直线作为参考基准，这时候我们可以使用hlines的类型图。
df=cf.datagen.lines(3,columns=['a','b','c'])
df.iplot(hline=[dict(y=-1,color='blue',width=3),dict(y=1,color='pink',dash='dash')])

# %%将某个区域标记出来，可以使用hspan类型
df.iplot(hspan=[(-1,1),(2,5)])


# %%  竖条的区域，可以用vspan类型。
df.iplot(vspan={'x0':'2015-02-15','x1':'2015-03-15','color':'teal','fill':True,'opacity':.4})
# %%
