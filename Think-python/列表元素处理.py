1. 列表元素顺序反向
# %%
a = [1, 2, 3, 4]
# str(a[::-1])
print('反向：'+str(a[::-1]))
#%%
2. 在列表开头插入两个元素
# %%
a = [1, 2, 3, 4]
a[:0] = [-1, 0]
display(a)
#%%
3. 检查列表是否为空
#%%
names_list =[]

if len(names_list)==0:
    print("空")
if names_list ==[]:
    print("空")
if not names_list:
    print("空")
#%%

4. 列表推导式（替代循环）
#%%
[n**3 for n in range(10)]
#%%


5. 筛选:filter()函数
# %%
# 筛选列表奇数项
l = list(range(1,100))
# [n for n in l if n%2]
# filter 函数
list(filter(lambda x:x%2, l))
#%%

6. 映射：Map()
#%%
if __name__ == '__main__':
    t = ['hello', 'world', 'yarving']
    print(list(map(lambda x: x.capitalize(), t)))
"""
- 在cmd 中直接运行.py文件,则__name__的值是'__main__';

- 而在import 一个.py文件后,__name__的值就不是'__main__'了;

- 从而用if __name__ == '__main__'来判断是否是在直接运行该.py文件
"""
#%%
