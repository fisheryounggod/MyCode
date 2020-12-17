#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# ## 数据预处理

# In[ ]:


Dlist = sorted(np.where(price[:, 2] == '')[0].tolist, reverse=True)   #np.where 方法
price_new = np.delete(price, Dlist, 0) # 如果从上往下删除行，可能出错


# In[30]:


a=np.random.normal(1,4,(4,4)).round().astype('int')
a


# In[ ]:


np.delete(a,[1,2],0)  # 最好一次删除，不然顺序改变，容易出错
price_new.max(),price_new.min() # 查看有没异常值，有则删掉 
(price_new.max<=price_new.max)&(price_new>0).all()  # 单纯用np 判断是否有非数值


# In[31]:


def get_repeated_label(array_1dim):   # 查找重复
    label_1dim = []
    for k in range(len(array_1dim) - 1):
        for i in range(k + 1, len(array_1dim)):
            if array_1dim[k] == array_1dim[i]:
                label_1dim.append(i)
    return np.unique(label_1dim)


# In[32]:


a =np.array([1,2,3,4,5,2,3,4,5,6,3,7,8,9,])

get_repeated_label(a)


# In[ ]:


as3[10] = np.random.normal(ar3.mean(),as3.std(),1)[0]  # 正态补值，适用大数据


# In[ ]:


format_array_Frame = lambda x:'%u' %x        # 整形函数
Format_DataFrame.applymap(format_array_Frame)


# In[ ]:


