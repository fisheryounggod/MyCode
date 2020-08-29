冒泡排序
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
    print(lis)冒泡排序