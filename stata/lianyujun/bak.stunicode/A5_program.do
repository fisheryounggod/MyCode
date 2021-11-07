



          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==========================
          *         ���彲  STATA ��̳���
          *       ==========================
          

    *cd D:\stata11\ado\personal\Net_course_A\A5_prog
     cd `c(sysdir_personal)'Net_course_A\A5_prog


*--------------------
*     ����Ŀ¼
*--------------------
* 5.1  stata������
* 5.2  ��ֵ(scalar)
* 5.3  ��Ԫ
* 5.4  ������ʱ�����
* 5.5  �������
* 5.6  ���� Stata ����ķ���ֵ





          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==========================
          *         ���彲  STATA ��̳���
          *       ==========================
          *          -5.1- stata������
          
          
*---------------------
*-> 5.1 stata������
*---------------------

       *   ==����Ŀ¼==
              
       *   5.1.1 Stata ����Ļ����ṹ
       *   5.1.2 �����ִ��
       *       5.1.2.1 ��һ��ִ�з�ʽ��ado �ĵ�ִ�з�ʽ
       *       5.1.2.2 �ڶ���ִ�з�ʽ��run(Ctrl+R) 
       *   5.1.3 ����Ĺ���
       *   5.1.4 ������ӡ����Ľ��
       *   5.1.5 ��������������ж�
       *   5.1.6 ���������ڳ���ִ�й��������䶯


*--------------------------
*-5.1.1 Stata ����Ļ����ṹ

     program define myprog
     version 8.0
        dis "I Iove This Game!"
     end

  * ע������Ϊ myprog.ado (�ļ�����չ��Ϊ `.ado')
    

*--------------------
*-5.1.2  �����ִ��

  *-5.1.2.1  ��һ��ִ�з�ʽ��ado �ĵ�ִ�з�ʽ
    
    myprog
    
    adopath + D:\stata10\ado\personal\Net_course_A\A5_prog
 
    myprog
	
    
    *-˵����
    *   (1) ����ִ�з�ʽ��stata�ٷ�������ȫ��ͬ��
    *   (2) ������Ҫ����ִ�е�����������ַ�ʽ�ܺã�  
 
    *-���飺
    *   (1) ���Լ���д�ĳ���ͳһ����� ����\personal\_Myado�£�
    *   (2) ����profile.do�ļ��ж�������
            adopath + D:\stata11\ado\personal\_Myado
    *   (3) ���ļ����¿ɽ�һ���趨 a-z �����ļ��У�
	*       �����Ӧ��ĸ��ͷ���ļ�
    *   (4) ������ʱ�� ado �ĵ������Բ��� -adopath- ������ŵ�ַ
 

  *-5.1.2.2  �ڶ���ִ�з�ʽ��run 
 
    *-Step1: ���ڴ��ж������
      *���巽����ѡ��, ���`Execute Quietly(run)'�� (��ݼ���Ctrl+R)
     
    *-Step2��ִ�г���(��ʽͬǰ)
    
    *-ʾ����
   
      program define mynike
        version 8.0
        dis in red "Just do it! "
      end  
       
      mynike


*------------------
*-5.1.3 ����Ĺ���

  doedit myprog.ado     // �޸ĳ���
  program dir           // �����ڴ��еĳ���
  program list myprog   // ��ʾ�������
  program list _all
  program drop mynike   // ɾ���ڴ��е���ĳ��򣬵���Ӱ��Ӳ���д洢���ļ� 
  mynike                // ������Ϣ����Ϊ�����Ѳ����ڴ���
  
   program define mynike
     version 8.0
     dis in red "Just do it! hahaha! "
   end  
       
   mynike
   
   *-˵����
   *   (1) �޸ĳ���󣬱����Ƚ��ɰ汾���ڴ������(program drop)��
   *       Ȼ���ٵ����¶���ĳ���
   *   (2) ��Ϊ����Ķ��巽����
       
       capture program drop mynike        // �������
       program define mynike
         version 8.0
         dis in red "Just do it! ha   ha! "  // ���޸ĺ�ִ��
       end  
          
       mynike


*--------------------------
*-5.1.4 ������ӡ����Ľ��         -quietly-

  sysuse auto, clear
  quietly sum price, meanonly   // �����ĵ���������
  scalar avg = r(mean)
  dis avg

  quietly{                      // �����ĵ���������
     sum price if foreign == 0
     scalar avg1 = r(mean)
     sum price if foreign == 1
     scalar avg2 = r(mean)
     scalar diff = avg2 - avg1
  }
  dis diff


*----------------------------
*-5.1.5 ��������������ж�     -capture-

  sysuse auto, clear
  drop prcie              // ����!   ���ţ�ֹͣ
             
  capture drop prcie      // ����! �����ţ���ֹͣ
  sum mpg
  dis _rc                 // -help _rc-
  
  capture drop price      // ��ȷ! ������
  dis _rc                 // ע���ֵ�ı仯
  
  sysuse auto, clear
  cap noisily drop prcie  // ����! ����,����ֹͣ
  sum mpg
  
  *- ʾ����
       
       cap program drop varyes
       program define varyes
       version 10.0
         args varname         // �趨������
         cap sum `varname'
         if _rc ~= 0{
           dis as error "����δ���ֱ��� `varname'"
           exit _rc 
         }  
       end
      
       varyes pp 
       varyes weight
    
    
  *- �ر�˵����
     * capture ����κ�һ�� argument ���������� args �����ᱻִ��
     
     sysuse auto, clear
     order price weight length
     
     cap drop price weigth length   // Q:��Щ�����ᱻ drop ��
     
     *-��ȷ������
       cap drop price 
       cap drop weigth
       cap drop length
        
     *-��ʹ�� -dropvars-
       sysuse auto, clear
       order price weight length
       dropvars price weigth length


