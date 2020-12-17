# -*- coding: utf-8 -*-
"""
@Author: Lemonbit
@出品：Python数据之道
@Homepage: liyangbit.com
"""

from bs4 import BeautifulSoup
import pandas as pd

path = r'./test.xml'

htmlfile = open(path, encoding='utf-8')

htmlhandle = htmlfile.read()

soup = BeautifulSoup(htmlhandle, 'xml')

print(soup)

count = 0
# 构造一个空的 dataframe
result = pd.DataFrame({}, index=[0])

# 根据持仓数据表格，添加需要保存的字段（dataframe 的 列名称)
result['nameOfIssuer'] = ''
result['titleOfClass'] = ''
result['cusip'] = ''
result['value'] = ''
result['sshPrnamt'] = ''
result['sshPrnamtType'] = ''
result['investmentDiscretion'] = ''
result['otherManager'] = ''
result['votingAuthority-Sole'] = ''
result['votingAuthority-Share'] = ''
result['votingAuthority-None'] = ''

new = result
for item in soup.find_all('infoTable'):
    nameOfIssuer = item.find('nameOfIssuer').get_text()
    new['nameOfIssuer'] = nameOfIssuer
    titleOfClass = item.find('titleOfClass').get_text()
    new['titleOfClass'] = titleOfClass
    cusip = item.find('cusip').get_text()
    new['cusip'] = cusip
    value = item.find('value').get_text()
    new['value'] = value
    sshPrnamt = item.find('shrsOrPrnAmt').find('sshPrnamt').get_text()
    new['sshPrnamt'] = sshPrnamt
    sshPrnamtType = item.find('shrsOrPrnAmt').find('sshPrnamtType').get_text()
    new['sshPrnamtType'] = sshPrnamtType
    investmentDiscretion = item.find('investmentDiscretion').get_text()
    new['investmentDiscretion'] = investmentDiscretion
    otherManager = item.find('otherManager').get_text()
    new['otherManager'] = otherManager
    Sole = item.find('votingAuthority').find('Sole').get_text()
    new['votingAuthority-Sole'] = Sole
    Shared = item.find('votingAuthority').find('Shared').get_text()
    new['votingAuthority-Share'] = Shared
    Non = item.find('votingAuthority').find('None').get_text()
    new['votingAuthority-None'] = Non

    count += 1
    result = result.append(new, ignore_index=True)

print(count)

print(result)

# 保存数据到 Excel 表格
result.to_excel('BRKA-2019-Q4.xlsx')

