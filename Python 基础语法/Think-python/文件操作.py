#%% 读取和写入
# write 的参数必须是字符串
fout = open("output.txt", "w")  # 有则清空，无则新建

line1 = "This here's the wattle,\n"
fout.write(line1)
# 24   返回值是被写入字符的个数

# %%
line2 = "The emblem of ourland.\n"
fout.write(line2)

# %%
fout.close()  # 用完关闭是个好习惯

# %%
fout = open("output2.txt", "w")
x = 52
fout.write(str(x))

# %%
import os
cwd = os.getcwd()
cwd

# %%
os.path.abspath('output.txt')

# %% 遍历一个目录并打印
def walk(dirname):
    for name in os.listdir(dirname):
        path = os.path.join(dirname, name)
        if os.path.isfile(path):
            print(path)
        else:
            walk(path)

# %%
import os
cwd = os.getcwd()
cwd
walk(cwd)

# %% 捕获异常
try:
    fin = open('output.txt')
except:
    print("Something went wrong.")


# %% 文件内容输出

s = fin.read()
print(s)