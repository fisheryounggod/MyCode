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
sorted函数会把原来的列表进行排序然后再返回一个新的列表，而sort函数直接再原来的列表上面排序

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


# %%
