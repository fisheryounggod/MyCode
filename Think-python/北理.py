# To add a new cell, type '#%%'
# To add a new markdown cell, type '#%% [markdown]'
#%% [markdown]
# 北理工 python 课程
#%% Change working directory from the workspace root to the ipynb file location. Turn this addition off with the DataScience.changeDirOnImportExport setting
# ms-python.python added
import os
try:
	os.chdir(os.path.join(os.getcwd(), '../../../../../../var/folders/f4/vwn8qlbj0dgb2m77_9sh1m5m0000gn/T'))
	print(os.getcwd())
except:
	pass


#%%
print('Hello World!',end ='')
print('Hello Python World!',end ='!')


#%%    函数定义
def happy():
      print ("Happy birthday to you")
def happyB(name):
      happy()
      happy()
      print("Happy birthday, dear {}!".format(name))
      happy()
happyB("Mike")
print()
happyB("Lily")      


#%% 打印列表
spam = ['cat', 'dog', 'mouse']
for i in range(len(spam)):
  print(spam[i])


#%%  匿名函数  谨慎使用
y = lambda x,y :x+y   
y(20,34)


#%%  python3 中文字符可做变量名
地道 =  2
print(地道)


#%%    海龟做图
import turtle
def drawline(draw):
    turtle.pendown() if draw else turtle.pwnup()
    turtle.fd(40)
    turtle.right(90)


#%%  海龟做图
import turtle

# turtle.pendown() if draw else turtle.pwnup()
turtle.pensize(2)
turtle.pencolor("red")

turtle.fd(40)
turtle.left(90)
turtle.fd(40)
turtle.left(90)
turtle.fd(40)
turtle.left(90)
turtle.fd(80)
turtle.left(90)
turtle.fd(40)
turtle.left(90)
turtle.fd(40)


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


#%%  全局变量 & 局部变量
n = 1   # n 是全局变量
def func(a,b):
      # global c   #声明c为全局变量
      c = a*b     #c 是局部变量，a,b也是局部变量
      return c

s = func("knock~",2)    
print(c)  


#%%  对于列表，函数可以直接使用全局列表而不需采用global 
# 当内部存在一个真实创建过且名称为ls 的列表，则不会修改全局变量
ls = []
def funct(a, b):
      ls.append(b)
      return a*b

t = funct("knock~",2)
print(t,ls)


#%%  datetime 库
from datetime import datetime

# 获取当前时间和日期
today = datetime.now()

# 获取当前日期和时间对应的UTC(世界标准)时间
today1 =datetime.utcnow()

someday = datetime(2016,9,16,22,33,32,7)
someday
someday.year
someday.microsecond

# 采用ISO 8601 标准显示时间
someday.isoformat()    
# 根据日期计算星期后返回1~7
someday.isoweekday()   
# 根据字符串format 格式化————最有效
someday.strftime("%Y-%m-%d %H:%M:%S") 


# %%  日期格式化输出
from datetime import datetime
now = datetime.now()
now.strftime("%Y-%m-%d")
now.strftime("%A, %d. %B %Y %I:%M%p")
print("今天是{0:%Y}年{0:%m}月{0:%d}日".format(now))


# %% 递归：引用自身
# 用了递推原理，类似数学归纳法
def fact(n):
      if n==0:
            return 1
      else:
          return n * fact(n-1)

num = eval(input("请输入一个整数："))
print(fact(abs(int(num))))


# %% 字符串反转
def reverse(s):
      if s =="":
            return s
      else:
            return reverse(s[1:])+ s[0]
str = input("请输入一个字符串：")
print(reverse(str))            


#%% DrawKoch
import turtle

def koch(size, n):
      if n == 0:
            turtle.fd(size)
      else:
            for angle in [0, 60, -120, 60]:
                  turtle.left(angle)
                  koch(size/3, n-1)

def main():
      turtle.setup(600, 600)
      turtle.speed(10)                  
      turtle.penup()
      turtle.goto(-200, 100)
      turtle.pendown()
      turtle.pensize(2)
      level = 5
      koch(400, level)
      turtle.right(120)
      koch(400,level)            
      turtle.right(120)
      koch(400,level)            
      turtle.hideturtle()

main()

                
# %%
for i in range(1,10):
      for j in range(1,i+1):
            if i==j:
                  print("+")
            else:

            else:
                  print("-")
      print()

# %%九九乘法表
for i in range(1, 10):
    for j in range(1, i+1):
        print('{}x{}={}\t'.format(j, i, i*j), end='')
    print()

# %%
print ("+" + 4*" - " + "+" + 4*" - " + "+")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("+" + 4*" - " + "+" + 4*" - " + "+")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("|" + 12*" " + "|" + 12*" " + "|")
print ("+" + 4*" - " + "+" + 4*" - " + "+")


# %%
