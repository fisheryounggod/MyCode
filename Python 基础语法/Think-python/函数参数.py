
#%% 可选参数
def dup (str, times = 2):
      print(str*times)
dup ("knock~")
dup ("knock~",5)

#%%  可变数量参数
def vfunc(a, *b):
      print(type(b))
      for n in b:
            a +=n
      return a,b,n    #return 可以返回多值
vfunc(1,2,3,4,5)


#%%  指定参数名称, 参数位置可调
def func(x1, y1, z1, x2, y2, z2):
      return
result = func(x2=4, y2=5, z2=6, x1=1, y1=2, z1=3)



#%%  对于列表，函数可以直接使用全局列表而不需采用global
# 当内部存在一个真实创建过且名称为ls 的列表，则不会修改全局变量
ls = []
def funct(a, b):
      ls.append(b)
      return a*b

t = funct("knock~",2)
print(t,ls)
