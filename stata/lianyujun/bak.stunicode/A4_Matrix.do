



          *     -------------------------------------
          *     -------- ����������STATAӦ�� ---------
          *     -------------------------------------
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            ���Ľ�   �� ��
          *         =====================

   *cd D:\stata11\ado\personal\Net_course_A\A4_matrix
   cd `c(sysdir_personal)'Net_course_A\A4_matrix


*----------------
*    ����Ŀ¼
*----------------
* 4.1  ����Ļ�������
* 4.2  ��������
* 4.3  ����Ľ��� 
* 4.4  ���ھ���Ľ�һ��˵��  



*---------------------
*->4.1  ����Ļ�������
*---------------------

     *         ==����Ŀ¼==
     
     *     4.1.1  �������巽ʽ
     *     4.1.2  ����Ĺ��� 
     *            4.1.2.1 ���������
     *            4.1.2.2 ��ʾ����
     *            4.1.2.3 ���������������
     *            4.1.2.4 ����/ɾ������
     *            4.1.2.5 ����������Ƿ����ȱ©ֵ
     *     4.1.3  ���������������
     *     4.1.4  ѡȡ���־���
     *            4.1.4.1 ѡȡ1��Ԫ��: 1*1����
     *            4.1.4.2 ѡȡ�Ӿ���
     *            4.1.4.3 ����Ԫ�ص��޸�
     *     4.1.5  ��һ�㻯�ľ�����
     *     4.1.6  ���þ���Ķ���
     *            4.1.6.1 ��λ����
     *            4.1.6.2 ��������
     *            4.1.6.3 Ԫ��Ϊ������ľ���
     *            4.1.6.4 �ԽǾ���
     *     4.1.7  �����;�����໥ת��
     *            4.1.7.1  ������>����
     *            4.1.7.2  ����>����
     *     4.1.8  �þ���洢ͳ�ƽ��
     *            4.1.8.1 �Ծ���ʽ����tabstat����Ľ��
     *            4.1.8.2 ��һ�㻯�ľ���洢
     *     4.1.9  ���ñ����ķ�ʽ��������
     *            4.1.9.1 �Ծ����еĸ��н��б任������
     *            4.1.9.2 ����Ԫ�ص���ѧ�任
     *     4.1.10 ����ı���͵���      
     *            4.1.10.1 �����󱣴�Ϊ .dta �ĵ���      
     *            4.1.10.2 �����󱣴浽 txt, word, excel �ĵ��� 


*                          ��������
*--------------------------------------------------------------
* matrix, matrix dir, matrix list, matrix rename, matrix drop
* matmissing(), rowsof(), colsof(), matuniform(), diag(), 
* rownames, colnames, rownumb(), colnumb() 
* mat_capp, mat_rapp, mat_order
* roweq, coleq, mkmat, svmat, set matsize, 
* mat accum, mat glsaccum, mat opaccum
*--------------------------------------------------------------

*_____________________
*-4.1.1  �������巽ʽ

  *-���(stata�е����ݿ�����Ϊ����)
    sysuse auto, clear
    keep in 1/10 
    keep price mpg weight length
    list

  *-���򣺶��ŷ���  ��б�߷���
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    matrix b = (-1.3, 2.6 \ 3.89, 0.42 \ 50.1, -0.634)
    mat list b
    matrix c = (-10 \ -5 \ -8 \ 3 \ 5.6 \ 9)
    mat list c
    matrix d = (-10,-5,-8,5.6,9)
    mat list d
    matrix e = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
    mat list e


*_____________________
*-4.1.2  ����Ĺ��� 

  *-4.1.2.1 ���������
  
    * ���Ժ��ڴ��еı���ͬ��
      mat price  = (2,3)
    * �����Ժ͵�ֵ��������Ȼ������ʾ������Ϣ�������Զ�����
    * ����ѧ�����У�������ʽ�г���һ�����Ǳ����������Ǿ������Ƶ����ƣ�
    *   stata�Ὣ�����Ϊ�������ơ�
      clear 
      set obs 100
      gen x = 5
      mat x = J(3,3,2) 
      sum x
      
    *-������� 
      mat dir
      matrix rename a  MM
      mat dir

  *-4.1.2.2 ��ʾ����
    mat list MM 
    mat list b               // Ԫ�ص�Ĭ����ʾ��ʽΪ��%10.0g
    mat list b, format(%3.1f)
    mat list e 
    mat list e, nohalf
    mat list e, nohalf nonames 
    mat list e, nonames title("һ��5*5�ĶԳƾ���")
    
    
    *-matlist ���� (��Ϊ�����趨��ʽ)
    * ��Ҫ���ڱ�̣����ֽ�� 
    
      *-eg1-- 
        matrix A = (1, 2 \ 3, 4 \ 5, 6)
        matrix list A
        matlist A
        matlist A, border(rows) rowtitle(rows) left(4)
        matlist 2*A, border(all) lines(none) format(%6.1f) names(rows) ///
                     twidth(8) left(4) title(Guess what, a title)

      *-eg2--
        #delimit ;
        matrix Htest = ( 12.30,  2,  .00044642  \ 
                          2.17,  1,  .35332874  \                    
                          8.81,  3,  .04022625  \ 
                         20.05,  6,  .00106763  ) ;
        #delimit cr
        matrix rownames Htest = trunk length weight overall  // ��������
        matrix colnames Htest = chi2 df p                    // ��������
        matrix list Htest
        matlist Htest       // �Ƚ����ֽ���Ĳ���
        * ��Ϊϸ�µĳ��ַ�ʽ
          matlist Htest, title("������") rowtitle("��������")  ///
               cspec(o4& %12s | %8.0g & %5.0f & %8.4f o2&) rspec(&-&&--)
               
               /*         ��������ĺ���
--------------------------------------------------------------------------               
Element 	Purpose	 			Description
--------------------------------------------------------------------------
o4&     before column 1 			4 spaces/no vertical line
%12s 	display format column 1 	string display format %12s
| 		between columns 1 and 2 	1 space/vertical line/1 space
%8.0g 	display format column 2 	numeric display format %8.0g
& 		between columns 2 and 3 	1 space/no vertical line/1 space
%5.0f 	display format column 3 	numeric display format %5.0f
& 		between columns 3 and 4 	1 space/no vertical line/1 space
%8.4f 	display format column 4 	numeric display format %8.4f
o2& 	after column 4 				2 spaces/no vertical line
&-&&--  �����Ϸ��޺��ߣ������·��к��ߣ����һ�������·����к���
--------------------------------------------------------------------------
               */
               
        * �޸��������ĳ��ַ�ʽ
           matlist Htest, title("������") rowtitle("��������")  ///
               cspec(o4| %12s | %8.0g | %5.0f | %8.4f o2|) rspec(--&&--) 
               
        * ��һ���޸�
          matlist Htest, title("������(New)") rowtitle("��������")  ///
               cspec( o4&o2 %10s | b t %8.0g & %4.0f & i c %7.4f o2& ) ///
               rspec( & - & & - & )       
          *-˵����
          * (1) b t %8.0g  �ڶ��� �Ӵ�(bold), ��ɫ(text color)
          * (2) i c %7.4f  ������ б��(italic), ��ɫ(command color)
          
          
  *-4.1.2.3 ���������������
    matrix a = (1,2,3 \ 4,5,6)
    display colsof(d)
    display rowsof(c)
    scalar ra = rowsof(a)
    scalar ca = colsof(a)
    dis in g "���� a ��������: " in y ra 
    dis in g "���� a ��������: " in y ca


  *-4.1.2.4 ����/ɾ������
  
    *-���Ҿ���
      mat dir

    *-ɾ������ (�����ʵû�б�Ҫ)
      mat drop MM
     *mat drop _all


  *-4.1.2.5 ����������Ƿ����ȱ©ֵ
    mat list e
    display matmissing(e)
    mat e[2,3] = .
    mat list e
    display matmissing(e)     


*_________________________
*-4.1.3  ���������������

  mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
  mat rownames A = 1998 1999 2000 2001
  mat colnames A = y x1 x2 x3 
  mat list A

  mat r = rownumb(A, "2000")
  mat c = colnumb(A, "x1")
  mat list r
  mat list c


*_____________________
*-4.1.4 ѡȡ���־���

  *-4.1.4.1 ѡȡ1��Ԫ��: 1*1����
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mat a1 = a[1,1]
    mat list a1
    mat a4 = a[2,1]
    mat list a4

  *-4.1.4.2 ѡȡ�Ӿ���
    mat list e,nohalf
    mat ec3 = e[1..3,3]
    mat list ec3
    mat e3c = e[....,3]
    mat list e3c
    mat e34 = e[3...,4...]
    mat list e
    mat list e34

  *-4.1.4.3 ����Ԫ�ص��޸�
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mat a[1,2] = -10
    mat list a
    mat a[2,2] = (-9, 20)
    mat list a
    
    
*___________________________
*-4.1.5 ��һ�㻯�ľ�����

  * �����е�ÿһ��Ԫ�ض�������Ϊһ��1*1ά����
  * ���Ծ���Ĳ������Էֿ����
  
    mat a1 = (1, 2, 3 \ 42, 50, 63)
    mat a2 = (-3,-5,-7 \ -9 , -11, -13)
    mat list a1
    mat list a2 
  
    mat aa  = [a1, a2]   // ����ϲ���������
    mat list aa
    mat aaa = [a1 \ a2]  // ����׷����������
    mat list aaa
  

  *-��Ϊֱ�۵Ķ��巽ʽ
    mat_capp a1_a2 : a1 a2   // ����ϲ�
    mat list a1_a2
    mat_rapp a1a2 : a1 a2    // ����׷��
    mat list a1a2
    * ע�⣺���������У�ð��ǰ������һ���ո�


*_____________________
*-4.1.6 ���þ���Ķ���

  *-4.1.6.1 ��λ����
    mat I = I(5)
    mat list I

  *-4.1.6.2 ��������
    mat r1 = J(5,5,1)
    mat r2 = J(2,6,-3)
    mat list r1
    mat list r2
    
  * -----------------
  * һ��ʵ������־���
  * ����
 
    mat B = J(4,5,0)
    mat B[1,1] = -1*I(4)
    mat B1 = B
    mat B = J(4,5,0)
    mat B[1,2] = I(4)
    mat B2 = B
    mat B = B1 + B2
    mat list B1
    mat list B2
    mat list B
  * Ӧ��
    mat cc = J(5,5,1) + 2*I(5)
    mat rownames cc = 1998 1999 2000 2001 2002 // ������������
    mat list B, nonames
    mat list cc, nohalf   
    mat dd = B*cc
    mat list dd
    mat rownames dd = 1999 2000 2001 2002 
    mat list dd
  * -----------------
  
    *-һ�㻯����
	  local T = 10
      mat B = J(`T'-1,`T',0)
      mat B[1,1] = -1*I(`T'-1)
      mat B1 = B
      mat B = J(`T'-1,`T',0)
      mat B[1,2] = I(`T'-1)
      mat B2 = B
      mat B = B1 + B2
      mat list B1
      mat list B2
      mat list B


  *-4.1.6.3 Ԫ��Ϊ������ľ���
    *set seed 13699
    mat r3 = matuniform(10,4)
    mat list r3


  *-4.1.6.4 �ԽǾ���
    mat u = J(5,1,-0.5)
    mat list u
    mat du = diag(u)  // ȡ���Խ�Ԫ��
    mat list du
    mat v = diag(matuniform(5,1)) // һ�������5*5�ԽǾ���
    mat list v



*____________________________ 
*-4.1.7  �����;�����໥ת��

  *-4.1.7.1  ������>����           -mkmat-
    
  * ת��������Ϊͬ��������
    sysuse auto,clear
    mkmat price in 1/10   // ����һ�� 10*1 ����������������Ϊ price
    mat list price
    
    mkmat price weight length if rep78==4  // ��������ͬ��������
    mat list price
    mat list weight
    mat list length
    
  * ����������ϲ���һ������
    mkmat price, matrix(Y)
    gen cons= 1
    mkmat weight length foreign cons, mat(X)
    mat list Y
    mat list X
    
   * Ӧ��ʵ����OLS ϵ������
     mat b = inv(X'*X)*X'*Y
     mat list b
     reg price weight length foreign
   
     * ȱ©ֵ�Ĵ���
       count if price>10000
       replace price =. if price>10000
       count if weight>4000
       replace weight =. if weight>4000 
       mkmat price wei, mat(pw)
       dis rowsof(pw)
       mkmat price wei, mat(pw_no) nomissing  // ��������ȱ©ֵ
       dis rowsof(pw_no)
       list price weight if price==.|wei==.
       count if price==.|wei==.


  *-4.1.7.2  ����>����       -svmat-  -xvmat-

    svmat b, names(coff)
    list coff1 in 1/5
    svmat X, names(var)  // ���ж���ͳһ�ı�����
    drop weight length foreign cons
    svmat X, names(col)  // �þ����������Ϊ����������

    *-xsvmat ���� (svmat����չ) 
      sysuse nlsw88, clear
      xi: reg wage hours ttl_exp i.race
      mat covmat = e(V)  // ����-Э�������
      mat list covmat
   
      xsvmat covmat, list(,)   // �Ա�����ʽ��ʾ���������
      xsvmat covmat, rowname(xvar) rowlab(label) list(, abbr(32))


*_________________________ 
*-4.1.8  �þ���洢ͳ�ƽ��       -makematrix-  -tabstatmat-

    *-4.1.8.1 �Ծ���ʽ����tabstat����Ľ��    -tabstatmat- 
       *-eg1-
        sysuse auto, clear
        tabstat price mpg weight length, save
        tabstatmat A 
        mat list A
       *-eg2-
        tabstat price mpg weight length, save ///
             by(foreign) stat(mean p50 sd min max) format(%6.3f)
        tabstatmat A
        mat list A, format(%6.3f)

    *-4.1.8.2 ��һ�㻯�ľ���洢     -makematrix-
       sysuse auto, clear
       makematrix, from(r(mean) r(sd) r(skewness)) :  ///
                   sum price trunk length weight, detail
               
       makematrix A, from(_b[_cons] _b[mpg] e(r2) e(r2_a))  ///
                   lhs(rep78-foreign) format(%4.3f) :     ///
                   regress mpg
       mat list A
       
       sysuse nlsw88, clear                       
       makematrix B,  ///
         from(_b[_cons] _b[married] _b[age] _b[south] ///
		      _b[ttl_exp] e(r2) e(r2_a))              ///
         lhs(wage hours)                           /// // �����ͱ���
         format(%4.3f) list  sep(0) divider:       ///
         regress married age south ttl_exp             // ���ͱ���
       mat B = B'
       mat colnames B = wage hours
       mat list B
               
       use xtcs.dta, clear
       makematrix, from(_b[_cons] _b[tobin] _se[tobin] ///
                   e(r2) e(r2_w) e(F_f))               ///
                   lhs(tl sl ll) format(%6.5f) :       ///
                   xtreg fr-tobin, fe 
        
       sysuse auto, clear               
       makematrix, from(r(rho)) :                 ///
               spearman head trunk length displacement weight
       spearman head trunk length displacement weight // �Ա�һ��
       
	   *- from()ѡ���п���ִ����ѧ����        
       makematrix, from(r(rho)^2) format(%4.3f) :   ///
               spearman head trunk length displacement weight


*_______________________________ 
*-4.1.9  ���ñ����ķ�ʽ��������     -mgen-

  *-4.1.9.1 �Ծ����еĸ��н��б任�����㣬����ܡ������
    clear
	mat drop _all
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mgen v1=c1+c2 v2=c2+c3, in(a) out(z)
    mat list z
    
  *-4.1.9.2 ����Ԫ�ص���ѧ�任 
    mgen ln_c1=ln(c1) exp_c2=exp(c2), in(a) out(c)
    mat list c
   *- ������һ˼·�����ǿ��ԶԾ����е�Ԫ�ؽ�����ѧ�任
   *- ������ѧ����������ʹ�ã�
      help math functions


*_________________________
*-4.1.10  ����ı���͵���    -matsave-, -matload-, -mat2txt-
  
  *-4.1.10.1 �����󱣴�Ϊ .dta �ĵ���
  
    *- ����˼·��
    *  matsave
    *    �Ѿ���ת��Ϊ����(�μ�4.1.7.2С��),Ȼ�󱣴�Ϊ .dta �ļ�
    *  matload
    *   �� .dta �ļ����룬Ȼ�󽫱���ת��Ϊ����(�μ�4.1.7.1С��)
    
    *-˵����
    * (1) ��������£����Ƕ����豣�����ֻ�豣��do�ĵ����ɣ�
    * (2) ����������£�Ҫͨ���ǳ���ʱ�ļ�����ܵõ�ĳ������
    *     �����������ܻ������������㣬��ʱ��Ҫ���棻  
    
    *- ����ı��棺matsave
       sysuse auto, clear
       reg price weight length mpg
       eret list
       mat COV = e(V)
       *-�����÷�
         matsave COV           // ��������
         matsave COV, dropall replace // ��ȷ����
       
    *- ����ĵ��룺matload
       mat dir     // ��ǰ�ڴ����Ѿ���һ�� COV ����
       matload COV, overwrite dropall // ���ǵ�ǰ�ڴ��е�ͬ������


  *-4.1.10.2 �����󱣴浽 txt, word, excel �ĵ���   -mat2txt-, -dataout-
                             
       sysuse nlsw88, clear
       
     *-����ͳ����
       tabstat wage age ttl_exp hours, stats(N mean sd min max) c(s) save
       tabstatmat A   
       mat A = A'     // ʹ�����tabstatһ��
	   *-����Ϊtxt��ʽ
       mat2txt, matrix(A) saving(mytable01) replace  /// 
                title("Table 1: statistics of key variables")
       shellout mytable01.txt
      
     *-���ϵ������
       makematrix R, from(r(rho)) : spearman wage age ttl_exp hours 
       *-׷�ӽ���� mytable01.txt �ĵ���
       mat2txt, matrix(R) saving(mytable01) append  /// 
                title("""""Table 2: correlation of key variables")
       dataout using mytable01.txt, word excel replace // ת��Ϊword,excel��ʽ
     
     *-��ϰ�����һ�����ع���׷�ӵ������ļ���  
     
     *-��������ʽ��
     *   �μ� A1_intro �ڡ�10.1.1С�ڡ�  �������ͳ����
    
     
	 
	 
	 
	 
	 
	 


          *     -------------------------------------
          *     -------- ����������STATAӦ�� ---------
          *     -------------------------------------
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            ���Ľ�  �������
          *         =====================
		  *            -4.2- ���������
          
          
*---------------------
*-4.2    ���������
*---------------------

     help matrix operators
     
     *         ==����Ŀ¼==
     
     *     4.2.1 ����Ļ�������
     *           4.2.1.1 �ӡ�������
     *           4.2.1.2 ֱ��
     *           4.2.1.3 ��ʽ�˷�
     *           4.2.1.4 ����Ԫ�ص���ѧ�任
     *           4.2.1.5 �����뵥ֵ������   
     *     4.2.2 �����ת��
     *     4.2.3 ����������  
     *           4.2.3.1 ���������ʽ 
     *           4.2.3.2 ��������
     *     4.2.4 �����������
     *     4.2.5 ����ĶԽ�ֵ
     *     4.2.6 ���˾���Ķ���
     *           4.2.6.1 �򵥽��˾���
     *           4.2.6.2 ��Ȩ���˾��� 
     *           4.2.6.3 �û������趨��Ȩ�� 
     *           4.2.6.3 �����Ȩ���˾���     
     
     
*                          ��������
*-------------------------------------------------------
* hadamard(), inv(), issym(), det(), trace(), vecdiag()
* diag(), math(), vec(), mgen(), + - * / #
*-------------------------------------------------------

*            Operator               Symbol
*            -----------------------------
*            parentheses            ()
*            transpose              '
*            negation               -
*            Kronecker product      #
*            division by scalar     /
*            multiplication         *
*            subtraction            -
*            addition               +
*            column join            ,
*            row join               \
*            -----------------------------


*_____________________
*-4.2.1 ����Ļ�������

  *-4.2.1.1 ��(+)����(-)����(*)
  
    matrix e   = J(5,5,3)
    matrix I5  = 5*I(5)
    mat list e, nohalf 
    mat list I5

    * �ӷ�
      mat add = e + I5
      mat list add, nohalf
 
      mat add1 = e + 2         // ����ʽ
      mat add1 = e + J(5,5,2)
      mat list add1

    * ����
      mat sub = e - I5
      mat list sub, nohalf

    * �˷�
      mat prod= e*I5
      mat list prod


  *-4.2.1.2  ֱ��
  
    *-���壺
    
    *          [ a11*B  a12*B  ... a1k*B ]
    *          | a21*B  a22*B  ... a2k*B |
    *  A # B = |   .      .    ...    .  | 
    *          |   .      .    ...    .  |
    *          [ an1*B  an2*B  ... ank*B ]
              
    *--eg1----------------
     mat one = J(4,1,1)
     mat I1  = I(5)
     mat kro = I1 # one
     mat list one
     mat list I1
     mat list kro
    
    *--eg2----------------
     mat xx = J(3,3,-1)
     mat kro2 = I1 # xx
     mat list xx, nonames nohalf
     mat list I1, nonames nohalf
     mat list kro2, nohalf
    
    *--eg3----------------
	 mat a = (1,2 \ 3,4 \ 5, 6)
     mat kro3 = a # xx
     mat list a
     mat list xx, nohalf
     mat list kro3
     
   *-ֱ�˵����ʣ�
   *
   * (1)  (A # B)' = A' # B'  
   *
   * (2)  inv(A # B) = inv(A) # inv(B)
   *
   * (3)  |A # B| = |A|^k*|B|^n  (A��nXn����B��kXk ����)
   *
   * (4)  tr(A # B) = tr(A)*tr(B)
   *
   * (5)  a*b' = a # b' = b' # a
   *
   * (6)  (a # B)*C = a # B*C
   *
   * (7)  A*(b'#C) = b'#AC
   *
   * (8)  (A#b)*C = AC#b 
   *
   * (9)  A(B#c') = AB#c'
   *
   * (10) a'b*CD = (a'#C)*(b#D) 
   
   * ��ϰ����ʹ��stata������֤�������ʡ�
   

  *-4.2.1.3  ��ʽ�˷�: Ԫ�ض�Ԫ�صĳ˷�
 
    mat a = (1,2  \ 3,4 \ 5, 6)
    mat b = (-1,4 \ 0,1 \ -3,12)
    mat aHb = hadamard(a,b)
    * ���ֽ��
      mat m = J(3,1,.) 
      mat R = (a, m, b, m, aHb)
      mat list R
 

  *-4.2.1.4  ����Ԫ�ص���ѧ�任
    
    *-����任
      help math           // arlion ���б�д�ĳ���
     
      mat a = J(4,5,8)
      math ln_a = ln(a)   // ����Ԫ��ȡ����
      mat  list a
      mat  list ln_a
     
      math exp_a = exp(a) // ����Ԫ��ȡ��
      mat  list exp_a
	  
	  sysuse auto, clear
	  reg price wei len foreign
	  mat  V  = e(V)
	  mat list V
	  mat  se2 = vecdiag(e(V))
      math se  = sqrt(se2)    // Arlion �Ա����
	  mat  se0 = vecdiag(cholesky(diag(vecdiag(e(V))))) 
      mat list se
	  mat list se0
	  
	  viewsource math.ado
     
    *-����������⣺
	  view browse http://www.ats.ucla.edu/stat/stata/faq/elemmatrix.htm
	  
    *-�ɹ����õĺ������£�
      help math functions
      
	  
    *-���б任
      help mgen   // ��� 4.1.9.1 С��
    
      mgen v1=ln(c1) v2=exp(c2) v3=sin(c3), in(a) out(b)
      mat list a
      mat list b
    
    * �ر�ע�⣺mgen��ĸ�����ʽ�Կո����֣�
    *           ���ԣ�"v1=ln(c1)" ������дΪ "v1 = ln(c1)"
     
 
  *-4.2.1.5 �����뵥ֵ������
  
    scalar c = 5
    mat D = J(4,4,1)
    mat list D
    
    mat Dc = D*c
    mat list Dc
  
    mat cD = c*D
    mat list cD
  
    mat D_c = D/c
    mat list D_c
      

*__________________________
*-4.2.2 �����ת��: ���л���

  matrix A = (-1, 2 \ 3, 4 )
  matrix B = ( 4, 1, 2, 5 )
  mat    C = (4,1 \ 2, 5)
  
  mat list A
  mat At = A'
  mat list At 
  
  mat list B
  mat Bt = B'
  mat list Bt
  
  * ��ʽ��(A*C)' = C'*A' != A'*C'
    mat ACt  = (A*C)'
    mat AtCt = A'*C'  
    mat CtAt = C'*A'  // ת�����������ڳ˷�����
    mat list ACt
    mat list CtAt
    mat list AtCt


*___________________
*-4.2.3 ����������

   *-4.2.3.1 ���������ʽ����������������һ��ͳ����
     
     mat A = (-1, 2 \ 3, 4)
	 mat list A
     scalar detA = det(A)
     dis detA
     dis -1*4 - 3*2
     
     *= ���ʣ�
        * (1) ��A�����棬�� |A|=0, ��֮��Ȼ
        * (2) |A'|  = |A|
        * (3) |A*B| = |A|*|B|
        * (4) |5*A| = 5^n*|A| 
		*
        *     |A  0| 
        * (5) |    | = |A|*|B|
		*     |0  B| 
        
        
   *-4.2.3.2 ��������
     
     dis issym(A)         // �ж�һ�������Ƿ�Ϊ�Գƾ���
     mat invA = inv(A)
     mat IA   = A*invA
     mat list A
     mat list invA
     mat list IA


*______________________
*-4.2.4  �����������

  *- ���������� �����ڱ��������� stack ����
     mat A  = (-1, 2 \ 3, 4)
     mat vA = vec(A)
     mat list A
     mat list vA 
     
  *- ����������ĶԽ�Ԫ��
     mat E = e + 0.9*I(5)
     mat dA = vecdiag(A)
     mat dE = vecdiag(E)
     mat list A
     mat list dA
     mat list E
     mat list dE
	 *-��:
	   sysuse auto, clear
	   reg price wei len foreign
	   mat b = e(b)
	   mat  V  = e(V)
	     mat list V
	   mat  se2 = vecdiag(e(V))
	     mat list se2
	   mat se2 = diag(se2)        // �����ĶԽǻ�
	     mat list se2
	   mat se = cholesky(se2)     // ���Ϸֽ�
	     mat list se
	   mat t = diag(b)*inv(se)
	   mat list t
       reg price wei len foreign  // ��֤һ��
	   
 
  *- ����������������
  
     * 1. vec(ABC)  = (C'#A)vec(B)
     *
	 * 2. vec(ab')  = b # a
     *
	 * 3. vec(a'#B) = a # vec(B)
	 *
     * 4. vec(a #B) = (Ik # a # In)*vec(B) = vec(B # a')  (B�� nXk ����)
	 *
     * 5. tr(AB) = vec'(A')vec(B) = vec'(B')vec(A)
	 *
     * 6. tr(ABCD) = vec'(A)(B#D')vec(C') = vec'(A')(D'#B)vec(C)
	 *
     * 7. a'BcDF = (c'#a'#D)[vec(B)#F]
	 *
     * 8. Abc'D = (b��#In)vec(A)vec'(D')(c'#Im) = (b'#In#c')[vec(A)#D]
     *    ���У�A��nXk����D��mXj����
     *    In��ʾnXn��λ��
     
     * ��ϰ�������stata������֤��������


	 
*__________________________
*-4.2.5 ����ĶԽ�ֵ(trace)

   *-���壺����ĶԽ�Ԫ��֮��
   
   *-���ʣ�
     * (1) tr(AB) = tr(BA)    // Ҫ��A,B�ɳ�
     * (2) tr(cA) = c*tr(A)   // c �ǵ�ֵ
   
   *-ʾ����
     matrix Atr = trace(A)
     scalar Etr = trace(e)
     mat list A
     mat list Atr
     mat list e
     dis Etr 


	 
*__________________________
*-4.2.6  ���˾���Ķ���

* [P] matrix accum -- Form cross-product matrices

   help matrix accum
 
   *-4.2.6.1 �򵥽��˾���    -matrix accum-�� -matrix vecaccum-
   
     *-Ӧ�ñ���
     *
     *  OLS���ƣ� b = inv(X'X)*X'y
     *
     *  X ��һ�� N*K ά����
     *  ��N�ϴ�ʱ(��N=20000)��������stata���������(11000)
     *  �� X'X ����һ����С�ľ���ά��Ϊ��K*K
     *
     *- matrix accum �Ķ��� 
     *
     *     matrix accum (A) = A'*A     ���У�A = (x1,x2,x3����)
     *
     *- matrix vecaccum �Ķ���
     *
     *     matrix vecaccum(A) = x1'*X  ���У�X = (x2,x3,����)
     *
     *- ������Ҫѡ�
     *  (1) noconstant ���� X �������Զ����ӳ����
     *  (2) deviation  ����������ʽ
 
     *-eg1- ����ģ�͵� OLS ����  
     
       *-Ŀ�ģ���ȡ b = inv(X'X)*X'y
       * ���У�y = price, 
	   *       X =(weight,mpg,Cons)
     
       * ����1�����ʹ�� matrix accum �� matrix vecaccum
         sysuse auto, clear
         mat accum XX = weight mpg
         mat vecaccum yX = price weight mpg
         mat Xy = yX'                     // ����Ҫע��
         mat b = inv(XX)*Xy
         mat list b
         reg price weight mpg, noheader   // �����������
       
       * ����2����ʹ�� matrix accum ����
       * ˼·: �� A = (y, X)�� ��
       *
       *                                       [ y'y  y'X ]
       *   mat accum (A) = S = (y, X)'(y, X) = [          ]
       *                                       [ X'y  X'X ] 
       * 
       * ���У�X �����һ�лᱻ�Զ����볣����
       * �ɼ���X'X �� X'y ���󶼿��Դ� S �����г�ȡ     
         matrix accum S = price weight mpg  // y=price, X=[weight mpg 1]
         mat list S
         matrix XX = S[2..., 2...]
         mat list XX
         matrix Xy = S[2..., 1]
         mat b = inv(XX)*Xy
         mat list b
         reg price weight mpg,nohead       // �����������
    
     *-eg2- ��ȡ���������ϵ������
       sysuse auto, clear
       corr price weight mpg length
       ret list                   
     *-�������ɾ���
       matrix accum R = price weight mpg length, noconstant deviation
       matrix R = corr(R)
       mat list R, format(%6.4f)
 
   
  *-4.2.6.2  ��Ȩ���˾���   -mat glsaccum-
   
    * �������� GLS �����е���ؾ���
    *
    *-mat glsaccum �Ķ���
    *  
    *     mat glsaccum(X) = S = X'BX
    *
    * ���У�B ΪȨ�ؾ��󣬶������£�
    *
    *       [ W_1   0   ...   0  ]
    *       |  0   W_2  ...   0  |
    *   B = |  .    .    .    .  |
    *       |  .    .     .   .  |
    *       [  0    0   ...  W_k ]
    *
    *  W_k(k=1,2,...,K) ��ʾ�� k ��۲�ֵ��Ȩ�ؾ�����һ������
    *
    *  �� X Ҳ��������壬��ɱ�ʾΪ��
    *  
    *        [ X_1 ]
    *        | X_2 | 
    *    X = |  .  |
    *        |  .  | 
    *        [ X_k ]
    *
    *  �ɴ˿��Ը�Ϊϸ�µ��˽⵽ glsaccum �Ķ��巽ʽ��
    *
    *   X'BX = X1'W1X1 + X2'W2X2 + ... + X_k'*W_k*X_k 
    
    *- Ӧ�þ�����White(1980) �췽���Ƚ��Ա�׼��ļ���
    *  
    *  Var(b) = inv(X'X)*(X'WX)*inv(X'X)  // White(1980)�Ƚ��Է���-Э������� 
    *
    *  ���У�
    *  
    *       [ e1^2   0    ...    0  ]
    *       |  0    e2^2  ...    0  |
    *   W = |  .     .     .     .  |
    *       |  .     .     .     .  |
    *       [  0     0    ...  eN^2 ]  NXN ����
    *
    *  ei ��ʾ�� i ���۲�ֵ��Ӧ�Ĳв�
    *
    *  ����Ĺؼ������ (X'WX) ���󼴿ɣ��ɲ��� -mat glsaccum- ����  
     
     *-1 ���OLS����ֵ
       sysuse auto, clear
       mat accum XX = wei len mpg
       mat vecaccum Xy = price wei len mpg
       mat Xy = Xy'
       mat b = inv(XX)*Xy             // ϵ���� OLS ����ֵ
       mat list b
       
     *-2 ��ȡ�в�֮ƽ��������e2
       mkmat price, mat(y)
       gen cons = 1
       mkmat wei len mpg cons, mat(X) // ע�⸽�ӳ�����
       mat e = y - X*b                // �в�����
       mat colnames e = c1
       mgen e2=c1^2, in(e) out(e2)    // Ȩ�أ��в��ƽ����
       
     *-3 ��ȡ (X'WX) ����  
       gen id = _n        // ��򵥵������ÿ���۲�ֵ������һ�����
       sort id
       mat e2 = diag(e2)  // ���в������任Ϊ�ԽǷ���
       mat glsaccum XWX = wei len mpg, group(id) glsmat(e2) row(id)
	   mat list XWX
      
     *-4 ��ȡ�Ƚ��Ա�׼��   
       mat var_b = inv(XX)*XWX*inv(XX)              // ���� White(1980) ����ʽ 
       mat se_rob = cholesky(diag(vecdiag(var_b)))  // �Խ�Ԫ�ؿ����ţ����[s.e.]
       mat se_rob = se_rob/sqrt(70/74)              // �������ɶ�
       mat list b
       mat list se_rob
       reg price wei len mpg, robust nohead         // ��֤һ��
       
     *-5 ���� t ֵ
       mat t_rob = diag(b)*inv(se_rob)              // t-value = b/se
       mat list t_rob   
 

   *-4.2.6.3 �û������趨��Ȩ�� 
   
     *- mat (vec)accum �� mat glsaccum �Ĺ�ϵ
        
        * �����������������صľ����������һ����ʽ��
        *
        *       X1'*B*X2
        *
        *  (1) mat accum: 	 X1=X2, B=I  ==>  X'X
        *  (2) mat glsaccum: X1=X2       ==>  X'BX
        *  (3) mat vecaccum: B=I, X1 ��һ����������X2��һ������
		*                                ==>  y'X   
     
     *- ����ָ��Ȩ��
        
        *-����˼�룺
        *    X1'*B*X2 �ɲ���һ�㻯��ʽ��ʾΪ  
        *    X1'W1*B*W1*X2������ W1 = W^{1/2}
        *
        *    ���û��������趨Ȩ�أ��� W = I 
        *    ���û������趨Ȩ�أ��� pweights(v), �� W = diag(v)
        *    �˴���v ��һ������
        *
        *-��;�����趨 B=I��X1=X2, ���� W1*W1' = W, ����ʽ�ɱ�ʾΪ��
        *     X'*W*X  
        *    ���� mat glsaccum ����صľ�����ʽ���ƣ�
        *    �����������ǿ���ͨ������ v ���趨Ȩ�ؾ���
        *    �����ز��þ������ʽ���趨
         
        *-eg��һ������Ľ������-mat accum-��� -mat glsaccum-
   
        *-�μ�: 
		  view browse http://statalist.org/archive/2002-10/msg00144.html 
     
        *-���⣺
        *   ������ mat glsaccum ������:
        *   mat glsaccum XWX = wei len mpg, group(id) glsmat(e2) row(id)
        *   ���Ǳ����趨 glsmat() ѡ��Ա�ָ��Ȩ�ؾ���
        *   ���У�e2 ��һ�� NXN ����
        *   Ȼ������ N=11000����������ֵʱ���������޷������ e2 �����
        *
        *-���������
        *   ʹ������������
        *   mat accum H = wei len mpg [pw=e2], noc
        *   �˴���e2 ��һ�����������Կ��Ա�����������
        *
        *-ʾ�����飺
          sysuse auto, clear
          reg price wei len mpg
          predict e, res
          gen e2 = e^2      // Ȩ������
        *-����1��mat glsaccum ���� 
          mkmat wei len mpg, mat(X)
          mkmat e2, mat(B)
          mat B = diag(B)
          mat S = X'*B*X
          mat list S
        *-����2��mat accum ������� [pw] ��ָ��
          mat accum H = wei len mpg [pw=e2], noc
          mat list H
               
               
  *-4.2.6.3  �����Ȩ���˾���    -mat opaccum-
  
    * ͬ���������� GLS �����е���ؾ���
    * mat opaccum ������Ϊ mat glsaccum ������
    *
    * mat glsaccum �Ķ��巽ʽ��
    *
    *   A = X'BX = X1'W1X1 + X2'W2X2 + ... + X_k'*W_k*X_k 
    *
    * �����Ȩ�ؾ��� Wi ����һ�㻯�Ķ��巽ʽ�������췽�������������Σ�
    * �ںܶ�����£�Wi ���бȽ��������ʽ����ĳ�����������(outer product):
    *
    *       Wi = e_i*e_i'    
    *
    * ���У�e_i ��һ�� n_iX1 ����, n_i �ǵ� i ����˾��������
	
	*     N  [                    ]                
	*    SUM [ (X_i)'e_i(e_i)'X_i ]
    *    i=1 [                    ]
	
    *-eg:
      use maccumxmpl.dta, clear
      xtdes
      mat opaccum A = x1 x2, opvar(e) group(id)
      mat list A
   


   
   
   
   
   
   
   

          *     -------------------------------------
          *     -------- ����������STATAӦ�� ---------
          *     -------------------------------------
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            ���Ľ�  �������
          *         =====================
		  *            -4.3- ����Ľ���

*---------------------
*-4.3    ����Ľ���
*---------------------

     *           ==����Ŀ¼==
     
     *     4.3.1  ������ء����Զ�������������
     *     4.3.2  �������
     *     4.3.3  ����������������
     *     4.3.4  ��������͸�������
     *     4.3.5  ���Ϸֽ�

*                          ��������
*-------------------------------------------------------
* rank(), mat symeigen, mat eigenvalues, cholesky()
*-------------------------------------------------------


*_____________________________________
*-4.3.1  ������ء����Զ�������������

 * ������غͶ���
 
   * ���� A = [A1, A2, ..., An]
   
   * ���� c1*A1 + c2*A2 + ... + cn*An = 0 (ciΪ����)
   
   * ������һ��ϵ�� c1,c2,...,cn ʹ����ʽ��������� A1,A2,...,An������أ�
   
   * ��֮���������Զ�����
   
 * ��������
   
   * �� Ai'*Aj = 0,(i!=j),������� Ai �� Aj ����  

   

*______________________
*-4.3.2  �������(rank)

 * rank(A) = min(�����������Զ����ĸ����������������Զ����ĸ���)
 
 * ���壺�˴�������ص����������������ṩ�������Ϣ��
 *       �磬нˮ���������ʡ����𣬸�������������ɼ����������
 
   mata
     A = (1,2,3 \ 3,2,1)'
     A
     rank(A)
     B = (1,2,3 \ 3,2,1 \ 4,4,4)'
     B
     rank(B)
   end
   
   *- ���� matrix ������û��ֱ�Ӽ��� rank() �ĺ�����
   *  ����ʹ���� mata ���

   

*__________________________
*-4.3.3  ����������������

  *=���壺 
  *
  *   �������� A�������ҵ������� h ��һ����ֵ e, ʹ��
  *                      A*h = e*h
  *   ��������� h Ϊ A �������������� e Ϊ A ����������

  *=���壺
  *
  *   �൱�ڰѾ����һ������ֽ�������� A ���ܰ��� n ������
  *   ������������Lamda=(e1,e2,...,en); ����������H=(h1,h2,...,hn)

  *=���ʣ�
  *
  *  (1) rank(A) = ��������ֵ�ĸ���(�����һ������ֵΪ0������������)
  *
  *  (2) det(A)  = ����ֵ�ĳ˻� = e1*e2*...*en
  *
  *  (3) trace(A)= ����ֵ�ĺ� = e1+e2+...+en
  *
  *  (4) inv(A) ������ֵΪ 1/e1, 1/e2, ..., 1/en

  *=Stata������ 
  *
  * -�﷨��ʽ�� 
  *
  *   �ǶԳƷ���mat eigenvalues ������ʵ�� �������鲿 = ������
  *   �ԳƷ���  mat symeigen    ���������� ��������   = ������ 

  *-eg1���ǶԳƾ���
    matrix A = (23,12,-9 \ 2,4,-6 \ 5,1,3)
    dis det(A)
    mat eigenvalues H Lamda = A
    mat list H        // ������ʵ��
    mat list Lamda    // �������鲿

  *-eg2�������ȶԳƾ���
    mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
      mat list A
      dis det(A)
	  
    mata   // ���� A �� rank
      A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
      rank(A)
    end
	
    mat symeigen H Lamda = A
      mat list H,format(%6.2f)      // ��������
    mat Lamda = diag(Lamda)
      mat list Lamda
      mat list Lamda,format(%5.4f)  // ������
    
 
  *-eg3�����ȶԳƾ���
    mat A = (12,35,-13 \ 35,108,0.3 \ -13,0.3,42)
      mat list A
    mat symeigen H L = A
      mat list L       // ������
      mat list H       // ��������


   *-��֤�������ʣ�
 
    *-��(rank) 3
      mata
	    A = (12,35,-13 \ 35,108,0.3 \ -13,0.3,42)
	    rank(A)
	  end
   
    *-����ʽ(determine)
      dis det(A)
      dis L[1,1] * L[1,2] * L[1,3]
     
    *-�ԽǺ�(trace)
      dis trace(A)
      dis L[1,1] + L[1,2] + L[1,3]
     
    *-����������������ϰһ�°�

 
*__________________________   
*-4.3.4 �������󡢸�������

  *-���壺
  *   ���� n*n �������� A ��`����' n*1 ���� x������Ķ����Ͷ���Ϊ��
  *             x'Ax  (һ����ֵ)
  *  A ������  �� x'Ax > 0
  *  A ������  �� x'Ax < 0 
  *  A ���������� x'Ax >= 0
  *  A �븺������ x'Ax <= 0
 
    sysuse auto, clear
	reg price wei len fore 
	mat V  = e(V)     // ����
	mat NV = -V       // ����
	mat list V
	
	mat x = matuniform(4,1)   // ��֤ V
	mat xVx = x'*V*x
	mat list x
	mat list xVx
	
	mat x = matuniform(4,1)   // ��֤ NV
	mat xNVx = x'*NV*x
	mat list x
	mat list xNVx	
	
	
	
*__________________   
*-4.3.5 ���Ϸֽ�

  *-���Ϸֽ�(cholesky factorization) 
  * �൱�ھ��󿪸���
  * ��ֻ�������Գƾ���ſɽ��д˷ֽ�
  
    mat A = (23,12,-9 \ 2,4,-6 \ 5,1,3) // �ǶԳ�
    mat chA = cholesky(A)
    mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
    mat chA = cholesky(A)               // ������

    mat A = J(4,4,1) + 3*I(4)   // �����ҶԳ�
    mat B = cholesky(A)         //  A=B*B'          
	mat BT = B'
    mat list A             
    mat list B       // B
	mat list BT      // B'
    mat AA = B*B'       
    mat list AA
 
 *- Ӧ��ʵ����OLS ����ֵ�ı�׼��
    sysuse auto, clear
    reg price wei len
    mat list e(b)
    mat list e(V)
    *- Q: ������÷���-Э������� e(V) ���������ϵ���ı�׼��
    *- A: s.e. ��ʵ���� e(V) �����жԽ���Ԫ�صĿ���
       mat V = e(V)
         mat list V
       mat se2 = vecdiag(V)
         mat list se2
       mat se2 = diag(se2)
         mat list se2
       mat se = cholesky(se2)
         mat list se
       reg, nohead    // ����һ��
    *- һ������ɸ㶨��
       mat ss = cholesky(diag(vecdiag(e(V))))
         mat list ss
    
    *- ��ϰ����θ��� e(b) ����� se ������ȡ t ֵ��
    *- ��ʾ��t[j] = b[j] / se[j]
	   mat b = e(b)
	   mat t = diag(b)*inv(se)
	   mat list t
       



*---------------------------
*-4.4  �йؾ���Ľ�һ��˵��
*---------------------------

     *       ==����Ŀ¼==

     *     4.4.1  ������
     *     4.4.2  ����ϵͳ�еľ���
     *     4.4.3  ����Լ������
     *     4.4.4  ��������Ԫ����ز���
     *     4.4.5  ������ڴ������
     
     
  *_________________   
  *-4.4.1 ������
  
    help matrix functions


  *_________________
  *-4.4.2 ����ϵͳ�еľ���     -matrix get-
  
    help matrix get
    
    sysuse auto, clear
    regress price weight mpg
    matrix list e(b)
    matrix list e(V)

    matrix b = get(_b)     // ����ϵ������
    matrix V = get(VCE)    // ����-Э�������
    matrix list b
    matrix list V

    test weight = 1, notest
    test mpg = 40, accum
    matrix rxtr = get(Rr)  // Լ����������
    matrix list rxtr


  *__________________________________
  *-4.4.3 ����Լ������(���ڼ������)
  
    *-Wald �����У�Լ������ͨ����ʾΪ
    *
    *   R*b = r
    *
    * �磬����ģ�� y = [x1 x2 x3 x4]*(b1 b2 b3 b4)' 
    *    x1-x3 = 2.8
    *    x2-x3 = 0
    * ������Լ�������ɱ�ʾ���£�
    *
    *  [ 1  0  -1  0 0  ] [b1]    | 2.8 |     
    *  [ 0  1  -1  0 0  ] |b2|  = |  0  | 
    *                     |b3|  
    *                     [b4]
    *
    * -mat_put_rr- �������ڶ������ z = [R b]
    
      sysuse auto, clear
      regress price  wei len mpg foreign
      mat z = (1,0,-1,0,0,2.8 \ 0,1,-1,0,0,0)
      mat_put_rr z
      test
	  
	  *-�ȼ���
		test wei - mpg = 2.8
		test len = mpg, accum

		

  *______________________________
  *-4.4.4  ��������Ԫ����ز���

    help matmacfunc
  
    sysuse auto, clear
    mkmat price wei len turn, mat(A)
    local rnames: rowfullnames A
    local cnames: colfullnames A
    dis "`rnames'"
    dis "`cnames'"

    sureg (price foreign weight length)   ///
          (mpg foreign weight turn)       ///
          (displ foreign weight)
    mat b = get(_b)
    local rn: rownames b
    local cn: colnames b
    dis "`rn'"
    dis "`cn'"
	
	*-Ӧ�ã��μ��ڶ��� A2_data �� 2.7.4 С�ڣ������Ķ��� (Line:1986)
	


  *-4.4.5 ������ڴ������
                                                                         /*   
                            ��4-1 ��ͬ�汾�²������趨
      +-------------------------------------------------------------------+
      |           |  -- Intercooled Stata --  |  ------- Stata/SE ------  |
      | Parameter |  Default     min     max  |  Default     min     max  |
      |-----------+---------------------------+---------------------------|
      | maxvar    |    2,047   2,047   2,047  |    5,000   2,047  32,766  |
      | matsize   |      200      10     800  |      400      10  11,000  |
      | memory    |       1M    500K     ...  |      10M    500K     ...  |
      +-------------------------------------------------------------------+

                         ��4-2 �����С���ڴ������
                       +--------------------------+
                       |  matsize  |  memory use  |
                       |-----------+--------------|
                       |      400  |      1.254M  |
                       |      800  |      4.950M  |
                       |    1,600  |     19.666M  |
                       |    3,200  |     78.394M  |
                       |    6,400  |    313.037M  |
                       |   11,000  |    924.080M  |
                       +--------------------------+
                                                                           */
  
  *-�趨�����Ĭ�ϳߴ�
                                                                          
    set matsize 200
    mat a = J(300,1,0)   // ����
    set matsize 400
    mat a = J(300,1,0)   // ��ȷ



* --------------------- over --------------------


