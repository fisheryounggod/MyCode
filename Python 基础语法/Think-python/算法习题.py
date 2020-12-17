# 目录：

# Python 编程小练习

0. 冒泡排序
#%%
lis = [56,12,1,8,345,10,199,24,53,342,34,24,21]

def sortport():
    for i in range(len(lis)-1):
        for j in range(len(lis)-1-i):
            if lis[j] > lis[j+1]:
                lis[j],lis[j+1] = lis[j+1],lis[j]
    return lis

if __name__ == '__main__':
    sortport()
    print(lis)
#%%



1. 寻找水仙花数。

> 说明：水仙花数也被称为超完全数字不变数、自恋数、自幂数、阿姆斯特朗数，它是一个3位数，该数字每个位上数字的立方之和正好等于它本身，例如：$1^3 + 5^3+ 3^3=153$。

# %%
水仙花数 = []
for num in range(100,1000):
    a = num//100
    b = (num-100*a)//10
    c = (num-100*a-10*b)//1
    if a**3+b**3+c**3 == num:
        水仙花数.append(num)
print("水仙花数:" + str(水仙花数))
#%%


2. 百钱百鸡问题。

> 说明：百钱百鸡是我国古代数学家张丘建在《算经》一书中提出的数学问题：鸡翁一值钱五，鸡母一值钱三，鸡雏三值钱一。百钱买百鸡，问鸡翁、鸡母、鸡雏各几何？翻译成现代文是：公鸡5元一只，母鸡3元一只，小鸡1元三只，用100块钱买一百只鸡，问公鸡、母鸡、小鸡各有多少只？

