#!/usr/bin/python
# -*- coding: UTF-8 -*-

#%%  random() 方法返回随机生成的一个实数，它在[0,1)范围内
import random

# 生成第一个随机数
print "random() : ", random.random()

# 生成第二个随机数
print "random() : ", random.random()


# %%  random() 函数中常见的函数如下：
import random

print( random.randint(1,10) )        # 产生 1 到 10 的一个整数型随机数
print( random.random() )             # 产生 0 到 1 之间的随机浮点数
print( random.uniform(1.1,5.4) )     # 产生  1.1 到 5.4 之间的随机浮点数，区间可以不是整数
print( random.choice('tomorrow') )   # 从序列中随机选取一个元素
print( random.randrange(1,100,2) )   # 生成从1到100的间隔为2的随机整数

a=[1,3,5,6,7]                        # 将序列a中的元素顺序打乱
random.shuffle(a)
print(a)

# %% Python 生成随机数、随机字符串
import random
import string

# 随机整数：
print random.randint(1,50)

# 随机选取0到100间的偶数：
print random.randrange(0, 101, 2)

# 随机浮点数：
print random.random()
print random.uniform(1, 10)

# 随机字符：
print random.choice('abcdefghijklmnopqrstuvwxyz!@#$%^&*()')

# 多个字符中生成指定数量的随机字符：
print random.sample('zyxwvutsrqponmlkjihgfedcba',5)

# 从a-zA-Z0-9生成指定数量的随机字符：
ran_str = ''.join(random.sample(string.ascii_letters + string.digits, 8))
print ran_str

# 多个字符中选取指定数量的字符组成新字符串：
print ''.join(random.sample(['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'], 5))

# 随机选取字符串：
print random.choice(['剪刀', '石头', '布'])

# 打乱排序
items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
print random.shuffle(items)

# %% numpy.random.randn

# randn函数返回一个或一组样本，具有标准正态分布。
# dn表格每个维度
# 返回值为指定维度的array
import numpy as np
display(np.random.randn(2,3))
# np.random.randn() # 当没有参数时，返回单个数据

#%% numpy.random.rand(d0,d1,…,dn)

# rand函数根据给定维度生成[0,1)之间的数据，包含0，不包含1
# dn表格每个维度
# 返回值为指定维度的array
display(np.random.rand(1,10))
np.random.rand(4,3,2) # shape: 4*3*2


# %%
np.random.randint(-5,5,size=(2,2))

# %%  numpy.random.seed()
# np.random.seed()的作用：使得随机数据可预测。
# 当我们设置相同的seed，每次生成的随机数相同。如果不设置seed，则每次会生成不同的随机数
np.random.seed(0)
np.random.rand(5)

# %%
