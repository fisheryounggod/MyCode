# 读取文件

f = open("/Users/mac/MyPrograme/project1/foo.txt")  # 返回一个文件对象

line = f.readline()

while line:
    print(line, end='')  # 忽略换行符
# f.close()

# 用迭代更简洁
for line in f:
    print(line, end='')
f.close()