def fllup_ mean_ value（array_ parameter）：
    for index_j in range（np.shape（array_ parameter）[1]）：#遍查二维数组的每一 列
        array_ columns_ nr=list（np.where（array_ _parameter==0）[1]）#把每一列中的0元素的列索引做成列表传给变量array_ columns_ _nr
            if index_ j in array_columns_ nr：#在 上面生成的列表中循环，即在0元素所对应的列索引组成的列表中循环
                appearance_sum=array_columns_ _nr.count(index_j）#对列表中与index_ j相等的列索引进行计数，等价于确定每列中0的个数
                if appearance_sum > 0：#如果一列中有0值
                    mean_1=（array_ parameter[]:,index_j]).sum()/(np.shape（array_ parameter）0-appearance_ sum）#计算算数平均值，注意分母要减去0元素的个数，也就是说0元素不计算在呢，因为0元素是替换无效值而得。
                    bollmatrix_1=array_parameter【:,index_j】==0#通过布尔数组确定0元素的位置array_ parameter【bollmatrix_ 1，index_ j】=mean_ 1#选中index_ j列中所有0元素，替换为平均值
    return array_parameter


# In[ ]:


def invalid_value_cleaning(array_variable):
    r,c = array_variable)
    for i in range(np.shape(r):
        for j in range(np.shape(c):  #通过i,j循环遍查整个二维数组
            if type(array_variable[i, j]) == float or type(
                    array_variable[i, j]) == int:  #
                pass
        else:
            array_variable[i, j] = 0
    array_variable[np.isnan(array_variable.astype(np.float64))] = 0  #通过isnan数组
    return array__variable


# ## 查看 pandas 及其支持项的版本

# In[112]:


func = pd.DataFrame(np.array(dir(pd)[:140]).reshape(20,7))
func


# ## 创建 DataFrame

# ### 读取其他软件数据

# In[ ]:


drinks = pd.read_csv('data/drinks.csv')
movies = pd.read_csv('data/imdb_1000.csv')
orders = pd.read_csv('data/chipotle.tsv', sep='\t')
orders['item_price'] = orders.item_price.str.replace('$', '').astype('float')     # 要赋值，直接转换无效
stocks = pd.read_csv('data/stocks.csv', parse_dates=['Date'])
titanic = pd.read_csv('data/titanic_train.csv')
ufo = pd.read_csv('data/ufo.csv', parse_dates=['Time'])


# ### 从剪贴板创建 DataFrame

# In[156]:


df = pd.read_clipboard()
df


# ## 用多个文件建立 DataFrame ~ 按行

# In[ ]:


pd.read_csv('data/stocks1.csv')

pd.read_csv('data/stocks2.csv')

pd.read_csv('data/stocks3.csv')

from glob import glob          #glob()：return a list of all files that match that pattern.

stock_files = sorted(
    glob('data/stocks*.csv')
)  # Return a new list containing all items from the iterable in ascending order.

# stock_files

pd.concat((pd.read_csv(file) for file in stock_files[0:-1]),ignore_index=True)


# In[ ]:


pd.concat((pd.read_csv(file) for file in stock_files),axis=1).head() # 按列


# ## 随机分割

# In[ ]:


movies_1 = movies.sample(
    frac=0.75,
    random_state=1234)  # randomly assigning 75% of the rows to one DataFrame

movies_2 = movies.drop(movies_1.index)  # the other 25% to a second DataFrame

len(movies_1) + len(movies_2)


# ## 更改行列名

# In[21]:


df.rename({"列一":"l1","列二":"l2"},axis = 'columns')    # df.rename()


# In[22]:


df.columns = df.columns.str.replace("列", "L")  # df.columns.str.replace()
df


# In[23]:


df.columns = ['one', 'two']  # "="
df


# ## 按数据类型选择列:select_dtypes

# In[149]:


display(df.dtypes)
df.select_dtypes(include=['int', 'category']).head()
df.select_dtypes(exclude='object').head()


# ## 把字符串转换为数值

# In[40]:


df = pd.DataFrame({
    'col_one': ['1.1', '2.2', '3.3'],
    'col_two': ['4.4', '5.5', '6.6'],
    'col_three': ['7.7', '8.8', '-']
})
display(df)
df.dtypes


# In[41]:


df.apply(pd.to_numeric, errors="coerce").dtypes


# ## 数据概览

# In[18]:


df.isnull()   # 查看有没空值


# In[26]:


df['one'].unique()  # 查看年龄唯一值


# ## 排序

# In[56]:


drinks = pd.read_csv('Pandas25式/data/drinks.csv')
drinks


# In[ ]:


# 先按age降序排列，后按visits升序排列
df.sort_values(['age', 'visits'], ascending=[False, True])        # 双排序


# ## 删除

# ### 删除列/行

# In[ ]:


df = df.drop(0, axis=1)  # 对于列，有列名则无数字位置

df.drop(dates[0], axis=0)


# ###  删除nan

# In[ ]:


df1.dropna(how='any')

df1.fillna(value=5)

pd.isna(df1)


# ## 过滤：isin

# In[64]:


df


# In[65]:


# df2 = df.copy()
df['G'] = ['one','two', 'three','four']
df


# In[67]:


df[df['F'].isin(['two', 'four'])]

# df(not(df.isnull()))


# ### 根据多个类别筛选3

# In[ ]:


movies[(movies.genre == 'Crime') | (movies.genre == 'Action') |
       (movies.genre == 'Drama')].head()

movies[movies.genre.isin(['Action', 'Drama', 'Western'])].head()

movies[~movies.genre.isin(['Action', 'Drama', 'Western'])].head()


# ### 根据最大的类别筛选 DataFrame

# In[ ]:


movies[movies.genre.isin(counts.nlargest(3).index)].head()


# ## 数据清洗

# ### 操控缺失值

# In[ ]:


ufo.dropna(axis='columns', how='any').head()  # 去掉含空值的列


# In[ ]:


ufo.dropna(
    thresh=len(ufo) * 0.9,
    axis='columns').head()  # drop columns in which more than 10%  missing


# In[ ]:


ufo.isna().sum() # bool 可以求和
ufo.isna().mean()


# ### 删除重复值

# In[ ]:


np.random.seed(5)
df = pd.DataFrame(np.random.randint(5, size=(6, 5)), columns=list('ABCDE'))
display(df)
df.drop_duplicates("A", keep='first')                       # 删除重复行，保留前面


# ### 数据填充

# In[ ]:


df = pd.DataFrame({'From_To': ['LoNDon_paris', 'MAdrid_miLAN', 'londON_StockhOlm',
                               'Budapest_PaRis', 'Brussels_londOn'],
                   'FlightNumber': [10045, np.nan, 10065, np.nan, 10085],
                   'RecentDelays': [[23, 47], [], [24, 43, 87], [13], [67, 32]],
                   'Airline': ['KLM(!)', '<Air France> (12)', '(British Airways. )',
                               '12. Air France', '"Swiss Air"']})
df


# In[ ]:


df['FlightNumber'] = df['FlightNumber'].interpolate().astype(
    int)       # interpolate  上下采样
df


# ## 字符串

# ### 字符替换

# In[83]:


s.str.replace('dog','python')


# In[ ]:


# map:适用于Series，applay:行或列 applaymap：df
# 将priority列中的yes, no替换为布尔值True, False
df.priority = df['priority'].map({'yes': True, 'no': False})
df


# ### 字符拆分

# In[157]:


df = pd.DataFrame({
    'name': ['John Arthur Doe', 'Jane Ann Smith'],
    'location': ['Los Angeles, CA', 'Washington, DC']
})
df


# In[158]:


df.name.str.split(' ', expand=True)

df[['first', 'middle', 'last']] = df.name.str.split(' ', expand=True)
df

df.location.str.split(',', expand=True)

df['city'] = df.location.str.split(',', expand=True)[0]
df


# ## 合并：

# ### concat（行列）

# In[45]:


df1 = pd.DataFrame(np.random.randn(4, 4),index=list('ABCD'),columns=list('abcd'))
df2 = pd.DataFrame(np.random.randint(1,10,(4, 4)),index=list('BCDE'),columns=list('bcde'))

# pieces = [df[:3], df[3:7], df[7:]] #  break it into pieces

display(pd.concat([df1,df2],axis=1,sort=True))
display(pd.concat([df1,df2],axis=0,sort=True))
# display(pd.concat([df1,df2],axis=1,join='outer'))
# pd.concat([df1,df2],axis=1,join='inner')


# ### merge（列）

# In[92]:


# Join: SQL style merges

Left = pd.DataFrame({'key': ['foo', 'foo'], 'lval': [1, 2]})
Right = pd.DataFrame({'key': ['foo', 'foo'], 'rval': [4, 5]})


# In[93]:


pd.merge(Left, Right, on='key')


# In[94]:


pd.merge(Right, Left, on='key')


# ### append（行）

# In[88]:


df = pd.DataFrame(np.random.randn(10, 4),columns= list("ABCD"))
df


# In[90]:


s = df.iloc[3]
df = df.append(s,ignore_index=False) # 保留原来index
df


# ## 矫形:stack

# In[46]:


tuples = list(zip(['bar', 'bar', 'baz', 'baz','foo', 'foo', 'qux', 'qux'],      
                  ['one', 'two', 'one', 'two','one', 'two', 'one', 'two']))  # 生成多重索引
index = pd.MultiIndex.from_tuples(tuples, names=['first', 'second'])
df = pd.DataFrame(np.random.randn(8, 2), index=index, columns=['A', 'B'])
df


# In[48]:


df1 = df[:4]


# In[49]:


df2 = df1.stack() # 宽表变为长表
df2


# In[50]:


#  逆操作
# df2.unstack()
df2.unstack(1)
# df2.unstack(0)


# ### 重塑多重索引

# In[ ]:


titanic.groupby(['Sex', 'Pclass']).Survived.mean()

titanic.groupby(['Sex', 'Pclass']).Survived.mean().unstack()


# In[51]:


letters = ['A', 'B', 'C']
numbers = list(range(4))

mi = pd.MultiIndex.from_product([letters, numbers])             # 生成 MultiIndex
display(mi)
s = pd.Series(np.random.rand(12), index=mi)
s


# ## 数据透视表:Pivot Tables

# In[135]:


# 数据透视表，可以动态地改变它们的版面布置，以便按照不同方式分析数据，也可以重新安排行号、列标和页字段。每一次改变版面布置时，数据透视表会立即按照新的布置重新计算数据。

df = pd.DataFrame({'A' : ['one', 'one', 'two', 'three'] * 3,
                'B' : ['A', 'B', 'C'] * 4,
                'C' : ['foo', 'foo', 'foo', 'bar', 'bar', 'bar'] * 2,
                'D' : np.random.randn(12),
                'E' : np.random.randn(12)})

pd.pivot_table(df,"D",['A','B'],['C'])
# pd.pivot_table(df,values='D',index=['A','B'],columns=['C'])


# In[ ]:


titanic.pivot_table(index='Sex',
                    columns='Pclass',
                    values='Survived',
                    aggfunc='count',
                    margins=True)


# ## 时间序列

# In[1]:



rng = pd.date_range('1/1/2012', periods=100, freq='S')


ts = pd.Series(np.random.randint(0, 500, len(rng)), index=rng)

ts.resample('5Min').sum()


# ## 分类

# In[137]:


df = pd.DataFrame({"id":[1,2,3,4,5,6], "raw_grade":['a', 'b', 'b', 'a', 'a', 'e']})
df


# In[138]:


df["grade"] = df["raw_grade"].astype("category")
df


# In[139]:


# 将类别重命名为更有意义的名称(分配给Series.cat)
# 在.cat系列下的方法默认情况下返回一个新系列
df["grade"].cat.categories = ["very good", "good", "very bad"]
df


# In[140]:


# 排序是按类别中的顺序进行的，而不是按词法顺序

df.sort_values(by="grade")
# 按分类列分组也会显示空类别


# In[141]:


df.groupby("grade").size()


# ### 把连续型数据转换为类别型数据

# In[ ]:


pd.cut(titanic.Age,
       bins=[0, 18, 25, 99],
       labels=['child', 'young adult',
               'adult']).head(10)  # cut:label the age ranges


# ## 综合处理

# In[72]:


# 一个全数值DatraFrame，每个数字减去该行的平均数
np.random.seed(5)
df = pd.DataFrame(np.random.randn(6, 5), columns=list('ABCDE'))
display(df)
df = df.apply(lambda x: x-x.mean(), axis=1)
df


# In[52]:


# df.sum().idxmin()      # 求哪一列的和最小 或者如下
np.random.seed(10)
df = pd.DataFrame(np.random.randn(6, 5), columns=list('ABCDE'))
df.columns[df.sum().min() == df.sum()].tolist(
)                      # columns.tolist()


# In[63]:


df.columns[[df.sum().values.argmin()][0]]


# In[64]:


### 有列A, B，A的值在1-100（含），对A列每20步长，求对应的B的和

df = pd.DataFrame({'A': [1, 2, 11, 11, 33, 34, 35, 40, 79, 99],
                   'B': [1, 2, 11, 11, 33, 34, 35, 40, 79, 99]})
df


# In[78]:


df['label']=pd.cut(df.A,list(range(0,100,20)))


# In[79]:


df


# In[80]:


df.groupby('label')['B'].sum()


# In[7]:


# 一个全数值的DataFrame，返回最大3个值的坐标
np.random.seed(5)
df = pd.DataFrame(np.random.random(size=(5, 3)))
# unstack: 拉成一列相当于matlab[:]   # index.tolist：返回index
df.unstack().sort_values()[-3:].index.tolist()


# In[8]:


np.random.seed(5)
df = pd.DataFrame(np.random.random(size=(5, 3)))
df


# In[9]:


df.unstack().nlargest(3).index.tolist()


# ### 计算3位滑动窗口的平均值，忽略NAN

# In[11]:


df = pd.DataFrame({'group': list('aabbabbbabab'),
                   'value': [1, 2, 3, np.nan, 2, 3, np.nan, 1, 7, 3, np.nan, 8]})
df


# In[12]:


g1 = df.fillna(0).groupby(['group'])[
    'value']                                       # 空值填充
s = g1.rolling(3, min_periods=1).sum() /     g1.rolling(3, min_periods=1).count()           # 滚动窗口 :rolling(3,min_periods=?)
s.reset_index(level=0, drop=True).reset_index(drop=True)


# In[14]:


g1.rolling(3, min_periods=1).mean()


# In[17]:


s = [1,2,3,5,None,10,12,14,12,30]
pd.Series(s).rolling(3,min_periods=2).mean()


# ### 用一个 DataFrame 输出合并聚合结果

# In[ ]:


total_price = orders.groupby('order_id').item_price.transform(
    'sum')  # transform():performs the same shape
len(total_price)

orders['total_price'] = total_price
orders.head(10)

orders['percent_of_total'] = orders.item_price / orders.total_price
orders.head(10)


# ### 把 Series 里的列表转换为 DataFrame

# In[100]:


df = pd.DataFrame({
    'col_one': ['a', 'b', 'c'],
    'col_two': [[10, 40], [20, 50], [30, 60]]
})
df


# In[101]:


df1 = df.col_two.apply(pd.Series)

pd.concat([df, df1], axis='columns')


# ## 更改显示选项

# In[ ]:


pd.set_option('display.float_format', '{:.2f}'.format)

pd.reset_option('display.float_format')  # reset
titanic.head()


# ## 优化内存

# In[ ]:


drinks.info(memory_usage='deep')

cols = ['beer_servings', 'continent']                         # set usecols only
small_drinks = pd.read_csv('data/drinks.csv', usecols=cols)
small_drinks.info(memory_usage='deep')

dtypes = {'continent':'category'}
smaller_drinks = pd.read_csv('data/drinks.csv', usecols=cols, dtype=dtypes)
smaller_drinks.info(memory_usage='deep')


# ## 可视化2组数据，共用X轴，但y轴不同

# In[22]:


df = pd.DataFrame({"revenue": [57, 68, 63, 71, 72, 90, 80, 62, 59, 51, 47, 52],
                   "advertising": [2.1, 1.9, 2.7, 3.0, 3.6, 3.2, 2.7, 2.4, 1.8, 1.6, 1.3, 1.9],
                   "month": range(12)})
df


# In[23]:


# df.plot('month', ['revenue', 'advertising'], color=['green', 'red'])
ax = df.plot.bar("month", "revenue", color="green")
# 二图合一：secondary_y = True, ax = ax
df.plot("month", "advertising", secondary_y=True, ax=ax)
# ax.set_xlim((-1, 12))


# In[ ]:




