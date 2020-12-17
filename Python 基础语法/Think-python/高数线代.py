# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'

# %%
#符号计算，果断sympy
from sympy import *
import pprint as pp
import numpy as np

x = Symbol('x')
y,z=symbols("y z")


# %%
# 求极限
pp.pprint(limit(1/x,x,-oo))

#微分
pprint(diff(1/(1+x*y**2),y),'\r')

#泰勒展开
pprint(series(E**z*sin(z),z,0,4))


# %%
#积分
pprint(integrate(exp(-x**2 - y**2),(x, -oo, oo),(y, -oo, oo)))


# %%
# 解方程
a,b,c = symbols("a b c ")
my_eq = Eq(a*x**2+b*x+c,0)
solve(my_eq,x)


# %%
# 微分方程：dsolve
import sympy as sy

def differential_equation(x,f):
    return sy.diff(f(x),x,2)+f(x)#f(x)''+f(x)=0 二阶常系数齐次微分方程
x=sy.symbols('x')#约定变量
f=sy.Function('f')#约定函数
print(sy.dsolve(differential_equation(x,f),f(x)))#打印
sy.pprint(sy.dsolve(differential_equation(x,f),f(x)))#漂亮的打印


# %%
