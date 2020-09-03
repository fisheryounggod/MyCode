import re
pat = re.compile('A')
m = pat.search('CBA')
print(m)

m = pat.search("CBD")
print(m) #没有匹配到，返回None（False）


re.search('a','ASDasd')


re.split(',','"a,s,d,asd"')


import re

content = 'The 123456 is my one phone number.'
print(len(content)) #字符串长度
result = re.match(r'^The\s\d+\s\w*', content) #使用match匹配, 第一个参数为正则表达式, 第二个为要匹配的字符串
print(result)
print(result.group()) #输出匹配内容
print(result.span()) #输出匹配内容的位置索引


import re

content = 'The 123456 is my one phone number.'
print(len(content)) #字符串长度
result = re.match(r'^The\s(\d+)\sis', content) #使用match匹配, 第一个参数为正则表达式, 第二个为要匹配的字符串
print(result)
print(result.group()) #输出匹配内容
print(result.group(1)) #输出第一个被()包裹的内容
print(result.span()) #输出匹配内容的位置索引



import re

content = 'The 123456 is my one phone number.'
result = re.match(r'^The.*number.$', content) #使用match匹配, 第一个参数为正则表达式, 第二个为要匹配的字符串
print(result)
print(result.group()) #输出匹配内容
print(result.span()) #输出匹配内容的位置索引


import re

content = 'The 123456 is my one phone number.'
print('贪婪匹配:')
result = re.match(r'^The.*(\d+).*', content) #使用match匹配, 第一个参数为正则表达式, 第二个为要匹配的字符串
print(result.group()) #输出匹配内容
print('result = get_ipython().run_line_magic("s'%result.group(1))", " #输出第一个被()包裹的内容")
print('-'*20)
print('非贪婪匹配:')
result = re.match(r'^The.*?(\d+).*', content) 
print(result.group())
print('result = get_ipython().run_line_magic("s'%result.group(1))", "")


import re

content = '(百度)www.baidu.com'
result = re.match('(百度)www.baidu.com', content)

result2 = re.match('\(百度\)www\.baidu\.com', content)
if result:
    print(result.group())
else:
    print('result = None')
if result2:
    print(result2.group())
else:
    print('result2 = None')


import re

html = '''
<div id="songs-list">
<h2 class="title">歌单</h2>
<p class="introduction">歌单列表</p>
<ul id="list" class="list-group">
<li data-view="2">一路上有你</li>
<li data-view="7">
<a href="/2.mp3" singer="任贤齐">沧海一声笑</a>
</li>
<li data-view="4" class="active">
<a href="/3.mp3" singer="齐秦">往事随风</a>
</li>
<li data-view="6"><a href="/4.mp3" singer="beyond">光辉岁月</a></li>
<li data-view="5"><a href="/5.mp3" singer="程慧玲">记事本</a></li>
<li data-veiw="5">
<a href="/6.mp3" singer="邓丽君">但愿人长久</a>
</li>
</ul>
</div>
'''

result = re.findall('<li.*?href="(.*?)".*?singer="(.*?)">(.*?)</a>', html, re.S)
if result:
    print(result)
    for res in result:
        print(res[0], res[1], res[2])



import re

content = '54abc59de335f7778888g'
content = re.sub('\d+', '', content)
print(content)


"""
验证输入用户名和QQ号是否有效并给出对应的提示信息

要求：用户名必须由字母、数字或下划线构成且长度在6~20个字符之间，QQ号是5~12的数字且首位不能为0
"""
import re


def main():
    username = input('请输入用户名: ')
    qq = input('请输入QQ号: ')
    # match函数的第一个参数是正则表达式字符串或正则表达式对象
    # 第二个参数是要跟正则表达式做匹配的字符串对象
    m1 = re.match(r'^[0-9a-zA-Z_]{6,20}$', username)
    if not m1:
        print('请输入有效的用户名.')
    m2 = re.match(r'^[1-9]\d{4,11}$', qq)
    if not m2:
        print('请输入有效的QQ号.')
    if m1 and m2:
        print('你输入的信息是有效的get_ipython().getoutput("')")


if __name__ == '__main__':
    main()


import re


def main():
    # 创建正则表达式对象 使用了前瞻和回顾来保证手机号前后不应该出现数字
    pattern = re.compile(r'(?<=\D)1[34578]\d{9}(?=\D)')
    sentence = '''
    重要的事情说8130123456789遍，我的手机号是13512346789这个靓号，
    不是15600998765，也是110或119，王大锤的手机号才是15600998765。
    '''
    # 查找所有匹配并保存到一个列表中
    mylist = re.findall(pattern, sentence)
    print(mylist)
    print('--------华丽的分隔线--------')
    # 通过迭代器取出匹配对象并获得匹配的内容
    for temp in pattern.finditer(sentence):
        print(temp.group())
    print('--------华丽的分隔线--------')
    # 通过search函数指定搜索位置找出所有匹配
    m = pattern.search(sentence)
    while m:
        print(m.group())
        m = pattern.search(sentence, m.end())


if __name__ == '__main__':
    main()


import re


def main():
    sentence = '你丫是傻叉吗? 我操你大爷的. Fuck you.'
    purified = re.sub('[操肏艹]|fuck|shit|傻[比屄逼叉缺吊屌]|煞笔',
                      '*', sentence, flags=re.IGNORECASE)
    print(purified)  # 你丫是*吗? 我*你大爷的. * you.


if __name__ == '__main__':
    main()


import re


def main():
    poem = '窗前明月光，疑是地上霜。举头望明月，低头思故乡。'
    sentence_list = re.split(r'[，。, .]', poem)
    while '' in sentence_list:
        sentence_list.remove('')
    print(sentence_list)  # ['窗前明月光', '疑是地上霜', '举头望明月', '低头思故乡']


if __name__ == '__main__':
    main()





 import re

str="python知识学堂，python欢迎你"
result=re.findall('[^python]',str)

#反取 匹配除‘python’以外的字符 返回值是list
print(result)


import  re
str="python知识学堂，欢迎来到学堂"
print(re.findall("知识*",str)) #星号前面的一个字符可以是0次或多次，返回值是list
print(re.findall("学堂*",str)) #星号前面的一个字符可以是0次或多次，返回值是list


 import  re
str="python知识学堂，欢迎来到学堂"
print(re.findall("(知识)",str)) 
print(re.findall("(学堂)",str)) 



