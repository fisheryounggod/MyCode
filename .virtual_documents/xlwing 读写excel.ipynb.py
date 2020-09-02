pwd 


import xlwings as xw
# 打开一个新的 workbook 


## 创建新的Excel文件
# 方法1：
# 创建一个新的App，并在新App中新建一个Book
wb = xw.Book('1.xlsx')



# 方法2：上述代码是创建应用打开Excel的，这种方式打开之后需要进行关闭。
# 当前App下新建一个Book
# visible参数控制创建文件时可见的属性
app=xw.App(visible=False,add_book=False)
wb=app.books.add()
# wb.save('1.xlsx')
# wb.close()
# app.quit() #结束进程


# 打开第一个 sheet
wb.sheets[0]


# 打开名字为 "xchaoinfo" sheet
sheet = wb.sheets["xchaoinfo"]


# 打开当前活动的 sheet
sht = wb.sheets.active


sht.range('A1').value


wb.sheets[0].range('a10').options(expand='table').value=[[3,1],[2,5]] #写入数组


wb.sheets[0].range('A1').options(transpose=True).value=[[1,1],[7,7]]  #转置写入数组


display(wb.sheets[0].range('A1:c3').value)


wb.sheets[0].range('a15').row  #获取行号


wb.sheets[0].clear_contents()  #清空内容


df = pd.DataFrame([[1,2], [3,4]], columns=['a', 'b'])
df 


sht.range('A1').value = df # 数据类型的双向转换


ws = wb.sheets['Sheet1']


# 获取"A2"单元格的行标和列标
print(ws.range('A2').row)
print(ws.range('A2').column)
# 高度和宽度
print(ws.range('A2').row_height)
print(ws.range('A2').column_width)
# 设置颜色,可根据RGB颜色表寻找自己想要的颜色
ws.range('A2').color = (255,0,0)
# 获取颜色
print(ws.range('A2').color)
# 清除颜色格式
ws.range('A2').color = None
# 使用公式
ws.range('A2').formula='=SUM(A1,A2)'
# 另外还可以获取某一个单元格的公式
print(ws.range('A2').formula_array)
# 清除工作表的所有内容但是保留原有格式
ws.clear_contents()
# 当然了还有很多其他的属性
#range.address        range.current_region    range.end
#range.api            range.autofit          range.expand          


ws.used_range.shape


import xlwings as xw
app1 = xw.App(visible=False)



xw.apps.active # 返回活动的应用程序


xw.apps.count  #活动应用程序的key


（1）wb.app.calculate()               # Calculates all open books.
（2）wb.app.calculation = ‘manual’    # 设置计算模式
（3）wb.app.display_alerts = True     # 默认值为True。False的情况下执行操作的时候会忽略Excel的提示和警报消息(即弹窗信息)    
（4）wb.app.screen_updating = False   # 禁止屏幕更新(刷新)
（5）wb.app.range(cell1, cell2=None)  # 获取单元格
（6）wb.app.selection                 # 将所选单元格作为Range返回
（7）xw.App().version                 # 返回Excel程序版本号


wb = xw.Book('1.xlsx')    #以xw.Book()方式打开工作簿


wb.sheets         #查看当前工作簿的所有Sheet详情



wb.sheets.active  #激活一个Sheet发现是Sheet2


# 在Sheet1前新增一个Sheet并命名：wb.sheets.add(name= None,before = None,after = None)
wb.sheets.add(name='Python知识学堂', before='Sheet1')


sht=wb.sheets.active   #激活Sheet页，这个Sheet是新增的 


sheet = wb.sheets['Sheet1']    # 引用工作表Sheet1
sheet.active                   #获取当前活跃的工作簿
sheet.autofit()                #在整个工作表上自动调整宽度,可传参数
sheet.autofit(axis='c')        # 在整个工作表上自动调整列的宽度
sheet.autofit(axis='r')        # 在整个工作表上自动调整行的宽度
sheet.book                     # 返回指定Sheet的book,输出 <Book [2.xlsx]>
sheet.cells                    # 返回一个Range对象，该对象表示Sheet上的所有单元格（而不仅仅是当前正在使用的单元格）输出<Range [2.xlsx]Sheet1get_ipython().getoutput("$1:$1048576>")
sheet.name                     # 获取工作表的名称
sheet.name = '我爱python知识学堂'# 工作表重命名
sheet.clear()                  # 清空工作表中的内容和格式
sheet.index                    # 返回对应sheet的索引值，从0计数
sheet.delete()                 # 删除工作表
sheet.clear_contents()         # 清除工作表的内容，但保留格式
# 工作表sheet中有数据区域最大的行数，法1
sheet['a1048576'].end('up').row           
# 工作表sheet中有数据区域最大的行数，法2
sheet.used_range.last_cell.row
# 工作表sheet中有数据区域最大的列数，法1
sheet['xfd1'].end('left').column
# 工作表sheet中有数据区域最大的列数，法2                           
sheet.used_range.last_cell.column        


# 取值
sheet.cells(行号,列号).value


sht.api.used_range


sht


sht.insert   # 插入行，在第2-4行插入空白行