*-------------------------------------
*-5.1.6 ���������ڳ���ִ�й��������䶯     -preserve-

  sysuse auto, clear
    preserve                      // ���ݵ�ǰ״̬ s1
      keep price weight foreign
      drop if price > 10000
      sum 
      save auto_new.dta, replace
    restore                       // �ָ���״̬ s1
  sum  

  use auto_new.dta,clear
  
  *-˵����
    * (1) ��������£����ǸĶ����϶���Ϊ�˵õ��ض��Ľ����
    * (2) �� preserve �� restore ֮������Ͻ��е��κ��޸Ķ��޷�������
    * (3) preserve �� restore ���ɡ�Ƕ�ס�ʹ��
	*     stata11 �ṩ��"Ƕ��"���ܣ��μ�
	
	      help snapshot
	     

  *-ʵ�������й�˾�ʱ��ṹӰ�����ط���
  
    *-����
      use xtcs2, clear
      tsset code year
      xtdes                          // unbalance panel data
	  
    * ����ģ�ͣ���ƽ�����������
      xtreg tl size-tobin, fe
      est store fe_unb
	  
    * �Ƚ��Լ��飺ƽ�����ع���
      preserve
         xtbalance, range(1998 2004) // ����Ϊƽ�����
         xtreg tl size-tobin, fe
         est store fe_bal
      restore
	  
    * ���ЧӦģ��(��Է�ƽ�����)
      xtreg tl size-tobin, re
      est store re_unb
	  
    * �������
      esttab fe_unb fe_bal re_unb, nogap stat(N N_g)
    
    

	
	
	
	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==========================
          *         ���彲  STATA ��̳���
          *       ==========================
          *          -5.2-  ��ֵ(scalar)
          *          -5.3-  ��  Ԫ
          *          -5.4-  ������ʱ�����          
          
          
*---------------------
*-> 5.2  ��ֵ(scalar)
*---------------------

              *     ==����Ŀ¼==

              *     5.2.1 �����ֵ
              *     5.2.1 �����ֵ
              *     5.2.2 ����ַ���
              *     5.2.3 ִ�������ĵ�ֵ���
              *     5.2.4 ��ֵ�Ĺ��� 
              
  scalar a = 3
  scalar b = ln(a) + (3^4.2)/exp(2)
  dis a
  dis b


*-------------------  
*-5.2.2  ����ַ��� 

  scalar c = .a
  dis c
  scalar s1 = "hello, Arlion"
  scalar s2 = substr(s1,1,5)   // ��ֵ�����úܼ�
  dis s1
  dis s2

* display �����һ���򵥵ļ�����
  dis       ln(3) + (3^4.2)/exp(2)
  dis %6.2f ln(3) + (3^4.2)/exp(2)

* ��ʾ���������ض��۲�ֵ
  sysuse auto,clear
  dis price[3]
   list price in 1/3
  sort price 
  gen pmax = price[_N]
   list pmax in 1/20
   sum price


*----------------------------- 
*-5.2.3  ִ�������ĵ�ֵ���

  sum price 
  return list
    dis r(N)
  scalar range = r(max) - r(min)
    dis range
  gen qq = r(sd)
    list qq in 1/10
    
  *-ʾ������ȡ mean(price) �ı�׼��
  
    *- ��ʽ�� s.e.(mean) = s.d.(price)/sqrt(N)
	
    sysuse auto, clear  
    sum price          
    scalar se_price = r(sd)/sqrt(r(N))
    dis "sd(price) = "  r(sd)
    dis "se(price) = "  se_price
	
	*-��;��t ����
	  scalar t_value = r(mean) / se_price
	  dis t_value
	  
	*-stata t ��������(��֤)
	  ttest price=0
 
      
*------------------- 
*-5.2.4  ��ֵ�Ĺ��� 

  scalar dir
    scalar list
  scalar drop a
    scalar list
  scalar drop _all
    scalar list


          
          
