
*--------------------------
* 连玉君的 profile.do 文档
*--------------------------

* arlionn@163.com
* Version: 2020/2/11 9:46

* Homepage: https://gitee.com/arlionn/Course
* 知乎：https://www.zhihu.com/people/arlionn/



*-说明：
* 此文件设定了每次启动 stata 时需要做的一些基本设定
* 你可以在此文件中添加你希望在stata启动时立刻执行的命令

*-不要自动更新
  set update_query  off

*-系统参数设定			
  set type double           // 设定 generate 命令产生的新变量为双精度类型
  set matsize 800           // 设定矩阵的维度为 2000x2000
  set scrollbufsize 2000000 // 结果窗口中显示的行数上限
  set more off, perma       // 关闭分页提示符
  
  *-结果显示格式
  set cformat  %4.3f  //回归结果中系数的显示格式
  set pformat  %4.3f  //回归结果中 p 值的显示格式      
  set sformat  %4.2f  //回归结果中 se值的显示格式     

  *-有点危险的设定 (2020/2/11 9:41)
  *-目前来看，这些设定只会影响 -xtabond-, -xtdpd- 命令的执行
* set showbaselevels on, permanently
* set showemptycells on, permanently  // 2020/2/11 9:33 请务必删除/关闭这条设定，否则会导致 xtabond 和 xtdpd 命令报错
* set showomitted off, permanently     // 2020/2/11 9:33 请务必删除/关闭这条设定，否则会导致 xtabond 和 xtdpd 命令报错
  set fvlabel on, permanently


*-文件路径设定：外部命令的存放位置

*  Note-有关这一部分的完整设定命令，请输入 help set 命令进行查看

  sysdir set PLUS "`c(sysdir_stata)'ado\plus"         // 外部命令的存放位置
  sysdir set PERSONAL "`c(sysdir_stata)'ado\personal" // 个人文件夹位置
  
  *采用相似的方式，可添加其它允许stata搜索的目录
  adopath + "`c(sysdir_stata)'\ado\personal\_myado"
  *adopath + "路径2" //自行添加的放置其他外部命令的路径


* log文件：自动以当前日期为名存放于 stata15\do 文件夹下
* 若 stata1x\ 下没有 do 文件夹，则本程序会自动建立一个 
  cap cd `c(sysdir_stata)'do
  if _rc{
     mkdir `c(sysdir_stata)'do  //检测后发现无 do 文件夹，则自行建立一个
  }
  
  local fn = subinstr("`c(current_time)'",":","-",2)
  local fn1 = subinstr("`c(current_date)'"," ","",3)
  log    using `c(sysdir_stata)'do\log-`fn1'-`fn'.log, text replace
  cmdlog using `c(sysdir_stata)'do\cmd-`fn1'-`fn'.log, replace


  
*-stata启动后自动进入该目录 (自行设定)

    cd "`c(sysdir_personal)'"
  * cd "`c(sysdir_personal)'\Net_course_C"

  
*------------------
*- 网址导航
*------------------
  
dis in w _n(5) ///
           "    ------------------------------------------------------"
dis in w   "    -------------- Stata 15 dofile 转码方法 --------------" 
dis in w   "    ------------------------------------------------------" _n
  
  dis in w _n(1) ///
           "    用 Stata15 打开 Stata14 以下的 dofile 时，屏幕会提示 " _n
  dis in w "    ....... The document is not encoded in UTF-8! ......." _n
  dis in w "    处理方法：在 Encoding: 下拉菜单中选择 「Chinese(GBK)」，点击 OK " _n
  dis in w "    注意：不要勾选「[ ] Dot not show this message again」" _n _n
  

dis in w _n _n ///
         "    ------------------------------------------------------"
dis in w "    ----- Stata 15 转码方法(一次性处理 .dta 转码问题) ----" 
dis in w "    ------------------------------------------------------" _n
dis in w "    *-说明: dofile 或 数据文件中包含中文字符时，需要转码才能正常显示"
dis in w "                      "
dis in w "    *-Step 1: 分析当前工作路径下的编码情况(可省略)                "
dis in w "      ua: unicode analyze *                                         "    
dis in w "    *-Step 2: 设定转码类型                                          "   
dis in w "      ua: unicode encoding set gb18030  // 中文编码                 "                       
dis in w "    *-Step 3: 转换文件                                              "
dis in w "      ua: unicode translate *                                       "    