xw.Range('A1')                # 引用A1单元格
xw.Range('A1').value          # 取A1单元格的值,输出1.0
xw.Range('A1').value = 12     # 设置值
xw.Range('A1').raw_value      # 直接获取并设置所使用（pywin32）引擎发送/接受的值，而无需进行任何xlwings数据清理/转换。
xw.Range ('A1:B2').value      # 引用区域并取值，输出[[1.0, 9.0],[2.0, 10.0]]，以二元list形式
# 与上述等效
xw.Range ((1,1), (2,2)).value   
# 与上述等效
xw.Range (('A1'), ('B2')).value 
# 添加超链接
xw.Range ('A9').add_hyperlink(address='www.baidu.com') 
xw.Range ('A10').address      # 返回表示范围参考的字符串值，输出 $A$10
xw.Range ('A1').api           # 返回所使用引擎的本机对象
xw.Range ('A1').autofit()     # 自动调整范围内所有单元格的宽度和高度。
# 如果仅自动调整列的宽度，使用sheet.range('A1:B2').columns.autofit()
# 如果仅自动调整行的高度，使用 sheet.range('A1:B2').rows.autofit()
xw.Range ('A1').clear()       # 清除所选择单元格的内容和格式，可选择范围
# 清除范围的内容，但保留格式。
xw.Range ('A1').clear_contents()   
xw.Range ('A1').color         #获取A1单元格的背景色。
#设置A1单元格的背景色，RGB颜色
xw.Range ('A1').color = (255,255,255)  
xw.Range ('A1').color = None  #删除背景色
xw.Range ('B1:C4').column     # 返回所选范围第一列的列标，此处输出2
xw.Range ('B2:C4').row        # 返回所选范围第一行的行标，此处输出2
xw.Range ('A1:B2').count      # 返回所选范围单元格数量，此处输出4
# 此属性返回一个Range对象，该对象表示由（但不包括）空白行和空白列或工作表的边缘的任意组合限制的范围，好比是一片连接的区域
xw.Range ('A1').current_region  
xw.Range ('A1').delete()      # 删除单元格A1,有参数left和up，如delete('up')。如果省略，Excel将根据范围的形状进行决定。
xw.Range ('A1').end('down')   # 返回一个Range对象，该对象表示包含源范围的区域末尾的单元格。此处输出<Range [3.xlsx]Sheet1get_ipython().getoutput("$A$8>，参数可传down,up,left,right，其实也是返回ctrl + 方向")
# 设置A9单元格公式计算的值
xw.Range ('A9').formula='=SUM(B1:B5)'
# 输出公式值，输出'=SUM(B1:B5)'
print(xw.Range ('A9').formula)       
# 以指定的格式返回范围的地址
xw.Range ('A1:B2').get_address()  
#参数：
#row_absolute(bool ,默认为True)–设置为True可以将引用的行部分作为绝对引用返回。#column_absolute(bool,默认为True)–设置为True可以将引用的列部分作为绝对引用返回。
#include_sheetname(bool ,默认为False)–设置为True可以在地址中包含工作表名称。
#external(bool ,默认为False)–设置为True以返回带有工作簿和工作表名称的外部引用。
#具体的情况大家可以传入几个参数试试
xw.Range ('A1:B2').height     # 返回单元格(范围)的高度
xw.Range ('A1:B2').width      # 返回范围的宽度
# 获取范围的高度（以磅为单位）
xw.Range ('B2:C4').row_height      
# 设置范围的高度（以磅为单位）
xw.Range ('B2:C4').row_height = 15 


xw.Range('A1:C1').options(ndim=2).value


xw.Range('B2:C4').options(ndim=2).value


wb.sheets[0].shapes.count   # 返回集合中的对象数，输出1


wb.sheets[0].shapes         # 输出Shapes


import xlwings as xw
sheet = xw.Book('4.xlsx').sheets[0]
#新增chart
chart = sheet.charts.add()                        
#数据源：sheet.range('A1:B7')，或者sheet.range('A1').expand()
chart.set_source_data(sheet.range('A1').expand())  
chart.chart_type = 'line' 
#设置图标的类型，此处为线型，具体的类型查看office官网VBA操作的手册
#标题名称
title='python知识学堂粉丝数'                    
chart.api[1].SetElement(2)
#设置标题名称
chart.api[1].ChartTitle.Text =title          
chart.api[1].SetElement(302)                  #横线
#横轴标题名称
chart.api[1].Axes(1).AxisTitle.Text = "日期"  
chart.api[1].SetElement(311)
chart.api[1].Axes(2).AxisTitle.Text = "粉丝数" #纵轴标题名称


import os
import xlwings as xw
def my_macro():
    sheet = xw.Book.caller().sheets[0]
    sheet.range('A1').value = '我爱python知识学堂'
if __name__ == '__main__':
    xw.Book('文献分词.xlsx').set_mock_caller()     # 设置调用者
my_macro()


import xlwings as xw


def main():
    wb = xw.Book.caller()
    sheet = wb.sheets[0]
    if sheet["A1"].value == "Hello xlwingsget_ipython().getoutput("":")
        sheet["A1"].value = "Bye xlwingsget_ipython().getoutput(""")
    else:
        sheet["A1"].value = "Hello xlwingsget_ipython().getoutput(""")


if __name__ == "__main__":
    xw.Book("./data/myproject.xlsm").set_mock_caller()
    main()

