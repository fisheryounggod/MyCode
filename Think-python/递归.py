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