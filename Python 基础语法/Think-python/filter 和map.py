

 筛选:filter()函数
# %%
# 筛选列表奇数项
l = list(range(1,100))
# [n for n in l if n%2]
# filter 函数
list(filter(lambda x:x%2, l))
#%%

映射：Map()
#%%
t = ['hello', 'world', 'yarving']
print(list(map(lambda x: x.capitalize(), t)))

# %%