*-常逛网址
 
  dis in w _n "   "
  
  dis _n in w _col(10) _dup(45) "="
  dis    in w _col(10) _n _skip(20) "Hello World! Hello Stata!" _n
  dis    in w _col(10) _dup(45) "=" _n 
  
  dis in w  "Stata官网：" ///
      `"{browse "http://www.stata.com": [Stata.com] }"' ///
      `"{browse "http://www.stata.com/support/faqs/":   [Stata-FAQ] }"' ///
      `"{browse "https://blog.stata.com/":      [Stata-Blogs] }"' ///
      `"{browse "http://www.stata.com/links/resources.html":   [Stata-资源链接] }"' _n
	  
  dis in w  "Stata论坛：" ///
	  `"{browse "http://www.statalist.com": [Stata-list] }"'      ///
      `"{browse "https://stackoverflow.com":  [Stack-Overflow] }"' ///
      `"{browse "http://bbs.pinggu.org/": [经管之家-人大论坛] }"'  //_n
  
  dis in w  "Stata资源：" /// 
      `"{browse "http://www.jianshu.com/u/69a30474ef33": [Stata连享会-简书] }"' ///
      `"{browse "https://www.zhihu.com/people/arlionn/":    [Stata连享会-知乎] }"'  ///
	  `"{browse "https://gitee.com/arlionn":    [Stata连享会-码云] }"'
	  
  dis in w  _col(12)  /// 
      `"{browse "http://www.jianshu.com/p/f1c4b8762709": [Stata书单] }"' ///
	  `"{browse "http://www.jianshu.com/p/c723bb0dbf98":           [Stata资源汇总] }"' //_n
	  
  dis in w  "Stata课程：" ///
      `"{browse "https://stats.idre.ucla.edu/stata/": [UCLA在线课程] }"' ///
      `"{browse "http://www.princeton.edu/~otorres/Stata/":        [Princeton在线课程] }"'  _n
	  
  dis in w  "Stata现场：" ///
	  `"{browse "http://www.peixun.net/view/307.html": [Stata初级班] }"'  ///
	  `"{browse "http://www.peixun.net/view/308.html":       [Stata高级班] }"' ///
	  `"{browse "http://i.youku.com/arlion":       [Stata优酷视频] }"' 
	  
  dis in w  "学术论文：" ///
	  `"{browse "http://scholar.chongbuluo.com/":  [学术搜索] }"'  ///
	  `"{browse "http://scholar.cnki.net/":       [CNKI] }"' ///
	  `"{browse "http://xueshu.baidu.com/":       [百度学术] }"'  ///
	  `"{browse "http://www.jianshu.com/p/494e6feab565":         [Super Link] }"' _n  
  
  
/*  
*-快速进入相应目录 (现在用了 Lily APP，这部分可以删除了)
* 功能：输入简单命令，快速进入常用文件夹

  dis in w _n(2) "   "  
  dis _n _n _n in w "myQuick:  test | myado "
  
  local p "test"
  cap program drop `p'
  program define `p'
    local pwd : pwd
    qui cd "\\Mac\Home\我的项目\test"
    qui cdout 
	qui cd "`pwd'"
  end

  local p "myado"
  cap program drop `p'
  program define `p'
    qui cd "`c(sysdir_stata)'\ado\personal\_myado"
    qui cdout 
  end

*/


*------------------------------------------------------
*----- Stata 15 转码方法(一次性处理 .dta 转码问题) ----
*------------------------------------------------------
*-一次性转换当前工作路径下的所有文件
cap program drop uniall
program define uniall

    *-说明: dofile 或 数据文件中包含中文字符时，需要转码才能正常显示
                      
    *-Step 1: 分析当前工作路径下的编码情况                         
      *unicode analyze *                                         
    *-Step 2: 设定转码类型                                          
      ua: unicode encoding set gb18030  // 中文编码                     
    *-Step 3: 转换文件                                              
      ua: unicode translate *
  
end 