*---------------------
*-> 5.3    ��  Ԫ
*---------------------

      *   ==����Ŀ¼==
      
      *   5.3.1 ��Ԫ�Ķ��������
      *         5.3.1.1 ��Ԫ�Ļ�������
      *         5.3.1.2 ��ѧ������Ĵ���
      *         5.3.1.3  ����˫���ţ�`"  "'
      *         5.3.1.4 ��Ԫ�е���Ԫ
      *         5.3.1.5 ��Ԫ���û��Ƶļ� 
      *   5.3.2 ȫ����Ԫ
      *   5.3.3 ��Ԫ�Ĺ���


*-------------------------
*-5.3.1 ��Ԫ�Ķ��������

  *-5.3.1.1 ��Ԫ�Ļ�������
  
    *-�������
      local a = 5
      dis `a'
      
      local b = `a' + 7
      dis `b'
  
    *-�������
      local name1  "Arlion: "
      dis "`name1'"
      
      local name2  ��ɽ��ѧ ����ѧԺ
      dis "`name2'"
      
      local name3  `name1'`name2'
      dis "`name3'"
  
    *-��ű�������
      sysuse auto, clear
      local varlist  price weight rep78 length
      sum `varlist'
      des `varlist'
  
      dis `varlist'   // ��ӡ�������ĵ�һ���۲�ֵ 
      dis price weight rep78 length
      list price weight rep78 length in 1/1
      dis "`varlist'" // ��ӡ�������� 
  
  
  *-5.3.1.2  ��ѧ������Ĵ���
    
    local a "2+2"
    dis  `a'
    dis "`a'"
    
    local b = 2+2  // ������Ķ����кβ���?
    dis  `b'
    dis "`b'"
  
  
  *-5.3.1.3  ����˫���ţ�`"  "'
  
    *-�����������а��� `' �� "" ������
      local tt  John's "car"
      dis "`tt'"              // ����ʽ 
      dis "John's " car ""
      local tt  John's "car"  // ��ȷ��ʽ 
      dis `" `tt' "'  
  
  
  *-5.3.1.4  ��Ԫ�е���Ԫ
   
     local a1 = 2
     local a2 "var"
     local a3 = 2*`a1'
     local a4 `a`a1''
     local `a2'`a1' = 2*`a3'
     local `a`a3'' "``a`a1''2'"  // �ӵ�һ�������� ` ' ��ʼ���� 
     
     dis  `a1'
     dis "`a2'"  
     dis  `a3'          // 4 
     dis "`a4'"         // ��Ԫ a2 �е����� 
     dis ``a2'`a1''     // 8 
     dis "`a`a3''"      // ? 
     dis "``a`a3'''"    // 8 
 

  *-5.3.1.5  ��Ԫ���û��Ƶļ�
  
    *-��ѧ����ʽ�ļ�
        sysuse auto, clear
        local i = 19
        local j = int(sqrt(`i'))
        dis `j'
        dis price[`j']
      *-�ȼ��ڣ�
        local i = 19
        dis price[`=int(sqrt(`i'))']   // price`=j'  
      *-��֤
        list price in 1/5 
  
    *-�߼�����ļ�
      gen price1 = price if foreign==1
      gen price0 = price if foreign==0
      local i = 0
      sum price`=(`i'>0)'
  
    *-��Ԫ����ֵ�ĵ����͵ݼ�
      local i = `i' + 1
      local i++       // ִ������`֮��' �� 1  
      local ++i       // ִ������`֮ǰ' �� 1  
      
      local j = `j' - 1
      local j--
      local --j
      
     * e.g.
       local i = 1
         dis `i++'
         dis `i'
       local i = 1
         dis `++i'
         dis `i'


*----------------------
*-5.3.2  ȫ����Ԫ

  *- ��������÷�ʽ
     global aa "This is my first program!"      
     dis "$aa"

     global x1 = 5
     global x2 = 2^$x1
     dis $x2
   
  *- ʾ����  
     sysuse nlsw88, clear
     global option ", vce(bootstrap, reps(50))"  // ����ѡ��
     global reg    "regress"                     // ���Ʒ���
   
     local x1 "hours ttl_exp"
     $reg wage `x1' $option
     est store m1
   
     local x2 "hours ttl_exp married union"
     $reg wage `x1' $option    // `x1' �е����ݸ��Ѿ�ʧЧ
     $reg wage `x2' $option
     est store m2
   
     esttab m1 m2, nogap
   

*----------------------
*-5.3.3  ��Ԫ�Ĺ���

    macro list
    macro dir
    macro drop x2
    macro dir x2
    macro dir aa


          
*-----------------------
*-> 5.4  ������ʱ�����
*-----------------------

      *   ==����Ŀ¼==

      *   5.4.1 ��ʱ�Ա���
      *   5.4.2 ��ʱ�Ծ������ʱ�Ե�ֵ
      *   5.4.3 ��ʱ���ļ�


*-----------------
*-5.4.1 ��ʱ�Ա���      -tempvar-
  
  sysuse nlsw88, clear
  tempvar x1 x2
  gen `x1' = hours^2
  gen `x2' = ln(wage)
  sum `x1' `x2'
  
  * ��ʱ�Ա��������ƿ��������Ա���ͬ������Ϊ���ߵ����÷����б�
  
  *---------------һ��ʵ��-------------------
    cap program drop mysum
    program define mysum
     version 8.0
     args var                 // ������ help args  
     
     tempvar x1 x2            // ����������ʱ�Ա���
     gen `x1' = sqrt(`var')
     gen `x2' = ln(`var')
     
     dis in y "The summary of `var' is: " 
        sum `var'
     dis _n in y "The summary of sqrt(`var') is:"
        sum `x1'
     dis _n in y "The summary of ln(`var') is:"
        sum `x2'
     
    end
  *------------------------------------------
    
    sysuse nlsw88, clear
    mysum wage


*------------------------------
*-5.4.2 ��ʱ�Ծ������ʱ�Ե�ֵ       -tempname-
  
  local j = 7
  tempname mymat        // ������ʱ�Ծ���
  mat `mymat' = I(`j')  // ���÷�ʽ
  mat list `mymat'

  *---------------һ��ʵ��---------------
  * ��ȡһ��������еĺ�
    mat a = J(4,4,1) + I(4)
    mat a[3,2] = 9
    tempname one rowsum
    local c = colsof(a)      // ���ؾ��� a ������
    mat `one' = J(`c',1,1)   // ����һ�� cx1 ��������
    mat `rowsum' = a * `one' // ��� 
    mat list a
    mat list `one'
    mat list `rowsum'
  *--------------------------------------
    
  *-��ϰ�������ȡ���е�����ƽ��ֵ�ͼ�Ȩƽ��ֵ��

  
  *---------------------��װΪ����----------------------
    *! ��ȡ��������ĸ���֮�ͺ͸���֮�� 
    cap program drop mat_sum
    program define mat_sum
    version 10
      args matname
      tempname one rowsum colsum
      local c = colsof(`matname') 
      mat `one' = J(`c',1,1)      // (1)
      mat `rowsum' = `matname' * `one'     
      dis in g _n "���� `matname' ��" in w " ���м���Ϊ��"
      mat list `rowsum', noheader nonames
      
      local c = rowsof(`matname') 
      mat `one' = J(1,`c',1)      // (2) �ظ����� one ����պ��ӣ��Ƚ�"����"
      mat `colsum' = `one' * `matname'      
      dis in g _n "���� `matname' ��" in w " ���м���Ϊ��"
      mat list `colsum', noheader nonames      
    end
    exit
  *----------------------------------------------------
  *- ���ɾ���: mat `one' = J(`=colsof(`matname')',1,1) 
   
    mat list a
    mat_sum a
    
    mat b = (-1.3, 2.6 \ 3.89, 0.42 \ 50.1, -0.634)
    mat list b
    mat_sum b
    

  * ������ʱ�Ե�ֵ������˵����
    * (1) ���Խ�����Ϊ 1*1 ��ʱ�Ծ���
    * (2) ����������ʱ�Ե�ֵ��ʹ�ã�������Ԫ���֮
    
    

*------------------
*-5.4.3 ��ʱ���ļ�      -tempfile-

  *-���壺 tempfile file1
  *-���ã� use "`file1'"
  
  *---------------------- һ��ʵ�� -------------------------
  * ���ݣ����е�7�ҹ�˾��������
          use A5_tempfile1.dta, clear
          list, sepby(id)
  * ���񣺲���һ���µĹ�˾�������,ֵΪ��1,2,3 
  * ˼·��Ӧ�� _n �� egen ����
          keep id
          duplicates drop 
          gen id_new = _n
          list, sep(0)
          
  * ���崦����̣�        
    use A5_tempfile1.dta, clear
    preserve                     // �������ݣ��Ա��ȡ id
      keep id
      duplicates drop
      sort id
      gen id_new = _n
        list 
      tempfile id_data           // ������ʱ���ļ� id_data
      sort id
      save "`id_data'", replace  // �洢��������ʱ���ļ�
    restore                      // ��ȡ id ��ɣ��ָ�ԭ����
      sort id year
      merge id using "`id_data'" // ���µ� id �ϲ���ԭʼ������
      sort id_new year

    order id id_new year
    list,sepby(id)
    tsset id_new year            // ʹ���� id ��ʾ panel
    xtdes
  *----------------------------------------------------------

  *-һ�����Ĵ�������
    use A5_tempfile1.dta, clear
    xtset id year
    egen id_new = group(id)
    list, sepby(id)
  


    
	
	


          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==========================
          *         ���彲  STATA ��̳���
          *       ==========================
          *            -5.5-  ѭ�����

    cd `c(sysdir_personal)'Net_course_A\A5_prog
	
*---------------------
*-> 5.5   ѭ�����
*---------------------

      *   ==����Ŀ¼==
      
      *   5.5.1 ����ѭ����while ���
      *   5.5.2 forvalues ���         
      *   5.5.3 foreach ��� 

      

*          ��������
*-----------------------------
* while, forvalues, foreach 
*-----------------------------


*----------------
*-5.5.1  ѭ�����

  *-5.5.1.1  ����ѭ����while ���
    
     local j = 0
     while `j'<5{
       dis in y _s(10) `j'
       local j = `j'+1
     }
    
   *-��
       
     local j = 0
     while `j'<5{
       dis in y _s(10) `j++'
     }
    
   *___________________________________ 
   *-ʾ��: ������ֵ����ȡ�����ļ�Сֵ
           
     twoway function y = 0.2*exp(x) - ln(x^2) + 3, ///
            range(0 4) lw(*2) 
     
     
       local trace "set trace on"   // �����������
     *---------------------------------------------------------
       local delta = 0.05   // ����
       local     x = 1     // x �ĳ�ʼֵ
       local     j = 0     // ����������¼��������
       local     e = 1     // y1-y0
       local    e0 = 0.01  // �����о�       
      while `e' > `e0'{
        `trace'
        local y0 = 0.2*exp(`x') - ln(`x'^2) + 3 
        local x  = `x' + `delta' 
        local y1 = (0.2*exp(`x') - ln(`x'^2)) + 3
        local e  = abs(`y1' - `y0')
        dis in g "*" _c
        local j = `j' + 1
      }
       dis "e = " `e'    
       dis "x = " `x'     // x �Ľ�
       dis "y = " `y1'    // y �ļ�Сֵ
       dis "j = " `j'     // ��������
	   
     *-ͼʾ��
       twoway function y = 0.2*exp(x) - ln(x^2) + 3,      ///
              range(0 4) lw(thick) xline(`x') yline(`y1') ///
              text(`=`y1'-0.5' `=`x'+0.8' "(`x'��`y1')")
     *---------------------------------------------------------
	 
     *- ��ϰ��
        * (1) �趨 (delta=0.1, e0=0.01)��-trace- �������
        * (2) ���Խ� (delta=0.001, e0=0.0001),����кα仯��
        * (3) ���趨 (delta=0.02, e0=0.0001)���ܷ�����?
        * (4) ���趨 x=2 Ϊ��ʼֵ���ܷ�������
        
             
     *- �����޸����£�               
     *--------------------------------------------------------
       local   h = 0.001    // ����
       local   x = 1        // x �ĳ�ʼֵ
       local   j = 0        // ����������¼��������
       local   e = 1        // y1-y0
       local  e0 = `h'/10   // �����о� (�޸�Ϊ��̬��ֵ)     
      while abs(`e')>`e0'{  
                            // �޸ģ�abs(`e')
        local y0 = 0.2*exp(`x') - ln(`x'^2) + 3 
        local x  = `x' + `h' 
        local y1 = (0.2*exp(`x') - ln(`x'^2)) + 3
        local e  = `y1' - `y0'   // ��ǰ e  = abs(`y1'-`y0') 
        if (`e' > 0){
           local h = -`h'   // ��������������
        }
        dis in g "*" _c
        local j = `j' + 1
      }
       dis "e = " `e'    
       dis "x = " `x'      // x �Ľ�
       dis "y = " `y1'     // y �ļ�Сֵ
       dis "j = " `j'      // ��������
     
     *-ͼʾ��
       local x: dis %4.3f `x'   // ��������ʾ�ĸ�����
       local y: dis %4.3f `y1'     
       twoway function y = 0.2*exp(x) - ln(x^2) + 3,      ///
              range(0 4) lw(thick) xline(`x') yline(`y1') ///
              text(`=`y'-0.5' `=`x'+0.4' "(`x', `y')")       
     *--------------------------------------------------------
	 
     *- ��ϰ��
        * (1) ���Գ�ʼֵ x=3���Ƿ�����������
        * (2) �������������Ч��������α�д��


     *___________________________________________________________
     *- ��ս������ȡ���º�����ȫ�ּ���ֵ(0<x<80): 
        
          twoway function                                     ///
              y = 0.3*sin(0.5*x)+ 0.9*cos(0.2*x) + 0.5*ln(x), ///
                  range(0 80) lw(*2)          
     *___________________________________________________________
        *
        * ˼·��dy/dx = 0
        *  dy/dx = 0.15*cos(0.5*x) -0.18*sin(0.2*x) + 0.5*(1/x)
        *
        * ��δ��ɵĽ��
          doedit A5_while_max.do
       
                 
                 
  *-5.5.1.2  forvalues ���   // ���ֵ�ѭ�� 
    
    forvalues i = 0(-1)-14{
       dis in y _s(8) `i'
    }

    forvalues i = 0/4{
       dis in y _s(10) `i'
    }

    forvalues i = 10(-2)1{
       dis in y _s(8) `i'
    }

    mat mm = J(10,3,0)
    forvalues i = 1/10{
      forvalues j = 1/3{
        mat mm[`i',`j'] = `i' + `j'
      }
    } 
    mat list mm
    
    
    *-ʾ�� 1������ļ�����ͺϲ�
         type d1.txt
         type d2.txt 
         type d3.txt
		 
       *-����
         forvalues j = 1/3{
           local varname  id year invest market stock 
           insheet `varname' using d`j'.txt, clear
           save s`j'.dta, replace 
         }
		 
       *-�ϲ�(����׷��)
         use s1.dta, clear
         forvalues j = 2/3{
            append using s`j'.dta
         } 
         save alldata.dta, replace
         browse
    
    
    *-ʾ�� 2�� Fama-French two-step regression
      * viewsource xtfmb.ado
      * help xtfmb
      
      *- step1: ���������ִ�� OLS �ع飬��¼֮��
      *- step2: ������ȵĹ���ֵƽ�����õ����յ� b, se, R2 ��ͳ����
      
      *- �򵥴���ʽ
      *  model: reg mvalue  invest kstock 
         use grunfeld.dta, clear
         sort year company
         tab year
         mat R = J(20, 7, 0)
         local i = 1
         forvalues yr = 1935/1954{
            qui reg mvalue invest kstock if (year == `yr')
            mat b  = e(b)
            mat se = vecdiag(cholesky(diag(vecdiag(e(V))))) 
                                         // �μ� A4_Matrix.do      
            mat R[`i++', 1] = (b, se, e(r2_a))
         }
         mat list R
		 mat list e(b)  // ��֤ 1954 �Ľ��
      
         
               
   *- һ�㻯����ʽ(�ɷ�װ�ɳ���)   
   *---------------------------------------------------- 
         use grunfeld.dta, clear
         xtset company year
         xtdes
       *-�����趨  
         qui xtset
         egen tt = group(year)      // ��ʲô�ô�?
         tab tt
         tsset company tt
         local T = r(tmax)          // ����ʱ���� 
         local y   "mvalue"         // �����ͱ���
         global xx "invest kstock"  // ���ͱ���
       *-�趨�洢����ľ���
         local s = wordcount("$xx")
         local c = (`=`s'+1')*2 + 1      
         mat   R = J(`T', `c', 0)  
       *-��һ��������Ȼع�
         forvalues t = 1/`T'{
            qui reg `y' $xx if (tt == `t')
            mat    b = e(b)
            mat  se2 = vecdiag(e(V))
            math se  = sqrt(se2)    // Arlion �Ա����
		   *mat se = vecdiag(cholesky(diag(vecdiag(e(V))))) 
            mat R[`t', 1] = (b, se, `e(r2)')  
         }
      
       *-�ڶ�������������ƽ��ֵ
         mat  one = J(1, `T', 1)/`T'  // ÿ��Ԫ�ض��� 1/T
         mat AR = one * R
         mat list AR
      
       *-�����������ֽ��  
         qui tsset company year
         global rowname ""
         forvalues t = `r(tmin)'/ `r(tmax)'{
             global rowname "$rowname `t'"
         }
         dis "$rowname"
         mat rownames R = $rowname
         global xx "$xx cons"
         mat colnames R = $xx  se se se  R2
         local coln : colnames R     
         mat colnames AR = `coln'
         mat list R                  // ����ȹ��ƽ��
         mat list AR                 // �����ƽ��
         *- �пɽ�һ��������
            mat a = R[1, 1..3] 
             mat list a
            mat RR = (AR[1, 1..3] \ AR[1, 4..6] \ AR[1, 7], ., .)
            mat rownames RR = b se avg-R2
            mat list RR
      *----------------------------------------------------
      *- ���Խ����
         *ssc install xtfmb, replace  // ���ذ�װ������
         xtfmb mvalue invest kstock
                  
         

  *-5.5.1.3 foreach ���   // ��������Ԫ���ļ��ȵ�ѭ�� 

       help foreach         // �﷨��ʽ 

    *-a. �����ʽ��foreach v in ...
       type d1.txt
       type d2.txt 
       type d3.txt
       foreach file in  d1 d2 d3{
          local varname id year invest market stock 
            insheet `varname' using `file'.txt,clear
            save `file'.dta, replace 
       }
       
       * ׷������
         use d1.dta, clear
         foreach file in  d2.dta d3.dta{
            append using `file'
         }
         list


    *-b. ������ѭ����foreach v of varlist ...
         
      *-ʾ�� 1���������Ķ���ת��
         sysuse auto,clear
         global vars "price weight length"
         foreach v of varlist $vars{
            gen ln_`v' = ln(`v')
            label variable ln_`v'  "ln(`v')" 
         }
		 
      *-ʾ�� 2������������β����(Winsorized)
         sysuse nlsw88, clear
         local vv "wage hours ttl_exp grade"
         foreach v of varlist `vv'{
            winsor `v' , gen(`v'_w) p(0.01)
         }      
         d *_w   


    *-c. ��Ԫѭ����foreach cc of local ...
         sysuse auto,clear
         local vars price weight length
         foreach v of local vars{
            gen `v'_2 = `v'^2 
         }
      
         *-�ر�ע�⣺����� vars ��Ԫ������ʱ����� `'
      

    *-d. ����ѭ����foreach num of numlist ...
  
      foreach num of numlist 1 4/8 13(2)21 103 {
         display in y _s(10) `num'
      }

      foreach num of numlist 111  1111  11111  111111 1111111 11111111{
         dis in g _s(10) %16.0f  `num'^2
      }

      *-���� -forvalues- ����кβ��죿



	  
	  
	  
	  
	  
	  
          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==========================
          *         ���彲  STATA ��̳���
          *       ==========================
          *            -5.6-  �������

      cd `c(sysdir_personal)'Net_course_A\A5_prog
	  
*---------------------
*-> 5.6   �������
*---------------------

      *   ==����Ŀ¼==

      *   5.6.1 if ���
      *   5.6.2 һЩ���õ��������� 	  
	  
	  
*-----------------
*-5.6.1 -if- ���
  
    *-����Ҫ��
      * (1) �﷨��ʽ
      *     CASE I:
      *        if (����){
      *           ִ������
      *        }  
      *     CASE II:
      *        if (����1){
      *           ִ������1
      *        } 
      *        esle if (����2){
      *           ִ������2
      *        }      
      * (2) ������ "{" ������������������ "}" ����һ��
      * (3) �����жϿ�Ƕ��

    *-ʾ�� 1
	  clear
      scalar tt = 7^2 + 3*29 + ln(100) 
      if tt>0{
         dis in g "The valus is" in y " positive! "
      }
      dis tt

	  
    *-ʾ�� 2
      scalar aa = 1   // ���ԣ��޸�Ϊ aa==1
      if aa ==1{
         dis "��С����˧!"
      }
      else if aa==0{
         dis "��Ů������!"
      }

	  
    *-ʾ�� 3
      sysuse nlsw88.dta, clear
      sort hours
      forvalues i = 1(1)20{
        if race[`i'] == 1{
          dis in y "`i'" in g " ����" in y " ����"
        }
        else if race[`i'] ==2{
          dis in y "`i'" in g " ����" in y " ����"
        }
        else{
          dis in y "`i'" in g " ����" in y " ��������"
        }
      }


    *-ʾ�� 4��
      *
      *- Ŀ�ģ�Tukey power(n) function of variable (x)
      *
      *- �任����
      *
      *       {   x^n     if  n > 0
      *   z = {   ln(x)   if  n = 0
      *       {  -x^n     if  n < 0
      *
      *---------------------mygen.ado----------------------
       cap program drop mygen
       program define mygen
       version 10
       syntax varname(numeric), Power(integer) 
         if `power'>0 {   
           generate  `varlist'_p`power' = `varlist'^`power'
           label var `varlist'_p`power'   "`varlist'^`power'"
         }
         else if `power'==0 {
           generate  ln_`varlist' = ln(`varlist')
           label var ln_`varlist'  "ln(`varlist')"
         }
         else {
           generate  `varlist'_np`=-`power'' = -`varlist'^(`power')
           label var `varlist'_np`=-`power''  "-`varlist'^(`power')"
         }
       end
      *------------------------------------------------------
      
      *-���ԣ�
        sysuse auto, clear
        mygen price, power(-2)
        mygen price, p(0)
        mygen price, p(3)
        d *price*
        
      *-���������Ǵ����
        mygen price , power(0.5)      // Power(integer)
        mygen price weight, power(0)  // varname
        mygen make, power(0)          // varname(numeric)
      
      
    *-ʾ�� 5��Ѱ�ұ��������ֵ
      sysuse auto, clear
      local max = price[1]
      local N = _N
      forvalues i = 2/`N'{
        set trace on       // ������̽���
        if `max' < price[`i']{
           local max = price[`i'] 
        }
        else{               // �����䲻��Ҫ
           local max = `max'
        }
      }
      dis `max'
      sum price
      
      *-������� 2��ʹ�� cond() ����
         sysuse auto, clear
         gen max = price in 1/2     // Q: Ϊ�� in 1/2 ?
            list price max in 1/10
         replace max = cond(price>max[_n-1], price, max[_n-1]) in 2/74
                                    // Q: Ϊ�� in 2/74 ?
            order price max
            list price max
         local max = max[_N]
           dis `max'
           
      *-��ϰ����ζԱ��� price ��ֵ��������(����ʹ��sort��gsort����)
      
      
	  
	  
*---------------------------
*-5.6.2  һЩ���õ���������
    
    *-�μ� A2_data.do:   *-2.1.2.4 �����������������������
  
    * -cond()- ��������Ԫ�������
      * �����﷨: cond(x, a, b)
      * ʾ��
        scalar aa = 1
        dis cond(aa==1, "��С����˧!", "��Ů������!")
      
    * -inrange()- ������ȡֵ������ж�
      * �����﷨:  inrange(z,a,b)
      * ʾ��
        sysuse nlsw88, clear
        tab grade
        gen d_grade = inrange(grade, 12, 16)
        list grade d_grade in 1/40, sepby(d_grade)
    
    * -inlist()- ������ö���ж�
      * �����﷨: inlist(z, a, b, ...)
        help inlist()

    * -clip()- �������ֶ������ж�
      * �����﷨: clip(x,a,b)
        help clip()

    * -missing()- ������
      * �����﷨: missing(x1,x2,...,xn)  or mi(x1,x2,...,xn)
        help mi()
 

    
	
	
	
	


          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *              ::��һ����::
          *               Stata ����
          *       ==============================
          *         ���彲  STATA ��̳���
          *       ==============================
          *        -5.7- ���� Stata ����ķ���ֵ
          
            
*------------------------------
*-> 5.7  ���� Stata ����ķ���ֵ
*------------------------------

      *   ==����Ŀ¼==

      *   5.7.1 �������ڴ��еĽ��
      *   5.7.2 r-class
      *   5.7.3 e-class
      *   5.7.4 c-class


*                 ��������
*------------------------------------------------------
* return list, ereturn list, sret list, cret list
*------------------------------------------------------


*--------------------------
*-5.7.1 �������ڴ��еĽ��

  *- Stata �����Ϊ�������ͣ�
  
     * (1) r-class  ��ģ�͹����޹ص���� �磬summary
     * (2) e-class  ��ģ�͹����йص���� �磬regress
     * (3) s-class  �������             �磬list
     * (4) c-class  �洢ϵͳ����

  *- ��ʾ����ֵ�ķ�����
     * r-class:  return  list
     * e-class:  ereturn list
     * s-class:  sreturn list
     * c-class:  creturn list

  *- ����ֵ��Ϊ�������ͣ�
     * ��ֵ��  �磬r(mean), r(max), r(N), e(r2), e(F)
     * ����  �磬e(b), e(V)
     * ��Ԫ��  �磬e(cmd), e(depvar)
     * ���������磬e(sample)
     

*-----------------
*-5.7.2  r-class

   sysuse auto, clear
   sum price
   return list
   dis "������ƽ���۸��ǣ�" in g `r(mean)'  // ���ַ�������
   dis "������ƽ���۸��ǣ�" in g  r(mean)
   local ss = r(sum)                        // ��������ֵ
   dis "���������ļ۸��ܺ��ǣ�" in g `ss'

   *----------------ʾ ��---------------------
   * ����һ�������ȡֵ��Χ��������һ��������
     sysuse auto, clear
     local vars "price weight gear_ratio"
     local n = wordcount("`vars'")
     mat aa = J(`n',4,0)
     local i = 1
     foreach v of varlist `vars'{
        qui sum `v'
        mat aa[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
     }
      mat colnames aa = mean min max range
      mat rownames aa = `vars'
      mat list aa
   *------------------------------------------


   *-��װ֮���Ա㷴������

*----------------- asum.ado -----------begin---
  *! Author:  Roger Federer
  *! Date:    2010.10.10
  *! Version: 1.0.0

   cap program drop asum
   program define asum, rclass  // ��������Ϊ r-class
   version 8.0
   syntax varlist               // ������ 
   
     local n = wordcount("`varlist'")
     tempname aa                // ������ʱ�Ծ��� 
     mat `aa' = J(`n',4,0)
     local i = 1
     foreach v of varlist `varlist'{
       qui sum `v'
       local range = r(max)-r(min)
       mat `aa'[`i++',1] = (r(mean), r(min), r(max), `range')
     }
     mat colnames `aa' = ƽ��ֵ ��Сֵ ���ֵ ȡֵ��Χ
     mat rownames `aa' = `varlist'
     
   * ��ʾ���
     dis _n in g _dup(20) "=" in y "�ҵ�ͳ�ƽ��" in g _dup(20) "=" 
     mat list `aa', noheader
     
   * ����ֵ
     return add           // ���ϸ����������кα仯��
     return scalar range = `range'
     return matrix r = `aa'
     
   end
*---------------- asum.ado -------------over---

   sysuse auto, clear
   asum price weight length
   ret list
   mat list r(r)

   *-�洢֮���Ա�����ʹ��
     doedit asum.ado
     adopath + D:\stata11\ado\personal\Net_course_A\A5_prog
     asum mpg turn
     which asum

   *-�ó����ȱ�ݣ�
     * (1) �������ʾ��������
     * (2) ����û��ѡ�ȱ������
     * (3) ֻ�ܷ������һ�������ļ�����
	    ret list



*-----------------
*-5.7.3  e-class     

*-> �ڸ߼���Ƶ�л�ǳ���ϸ�Ľ���
 
  sysuse auto, clear
  regress price weight length foreign
  ereturn list
  
  dis "The method is: " in g  e(model)
  dis "�����Ȼֵ = "   in g  e(ll)
  dis "R-sq = "  r(r2)            // ~-~ ����
  dis "R-sq = "  e(r2)            // ^-^ ��ȷ

  dis "ϵ������Ϊ��" 
      mat list e(b)

  dis "ϵ���ķ���-Э�������Ϊ��"
      mat list e(V), format(%6.2f)

  *- e(sample) ������
     sysuse auto, clear
     count if rep78>4
     reg price weight length rep78 if rep78<=4
     sum price
     sum price if e(sample) == 1
     gen e_sample = e(sample)
     list rep78 e_sample in 1/20, sepby(e_sample)

  *- ʾ��1������ȱ©ֵ
     sysuse nlsw88, clear
     sum
     gen ln_wage  = ln(wage)
     gen ln_hours = ln(hours)
     local vv "ln_wage married ln_hours ttl_exp"
     reg `vv' 
     sum `vv' if e(sample)
     tabstat `vv' if e(sample), stat(mean sd min max N)  ///
                  format(%6.3f) c(s) 
    
  *- ʾ��2��������Ԥ��
     sysuse auto, clear
     qui reg price weight length rep78 if rep78<=4
     predict y_hat_a               // �ع����ֵ
     predict res_a , res           // �в�
     gen e_sample = e(sample)
	 predict y_hat if e(sample)
     predict res   if e(sample), res
     format y_hat* res*  %6.2f
     list rep78 price y_hat* res* e_sample in 1/30, sepby(e_sample) 
  
     gsort -rep78
     list rep78 price y_hat* res* e_sample in 1/30, sepby(e_sample) 
 


