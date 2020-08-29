class stock(object):
    '''
    stock类中包含属性code和price
    '''
    def __init__(self,code,price):
        self.code=code
        self.price=price
#查看类中的注释内容
print(stock.__doc__)