一、列表的创建方式

1. 用[ ]创建列表
# %%
a = [1, 2, 3]
display(a)

2. 用list()函数创建列表
# %%
b = list('abcdefg')
display(b)

3. 用range()函数创建整数列表
# %%
c = list(range(10))
display(c)

4. 用列表推导式创建列表
# %%
d = [i for i in range(10)]
display(d)

5. 用list()函数和[ ]创建空列表
# %%
e = list()
f = []
display(e, f)


二、列表中添加元素

1. append():真正的在列表尾部添加元素，速度最快，推荐使用
# %%
a = []
for i in range(10):
    a.append(i)
    # display(id(a)
display(a)
display(id(a))

2. extend()方法：将一个列表的元素，添加到另外一个列表元素的尾部
# %%
a = list('helloworld')
b = list('nihao')
display(a+b)
a.extend(b)
display(a, b)

3. 下面这些知识点要注意使用
# %%
insert()、remove()、pop()、del()在涉及大量元素时，尽量避免使用。因为，这些操作会让列表元素进行大面积移动，影响处理速度。
使用"+"、"*"这样的操作符扩展列表，也会使得列表存储地址前后发生改变，属于创建了新列表，增加了内存。在涉及大量元素时，不建议使用。

三、列表中元素排序

1. sorted(x)函数
# %%
a = [20, 10, 40, 30]
display(id(a))
b = sorted(a)
display(b)
display(id(b))


2.x.sort()方法
# %%
c = [50, 30, 20, 100]
display(id(c))
c.sort()
display(c)
display(id(c))

3.分析比较
# %%
    * orted()函数属于python内置函数，sort()函数属于列表对象中的一个方法。
    * x.sort()属于原地修改列表的排序方法，sorted(x)属于建立新列表的排序方法。
    * x.sort()由于是原地修改列表的排序方法，因此不能用其他变量去接收排序结果，sorted(x)属于建立新列表的排序方法，因此需要创建一个新的变量接收这个变量。

四、字典的创建方法

1. 直接使用{ }创建字典
# %%
a = {"姓名": "张三", "年龄": 25, "职务": "老师"}
display(a)

2. 使用dict()函数创建字典
# %%
b = dict(姓名="张三", 年龄=25, 职务="老师")
display(b)

c = dict([("name", "黄伟"), ("age", 18), ("job", "teacher")])
display(c)

3. zip()函数：利用两个列表创建字典
# %%
l1 = ["name", "age", "job"]
l2 = ["黄伟", 18, "teacher"]
d = dict(zip(l1, l2))
display(d)

4. 使用{ }和dict()创建空字典
# %%
e = {}
f = dict()
display(e, f)

5. 使用fromkeys()函数创建值为空的字典
# %%
list1 = ["name","age","job"]
g = dict.fromkeys(list1)
display(g)


五、字典的访问方式

1.get()：强烈推荐的字典键值访问方式
# %%
display(d.get('name'))
display(d.get('age'))
display(d.get('weight'))   # 返回None，不报错

2. items()：获取字典中的键值对
# %%
display(d.items())
display(d.keys())
display(d.values())

六、"+"与"join"拼接字符串比较
    * 字符串进行拼接时，推荐使用"join"，少用"+"
# %%
import time
t1 = time.time()
s = ""
for i in range(1000000):
    s += "哈哈"
t2 = time.time()
display("用时：" + str(t2-t1))
t3 = time.time()
l = []
for i in range(1000000):
    l.append("哈哈")
m = "".join(l)
t4 = time.time()
display("用时：" + str(t4-t3))

七、字符串驻留机制

    1. 字符串驻留机制的含义

Python支持字符串驻留机制，对于符合标识符的字符串（注意：仅仅包含下划线_、字母、数字），才会启用字符串驻留机制。此时，保存一份相同且不可变的字符串，不同的值被存在驻留池中，因此，它们还是同一个东西。

    2. “is"和”=="的不同点

"=="用于判断两个对象的内容是否相同，只关注两个对象的值是否相等。
"is"是用于判断两个对象的内存地址是否相同，真正判断两个对象是不是同一个对象。
因此，is的要求更高，不仅要求值一样，同时还要求对象内存地址也是一样。
# %%
p = 'ab#'
q = 'ab#'
display(id(p),id(q))
display(p == q)
display(p is q)

# %%
m = '12_abv'
n = '12_abv'
display(id(m))
display(id(n))
display(m == n)
display(m is n)
p = 'ab#'
q = 'ab#'
display(id(p))
display(id(q))
display(p == q)
display(p is q)

# %%
