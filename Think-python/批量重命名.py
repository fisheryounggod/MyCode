# %% 批量重命名
import os
path = ('/users/mac/Desktop/wuhan/')

# 获取该目录下所有文件，存入列表中
f = os.listdir(path)
# %%
for i in f:

    # 设置旧文件名（就是路径+文件名）
    oldname = path+i
    # name = os.path.splitext(path)[0]
    # 设置新文件名
    newname = oldname[:-4]+'.txt'

    # 用os模块中的rename方法对文件改名
    os.rename(oldname, newname)
    print(oldname, '======>', newname)


# %% 合并文件

path = ('/users/mac/Desktop/wuhan/')

# 获取该目录下所有文件，存入列表中
filenames = os.listdir(path)

file = open('./result.txt', 'w')

# 遍历文件
for filename in filenames:
    filepath = path + filename
# 遍历单个文件，读取行数，写入内容
    for line in open(filepath):
        file.writelines(line)
        file.write('\n')
file.close()

# %%