*-----------------
*-5.7.4  c-class    

*-> �ṩ�˴����ṩ�����ķ���ֵ�����ʱ�ǳ�����

    creturn list

  *- ����ֵ
     dis `c(pi)'           // Բ����
     dis "`c(alpha)'"      // Ӣ����ĸ
     dis "`c(seed)'"       // ����ֵ
     dis `c(maxvar)'       // ��ǰ�汾���������������
     dis `c(memory)'
     clear
     set memory 10m
     dis `c(memory)'
     sysuse nlsw88, clear
     dis `c(k)'            // �����ĸ���
     dis `c(N)'            // �۲�ֵ����
       
  *- �ļ�·��
     dis "`c(sysdir_personal)'"
     dis "`c(sysdir_plus)'"
     cd  `c(sysdir_personal)'Net_course_A
     cd
     cd A5_prog
     dis `"`c(adopath)'"'
     dis "`c(pwd)'"
     adopath
         
  *- ʱ��
     dis "`c(current_date)'"  // ��ǰ����
     dis "`c(current_time)'"  // ��ǰʱ��  
     *-Ӧ��
       doedit `c(sysdir_stata)'profile.do
       dir `c(sysdir_stata)'do\*.log
       shellout `c(sysdir_stata)'do\s1Apr2010084746.log
       
  *- Ӧ��ʵ�� A��
     local date `c(current_date)'
     local time `c(current_time)'
       local vers `c(stata_version)'
       local mem `c(memory)'
       local flav = cond(`c(MP)',"MP", cond(`c(SE)',"SE","IC"))
       local cwd `c(pwd)'
       display _newline "Run `date' at `time' on Stata/`flav' "  ///
                        "version `vers', memory = `mem' bytes"
       display _newline "Current working directory: `cwd'" 
       
    *- Ӧ��ʵ�� B��
       sysuse auto, clear
       display _n "Datafile: `c(filename)' (N=`c(N)', k=`c(k)')" ///
                  " as of `c(filedate)'"
     
 
   *-һЩ���õ��ⲿ����
   
   *  -adoedit- �� do editor �б༭ ado �ļ�



*==========================�� ��===============================

* ���ˣ������Ѿ������ Stata ����֪ʶ��ѧϰ

* �ڵڶ������У����ǽ�ѧϰ���ʹ�� Stata �����͹��Ƹ��ּ���ģ��

*==============================================================

exit









*----------------------
* Ц����stata��������
*----------------------
*
*-����˵�������� t1-t2 ��ʱ��ֵ�����н��

  *-------------------���Կ�ʼ------------------------
  
     local t1 = 16   // "���� STATA ��ʱ��"
     local t2 = 0.5 // "����Ϸ��ʱ��"
     local t3 = .2   // "��Ů���ѵ�ʱ��"
     local t4 = .2   // "�������ʱ��"
    
     if invlogit(`t1')>normal(`t2'+`t3'+`t4'-1.5){
        dis "��ϲ���㽫��Ϊ STATA ���֣�"
     }
     else{
        dis "������STATA �������㣡"
     }
     
  *-------------------���Խ���------------------------    


* ���ۣ��㲻����STATA��STATA�ͻ������㣡

    twoway (function y = invlogit(x), range(0 14))   ///
           (function y = normal(x-1.5), range(0 14))





