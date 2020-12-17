1. 函数，就是一段可以实现某种功能的代码，基本作用有两个
    其一：指令重复利用
    其二：模块化编程

2. 函数的定义

def 函数名称（参数值1[，参数值2，… ]）:
"""  函数注释  """
        功能代码块
        return [返回值1，返回值2，… ]

3. 函数三要素：

函数名    函数体    返回值

注意事项：
    1）. 函数名称必须唯一，由数字、字母、下划线组成，且数字不打头，最好见名知义；
    2）. 参数值可有可无，根据函数设计需要进行舍留，若存在多个参数，以逗号作分隔；
    3）. 不论是return还是返回值（默认None），均可不写，多个返回值，以逗号作分割。


4. 局部变量与全局变量

    局部变量：某个变量只有在该函数内使用
    全局变量：某个变量的影响范围是在整个程序

5. 匿名函数是指一个没有名称的函数。

    Python 使用def定义一般函数
    匿名函数则是使用lambda来定义
    * 通常会将匿名函数与Python的内置函数filter()、map()等一起使用,此时匿名函数将只是这些函数的参数

匿名函数: lambda arg1[, arg2 , … ,argn ] : expression
#%% 定义lambda函数,实现计算平方值
square = lambda x: x**2
# 输出平方值
print(square(10))

#%% 匿名函数使用与filter():求列表中的奇数
mylist = [1,2,3,4,5]
result = list(filter(lambda x:(x % 2 == 1), mylist))
print("奇数列表：",result)

#%% 匿名函数使用与map():求列表的平方值
squarelist = list(map(lambda x: x**2, mylist))
print("列表的平方值：",squarelist)


# %%
练习1：
使用列表生成式生成2-100的偶数列表，然后给每个偶数减1变为奇数列表。

练习2：
从上述问题答案生成的奇数列表中，找出介于40-80之间的奇数。
#%%
lis = [2*i for i in range(1,51)]
lis2 = list(map(lambda x:x-1,lis))
print(lis2)

result = list(filter(lambda x:(x>40 and x<80), lis2))
print(result)

# %%
