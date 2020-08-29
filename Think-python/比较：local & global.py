
#%%  全局变量 & 局部变量
n = 1   # n 是全局变量
def func(a,b):
      # global c   #声明c为全局变量
      c = a*b     #c 是局部变量，a,b也是局部变量
      return c

s = func("knock~",2)
print(c)