# %%
# 公鸡：x 母鸡：y 小鸡：z
for x in range(100//5):
    for y in range(100//3):
        for z in range(300):
            if (x+y+z == 100) and (5*x+3*y+1/3*z == 100):
                print("公鸡：{},母鸡：{}, 小鸡：{}".format(x,y,z))
#%%


3. CRAPS赌博游戏
#
> 说明：CRAPS又称花旗骰，是美国拉斯维加斯非常受欢迎的一种的桌上赌博游戏。该游戏使用两粒骰子，玩家通过摇两粒骰子获得点数进行游戏。简单的规则是：玩家第一次摇骰子如果摇出了7点或11点，玩家胜；玩家第一次如果摇出2点、3点或12点，庄家胜；其他点数玩家继续摇骰子，如果玩家摇出了7点，庄家胜；如果玩家摇出了第一次摇的点数，玩家胜；其他点数，玩家继续要骰子，直到分出胜负。

# %%
import random
# x,y [1,6][1,6]
n = True
x,y = random.randrange(7),random.randrange(7)
dianshu = x+y
print('第1局点数为{}'.format(dianshu))
if (x+y == 7) or (x+y == 11):
    print("The winner is player")
    print("Game Over!")
    n = False

elif (dianshu == 2) or (dianshu == 3) or(dianshu == 12):
    print("The winner is banker")
    print("Game Over!")
    n = False

else:
    i = 2
    while n:
        x,y = random.randrange(7),random.randrange(7)
        print('第{}局点数为{}'.format(i,x+y))
        if (x+y == 7):
            print("The winner is banker")
            print("Game Over!")
            n = False
        elif (x+y == dianshu):
            print("The winner is player")
            print("Game Over!")
            n = False
        else:
            # print("Game Continue!")
            dianshu = x+y
            i += 1
#%%


4. 生成斐波那契数列的前20个数。
#
> 说明：斐波那契数列（Fibonacci sequence），又称黄金分割数列，是意大利数学家莱昂纳多·斐波那契（Leonardoda Fibonacci）在《计算之书》中提出一个在理想假设条件下兔子成长率的问题而引入的数列，所以这个数列也被戏称为"兔子数列"。斐波那契数列的特点是数列的前两个数都是1，从第三个数开始，每个数都是它前面两个数的和，形如：1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...。斐波那契数列在现代物理、准晶体结构、化学等领域都有直接的应用。
#

# %%
f = list(range(20))
f[0],f[1] = 1,1
for i in range(2,20):
    f[i] = f[i-1]+f[i-2]
print("斐波納契数列前二十项为："+str(f))
#%%


5. 找出10000以内的完美数。
#
> 说明：完美数又称为完全数或完备数，它的所有的真因子（即除了自身以外的因子）的和（即因子函数）恰好等于它本身。例如：6（$6=1+2+3$）和28（$28=1+2+4+7+14$）就是完美数。完美数有很多神奇的特性，有兴趣的可以自行了解。

# %%
# 定义函数求真因子
def factor(n):
    y = []
    for i in range(1,n):
        if n%i == 0:
            y.append(i)
    return y
# 定义函数求列表的和
def sum_list(f):
    sum = 0
    for i in f:
        sum += i
    return sum
# sumlist lambda l: sum += i for i in l
pnum = []
sum = 0
for num in range(10000):
    if (sum_list(factor(num)) == num):
        pnum.append(num)
print("10000以内完美数:%s"%(pnum))
#%%


6. 输出100以内所有的素数。
#
> 说明：素数指的是只能被1和自身整除的正整数（不包括1）。

# %%
sushu = []
for n in range(2,100):
    for i in range(2,n):
        if (n%i == 0):
            break
    else:
        sushu.append(n)
print("100 以内素数：%s \n总共%d个"%(sushu,len(sushu)))
#%%
7. 字符串反转

#%%
def reverse(s):
      if s =="":
            return s
      else:
            return reverse(s[1:])+ s[0]
str = input("请输入一个字符串：")
print(reverse(str))
#%%

8. 生成'田'形状
# %% 0.1
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
#%%

9. 九九乘法表
# %%
for i in range(1, 10):
    for j in range(1, i+1):
        print('{}x{}={}\t'.format(j, i, i*j), end='')
    print()
#%%

10. 科赫雪花
# %%
DrawKoch
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
#%%


11. 定义一个函数，将指定列表中的所有偶数，保存到新的列表中返回。

> 高级函数
特点：
1>.接受一个或多个函数作为参数；
2>.将函数作为返回值。
满足任意一个特点即为高级函数。
# %%
def even(l):
    l2 = []
    for i in l:
        if i%2 == 0:
            l2.append(i)
            # return(l2)  # return 结束函数，故后置
    return(l2)

t = list(range(100))
even(t)
#%%


12. 实现阶乘运算
# 用了递推原理，类似数学归纳法
递归：即递归式函数，

1>.递归简单说就是自己调用自己，递归式函数就是在函数中调用自己。
2>.递归时解决问题的一种方式，思想时将大的问题拆分成小的问题，直到不能再拆分。
3>. 递归式函数的两个条件：
    a.基线条件：
    问题可以分解成最小的问题，当满足基线条件时，递归不再执行。
    b.递归条件：
    将问题继续分解的条件。
#%%
def recursion(n):
    #基线条件
    if n == 1:
        return 1
    #递归条件
    return n * recursion(n - 1)
print(recursion(4))
#%%
def fact(n):
      if n==0:
            return 1
      else:
          return n * fact(n-1)

num = eval(input("请输入一个整数："))
print(fact(abs(int(num))))
#%%
# 定义阶乘
def factorial(n):
    result = 1
    for i in range(1,n+1):
        result *= i
    return result
print(factorial(10))
#%%


13. 统计字符出现频率
#%%
from collections import Counter
myList = [1,1,2,3,4,5,3,2,3,4,2,1,2,3]
print(Counter(myList))



#%%


14. 判断回文数（形如12321），数字由键盘输入
# %%
num = input('请输入一个数字：')
l = len(num)
num1 = list(num)
if l//2 ==0:
    l=int(l/2)
    if num1[:l+1]==num1[-l-1:][::-1]:
        print('{} 是一个回文数'.format(num))
    else:
        print('{} 不是一个回文数'.format(num))
else:
    l = int((l-l//2)/2)
    if num1[:l+1]==num1[-l-1:][::-1]:
        print('{} 是一个回文数'.format(num))
    else:
        print('{} 不是一个回文数'.format(num))

# %%
i = 0
while i<3:
    num = input("请输入需要判断的数字num=")
    if num == num[::-1]:
        print("您输入的数字%s是回文数" %num)
    else:
        print("您输入的数字不是回文数")
    i += 1
#%%


15. 提取列表中数字
# %%
q8 = ['a', 'b','c',1,2,3,4,5,'d','e']
[i for i in q8 if type(i)==int]
# %%


16. 计算形如q6 = 2 + 22 + 222 + 2222 + 22222 + ……的值，计算个数由键盘输入
# %%
m=int(input('请输入：m= '))
n=0
sum = 0
for i in range(1,m+1):
    n += 2*10**(i-1)
    sum += n
display(sum)
# %%


17. while:输出 2-3+4-5+6+...+100的和
# %%
n=2
sum=0
while n <=100:
    sum += n*(-1)**n
    n += 1
display(sum)
# %%

18. 从字典中找出value = 69的所有key值
# %%
q2 = {'Alan': 69, 'Bee': 69, 'CiCi': 96, 'David': 96, 'Eric': 69}
findkey = []
for key, value in q2.items():
    if value ==69:
        findkey.append(key)
display(findkey)
# %%


19. 将列表中的元素依次向前移动一个位置，第一个元素移到列表的最后？
# %%
q3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

q3[-1],q3[0]=q3[0],q3[-1]
for i in range(len(q3)-2):
    q3[i],q3[i+1]=q3[i+1],q3[i]
q3
# %%


#%%


# %%


# %%


# %%


# %%


# %%
