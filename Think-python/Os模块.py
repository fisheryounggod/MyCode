# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
import os

os.getcwd() #获得当前工作目录

os.listdir() # 列出某目录下所有的目录和文件

os.getenv('PATH')  #用来获得环境变量

os.environ["PATH"] #可以获取并修改环境变量

os.system('ping') #运行 Shell 或者 CMD 命令
#%%
path = '/Users/mac/MyPrograme/ShuJuFenXi/README.md'

os.path.split(path)[0] #获取文件路径
os.path.split(path)[1] #获取文件名
os.path.splitext(path)[0] #获取文件名和扩展名
#%%
os.chdir('/Users/mac/MyPrograme/ShuJuFenXi/') # 相当于cd
os.listdir()                    # 相当于ls

os.path.getsize('宏观经济学')

os.path.normpath(path) #专门用来规范路径

os.path.join(path,name) # 连接目录和文件名，提升跨平台性

os.path.dirname(path) #获取路径中的目录名

os.path.basename(path) #获取路径中的文件名

os.path.isfile(path) #判断路径是不是文件

os.path.isdir(path) #判断路径是不是目录

os.path.abspath("README") #获取绝对路径

os.remove() #删除文件

os.linesep #获取当前平台使用的行终止符

os.path.exists(path) #函数用来检验给出的路径是否真地存在


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

# %%
try:
    fin = open('output.txt')
except:
    print("Something went wrong.")

# %%
fin

# %%
