#%% return和break的比较：

def fn4():
    for i in range(5):
        if i == 3:
        #break用于退出当前循环
            break
        print(i)
    print('Loop ends')
fn4()

#%%
def fn4():
    for i in range(5):
        if i == 3:
        #return用来结束函数
            return
        print(i)
    print('Loop ends')
fn4()
#%%
