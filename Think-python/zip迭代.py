#!
# zip()函数用于将可迭代的对象(列表、元组)作为参数,将对象中对应的元素打包成一个个元组,然后返回由这些元组组成的列表。
# zip() 函数常与 for 循环一起搭配使用。
# zip
list1 = [1,2,3,4]
list2 = ['a','b','c','d']

for i in zip(list1,list2):
	print(i)

# zip
cup1 = (1,2,3,4)
cup2 = ('a','b','c','d')

for i in zip(cup1,cup2):
	print(i)