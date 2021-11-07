



          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *           -3.1- �� ��
  
  
          *         ----------------
          *             ����Ŀ¼
          *         ----------------
          *          3.1  �� �� 
          *          3.2  ��άͼѡ�� 
          *          3.3  Ԫ�ش���	
          *          3.4  ����ͼ��ʾ��	
          *          3.5  �� ��



*------------------
*-> 3.1   �� ��
*------------------

          *    ==����Ŀ¼==
		  
          *    3.1.1 Stata ͼ�ε����� 
          *    3.1.2 ��άͼ����Ļ����ṹ 
          *    3.1.3 ���ֳ���ͼ�εļ�ʾ��
          *    3.1.4 ͼ�εĹ���
          *          3.1.4.1 ͼ�εı���
          *          3.1.4.2 ͼ�εĵ��� 
          *          3.1.4.3 ͼ�εĵ���
          *          3.1.4.4 ���� Word
          *          3.1.4.5 ��ѯ
          *          3.1.4.6 ������ʾͼ��
          *          3.1.4.7 ͼ�εĺϲ�
          *          3.1.4.8 ɾ��ͼ�� 
          *    3.1.5 ͼ�ε���ʾģʽ(��ͼģ��) 
          *          3.1.5.1 ��ʾģʽ����
          *          3.1.5.2 ����Ͷ��ĺڰ�ͼ
          *          3.1.5.3 stata �û��ṩ��ģ��
          *          3.1.5.4 �����Լ���ͼ��ģ��	
	  		  

  * cd D:\stata11\ado\personal\Net_course\A3_graph
    cd `c(sysdir_personal)'Net_course_A\A3_graph
	
*________________________
*-3.1.1 Stata ͼ�ε�����
                              
                                     /*
 graph twoway   ��άͼ
      scatter   ɢ��ͼ
      line      ����ͼ
      area      ����ͼ
      lfit      �������ͼ
      qfit      ���������ͼ
      histogram ֱ��ͼ
      kdensity  �ܶȺ���ͼ
      function  ����ͼ
---------------------------------
 graph matrix   ����ͼ
 graph bar      ����ͼ
 graph dot      ��ͼ
 graph box      ����ͼ
 graph pie      ��ͼ
---------------------------------
      ac        ���ϵ��ͼ
      pac       ƫ���ϵ��ͼ
      irf       ������Ӧ����ͼ
---------------------------------
     ... ...                         */ 



*____________________________
*-3.1.2 ��άͼ����Ļ����ṹ

  *-����ܹ� 
    
	* twoway (��Ԫͼ1) (��Ԫͼ2) (...) ��ѡ��1 ѡ��2 ...
    
	* twoway  ��Ԫͼ1 || ��Ԫͼ2 || ... �� ѡ��1 ѡ��2 ...
     
  *-��Ԫͼ�Ķ���
    
	* (��Ԫͼ���� y1 y2 ... x , ѡ��1 ѡ��2 ...)
     
  *-��άͼѡ��Ķ���
    
	* ��άͼѡ����� (�������� , ��ѡ�� ��ѡ�� ...)
    
	
  *- һ����׼��ʵ��
  *-----------------------------------------------------------
     sysuse sp500, clear
     twoway (line high date) (line low date)           ///
           ,                                           ///  
           title("ͼ1����Ʊ��߼�����ͼ�ʱ��ͼ", box) ///
           xtitle("��������", margin(medsmall))        ///
           ytitle("��Ʊ�۸�")                          ///
           ylabel(900(200)1400) ymtick(##5)            ///
           legend(label(1 "��߼�") label(2 "��ͼ�")) ///
           note("������Դ��Stata��˾��SP500.dta")      ///
           caption("˵���������ĵ�һ��Stataͼ�Σ�")    ///
		   saving(mypig.gph, replace)
   *----------------------------------------------------------
   *- ע�⣺���ź�ȫ��Ϊѡ���¶����Ķ���ֻ��һ��


   
*                      +--------+
*=======================��������========================
*                      +--------+

* ͼ���޷��ǵ㡢��(��)�����ֵ�Ԫ�ص����

* ��Щ��ϵ����塰��񡱹�����ͼ��:   ��Ԫͼ������ǰ�Ĳ��֣�

* ÿ��ͼ�εľ���������Ԫ�ص�����������ѡ����ź�Ĳ��֣�

* ��ˣ�ѡ�����д��Stata��ͼ�Ĺؼ���

*=======================================================



*______________________________ 
*-3.1.3 ���ֳ���ͼ�εļ�ʾ��

    sysuse sp500, clear

  *-ɢ��ͼ
    twoway scatter high date
    
  *-����ͼ
    twoway line change date
    
  *-��״ͼ
    twoway bar open date in 1/50
    
  *-ֱ��ͼ
    histogram change
    
  *-�ܶȺ���ͼ
    kdensity close, normal
    
  *-��ѧ����ͼ
    twoway (function y=sin(x), range(-10 10) lw(*1.5))  ///
           (function y=cos(x), range(-10 10) lw(*2.0)), ///
           ytick(-2(0.5)2) ylabel(, angle(0))           ///
           yline(0, lcolor(black*0.5) lpattern(dash))   ///
		   scheme(s1mono)
 
 
*___________________ 
*-3.1.4 ͼ�εĹ���

 *-3.1.4.1 ͼ�εı���
   
   help graph save
   
    *-��һ�ַ�ʽ
      sysuse sp500, clear
      twoway line high date
      graph save fig1.gph, replace
	  graph use fig1.gph           // ����ͼ��
	   
    *-�ڶ��ַ�ʽ
      twoway line high date, saving(A3_price.gph, replace)
	  
    *-�ֶ���ʽ���һ� ��> Save graph ...��> ����ͼ�����ƣ�ѡ�񱣴�����

	
 *-3.1.4.2 ͼ�εĵ��� 
   
   help graph export
   
    sysuse sp500, clear
    twoway line  high low  date
    graph export A3_price.wmf, replace
    graph export "D:\mypaper\A3_price.wmf", replace	
    
    *-ע���൱�����Ϊ������ʽ��ͼ��

    *   ��׺       ����ѡ��       �����ʽ
    *  ------------------------------------------------------------
    *   .ps        as(ps)         PostScript
    *   .eps       as(eps)        Encapsulated PostScript
    *   .wmf       as(wmf)        Windows Metafile
    *   .emf       as(emf)        Windows Enhanced Metafile
    *   .pict      as(pict)       Macintosh PICT format
    *   .png       as(png)        PNG (Portable Network Graphics)
    *   .tif       as(tif)        TIFF
    *    other                    must specify as()
    *  ------------------------------------------------------------
    
  *-�������ͼƬ�ķֱ��� 
    twoway line high low date
    graph export A3_price2.tif, width(3160) height(1800) replace
	shellout A3_price2.tif
    *-ע�⣺�������� .png �� .tif ��ʽ��ͼƬ


 *-3.1.4.3 ͼ�εĵ���
   
   help graph use
     
   graph use fig1.gph 
   graph use fig1, scheme(s1mono)
   graph use fig1, scheme(economist)   

 
 *-3.1.4.4 ���� Word
    
	shellout mypaper.doc
	
	* �һ� ��> copy ��> ճ����Word��
    * ��ͼƬ̫�󣬿����һ�ͼƬ->����ͼƬ��ʽ->��С��������Ӧ�ĵ���
    * �����Ƚ�ͼ�����Ϊ wmf ��ʽ��Ȼ�������� word 
 
 
 *-3.1.4.5 ��ѯ
    graph dir

 
 *-3.1.4.6 ������ʾͼ��
    
	twoway line  high low  date
    graph display, scheme(sj)
    graph save A3_price_sj.gph, replace

 
 *-3.1.4.7 ͼ�εĺϲ�
    
	help graph combine
	
	sysuse sp500, clear
	twoway line high low date
	  graph save A3_price.gph, replace
	twoway line high low date, scheme(s1mono)
	  graph save A3_price_sj.gph, replace	
    graph combine A3_price.gph  A3_price_sj.gph

	
 *-3.1.4.8 ɾ��ͼ��
    erase A3_price.gph
	graph dir


*_____________________
*-3.1.5 ͼ�ε���ʾģʽ  (��ͼģ��)
 
  *-3.1.5.1 ��ʾģʽ����
  
    help schemes   // Stata �ṩ����ʾģʽ
    
    *-�����趨��ʽ
    *  set scheme schemename [, permanently]
    *  graph ...  [, ...  scheme(schemename) ...]
  
    *----ʵ��-----
     sysuse auto, clear
     
	 twoway scatter price weight, scheme(sj)
     graph save A3_gr1.gph, replace
     graph use  A3_gr1.gph, scheme(s2color)
	 
     set scheme  economist
     twoway scatter price weight
     
	 
    *-������ʾģʽһ��
      graph use A3_scheme1.gph 
      doedit A3_scheme1.do

	
  *-3.1.5.2 ����Ͷ��ĺڰ�ͼ
    
	set scheme s1mono
	
	sysuse auto, clear
	twoway scatter price weight
	graph bar price, over(foreign)
	graph bar price, over(rep78) over(foreign) 
    
	sysuse sp500, clear
    twoway (connect high date,sort  msymbol(D))    ///
           (connect low date, msymbol(+)) in 1/20  ///
		   , scheme(s1mono)

		   
  *-3.1.5.3 stata �û��ṩ��ģ��
    
	*-Mitchell �ṩ��ģ��
	  * Mitchell, M. 
	  *   A visual guide to Stata graphics. 
	  *   Stata Press, 2008.
	
      view browse "http://www.stata-press.com/data/vgsg.html"
    
	 * net from http://www.stata-press.com/data/vgsg2/
     * net install vgsg2   // ��װ�ⲿģʽ���
	 * net get vgsg2       // �����������

	 *-e.g
	   use allstates.dta, clear
	   twoway scatter propval100 rent700 ownhome,  ///
	          scheme(vg_s1c)   // vg_s1c �ڰ׵ף���ɫͼ
			  
	   twoway scatter propval100 rent700 ownhome,  ///
	          scheme(vg_s1m)   // vg_s1c �ڰ׵�, �ڰ�ͼ

       *-����ģ��(10����)���μ� Mitchell(2008, section 1.3)
	  
	  
	*-Roger Newson �ṩ��ģ��	  
      
	  help scheme_rbn1mono
	  
	  use allstates.dta, clear
	  
	  *-stataĬ�Ϻڰ�ͼ
	    twoway scatter propval100 rent700 ownhome,  ///
	           scheme(s1mono)   
	  
	  *-rbn1mono ģʽ �ȽϽ���
	    twoway scatter propval100 rent700 ownhome,  ///
	          scheme(rbn1mono) 
        *-��Ҫ�ʵ��޸�
	    twoway scatter propval100 rent700 ownhome,  ///
	           scheme(rbn1mono)                    ///
			   xlabel(,angle(0)) legend(row(1))
    
	*-����ģ��
     
	  findit scheme 
	   
	   
  *-3.1.5.4 �����Լ���ͼ��ģ��
   
      help scheme_files
	  
	  viewsource scheme-rbn1mono.scheme  // rbn1mono ģ��
	
		
	
	
	
	
	
	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *         -3.2- ��άͼѡ��
		  *                  (I)
		  
		  
          *    ==����Ŀ¼==
		  
          *    3.2.1 ������ 
          *          3.2.1.1 ������̶�(tick)���̶ȱ�ǩ(label)
          *          3.2.1.2 ���������: ytitle() xtitle()
          *          3.2.1.3 ����ṹ: yscale() xscale()
          *          3.2.1.4 ˫����ϵ 
          *    3.2.2 ������
          *          3.2.2.1 ���������
          *          3.2.2.2 ʾ��
          *          3.2.2.3 �����λ��
          *    3.2.3 ������
          *          3.2.3.1 Stataͼ�ε����򻮷�
          *          3.2.3.2 ���������������ı߾�
          *          3.2.3.3 ����ͼ�ε��ݺ����
          *          3.2.3.4 ��ͼ������ʾģʽ
          *          3.2.3.5 ��ͼ����ȫͼ��������ɫ�Ŀ���
          *    3.2.4 ͼ����
          *          3.2.4.1 �Զ�������ͼ��
          *          3.2.4.2 ���¶���ͼ��
          *          3.2.4.3 ͼ����λ��
          *          3.2.4.4 ���ͼ��������  
          *          3.2.4.5 ���͵Ŀ���	
	
	
	
*------------------------
*-> 3.2   ��άͼѡ��
*------------------------
  
  help twoway_options

*_______________
*-3.2.1 ������
  
  help axis_options

 
 *-3.2.1.1 ������̶�(tick)���̶ȱ�ǩ(label)
    
	help axis_label_options
    
	set scheme s2color
    sysuse auto, clear
    scatter mpg weight, xlabel(#10)   // ��ʾ�����Ŀ̶ȱ�ǩδ����10����?
    
   * ���̶ȼ���ǩ��ylabel(), xlabel() // ��ʾ�̶ȱ�ǩʱ��ͬʱ��ʾ�̶�
   * ���̶ȣ�	   ytick(),  xtick()  // ���趨��ʾ�̶ȣ�����ʾ��Ҫ�̶ȵı�ǩ
   * �ӿ̶ȼ���ǩ��ymlabel(),xmlabel()
   * �ӿ̶ȣ�	   ymtick(), xmtick()
    
   *-ʵ��
     
	 scatter mpg weight              // Stata Ĭ���趨���ȽϿ��� 
     
	 scatter mpg weight, xlabel(#10) // �ں���������ʾ10����ѵĿ̶ȼ����ǩ 
     
	 scatter mpg weight, xtick(#10)
     
	 scatter mpg weight,    ///
            ylabel(10(5)45) ///
            xlabel(1500 2000 3000 4000 4500 5000) // �����趨�̶ȱ�ǩ 
    
	 scatter mpg weight, ymlabel(##5) xmtick(##10) // �ӿ̶Ⱥ��ӿ̶ȱ�ǩ 
     
	 scatter mpg weight, xlabel(1500 2500 3190 "��λ��" 3500 4500) 
                                   // �̶ȱ�ǩ��`����'�滻Ϊ`����' 

     * �����趨����
     *   rule     example    description
     *  --------------------------------------------------------------
     *   #?       #4         4 �����ֵ
     *   ##?      ##10       10-1=9 ���ӿ̶���ӡ�����̶�֮��
     *                         �������� mlabel() �� mtick() ѡ��
     *   ?(?)?    10(5)45    �� 10 �� 45 ��Χ�ڣ�ÿ�� 5 ��ӡһ���ӿ̶�
     *   none     none       ����ʾ�̶ȱ�ǩ
     *  --------------------------------------------------------------
     *   ע��#? �� ##? �Ƚϳ���

    * �̶ȱ�ǩ�ĽǶ�(�������ѡ���) 
      scatter mpg weight, xlabel(,angle(45)) ylabel(,angle(-15))


	  
 *-3.2.1.2 ���������: ytitle() xtitle()
     
	 help axis_title_options
     
     sysuse auto, clear
     scatter mpg weight, ytitle("��������") xtitle("��������") 
     
   *-����������λ��
     scatter mpg weight, ytitle("��������",place(top))  ///
                         xtitle("��������",place(right)) 
   
   *-������Ĵ���
     scatter mpg weight, xtitle("��������" "(mpg)")


	 
 *-3.2.1.3 ����ṹ: yscale() xscale()
    
	help axis_scale_options
    
  *-��ʾ��Χ�Ŀ���
    scatter mpg weight
	scatter mpg weight, xscale(range(0 5000)) xlabel(0(1000)5000)   
    scatter mpg weight, xscale(range(1000 6000))
    scatter mpg weight, xscale(range(3000 4000))  //Ϊ�β���Ч��
    scatter mpg weight if (wei>=3000&wei<=4000)  // �ֲ���ʾ��Ҫ��if���
    
  *-�����������Ŀ���
    label var mpg    "��������"
    label var weight "��������"
    scatter mpg weight , xlabel(#14)                       // Ĭ������                
    scatter mpg weight, xscale(titlegap(2))   // ������������������� 
    scatter mpg weight, xscale(titlegap(2) outergap(-2)) // ����������±߾� 
    
	
  *-���������ʾ
    
	*-����ʾ������
      scatter mpg weight, yscale(noline) xscale(noline)  
    
	*-����ʾ������Ϳ̶ȱ�ǩ
      scatter mpg weight, yscale(off) xscale(off)  
    
	*-�ޱ߾�
      scatter mpg weight, yscale(off) xscale(off) plotregion(style(none))
      
    *-����������
      scatter mpg weight, xscale(lcolor(red) lwidth(vthick))


	  
 *-3.2.1.4 ˫����ϵ 
   
   help axis_choice_options 
  
  *-���� x ��
    
	sysuse sp500, clear
      twoway line close change date
	  twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2))
      
	  twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2)), ///
             ylabel(-50(10)40, axis(2) angle(0) labsize(small))
  
  *-������ y ��� x ��
      
	  twoway (line close  date, yaxis(1) xaxis(1))  ///
             (line change date, yaxis(2) xaxis(2)), ///
              ylabel(-50(10)40,   axis(2))          ///
              xlabel(15005 15239, axis(2))          ///
              xtitle("", axis(2))
 
 

*_______________
*-3.2.2 ������

  *-3.2.2.1 ���������
    
    * �����⡢�����⡢ע�͡�˵��
    * title()��subtitle()��note()��caption()
      
	  help title_options
  
  *-3.2.2.2 ʾ��
  
    sysuse auto,clear
    
	scatter mpg weight, title("Mileage and weight")
    
	scatter mpg weight, title("Mileage and weight", box)
    scatter mpg weight, title("Mileage and weight", box bexpand)
    
	scatter mpg weight, title("������") subtitle("������")
    
	scatter mpg weight, title("������") ///
                        subtitle("������") ///
                        note("ע������")   ///
                        caption("��һ����˵��")
    
	scatter mpg weight, title("����������������" "ɢ��ͼ") ///
                        subtitle("������������ʵ��")
               
                             
  *-3.2.2.3 �����λ��
  
    *-˵������������ͬ���������������� legend() ѡ�����Ŀ

    * Ĭ��λ��
     *   -----------------------------------
     *   title()                 ����
     *   subtitle()              ����
     *   note()                  �����
     *   caption()               �����
     *   -----------------------------------
     
     * ���¶�λ��position() ��ȡֵ 
     *
     *        +---------------------------------------+
     *        |        11         12        1         |
     *        |                                       |
     *        |       +-----------------------+       |
     *        |10     |10 or 11   12   1 or 2 |     2 |
     *        |       |                       |       |
     *        |       |        �� ͼ ��       |       |
     *        | 9     | 9       ring=0      3 |     3 |
     *        |       |                       |       |
     *        |       |                       |       |
     *        | 8     | 7 or 8     6   4 or 5 |     4 |
     *        |       +-----------------------+       |
     *        |                                       |
     *        |         7         6         5         |
     *        +---------------------------------------+
    
     * Ĭ����Լ�ࣺring() ��ȡֵ
     * ---------------------------------------------------------
     * plot region        0     | ring(0) = ��ͼ����
     * {t|b|l|r}1title()  1     |
     * {t|b|l|r}2title()  2     | ring(k), k>0, ��ͼ������
     * legend()           3     | 
     * note()             4     |
     * caption()          5     | ring() ��ֵԽ�󣬾����ͼ��ԽԶ
     * subtitle()         6     | 
     * title()            7     | 
     * ---------------------------------------------------------
    
     * ʾ��
       scatter mpg weight, title("��������������",position(5))
       scatter mpg weight, title("��������������",position(3) ring(0)) 
       scatter mpg weight, title("��������������",position(3) ring(12))   


	   
*________________
*-3.2.3 ������

  help region_options

  *-3.2.3.1 Stataͼ�ε����򻮷�
	do A3_region.do
    
  *-3.2.3.2 ���������������ı߾�
    twoway function y=x
    twoway function y=x, plotregion(fcolor(green*0.4)) ///
                         plotregion(ifcolor(white))
    twoway function y=x, plotregion(margin(0))  // ͼ��������ԭ�㿪ʼ����
    twoway function y=x, graphregion(margin(0))   
    twoway function y=x, plotregion(margin(l+15 r+5 t=10 b+4))  
                                        /*�ĸ��߾���Էֱ����*/
                                        
  *-3.2.3.3 ����ͼ�ε��ݺ����
    twoway function y=x  /*��εõ������ε�ͼ�Σ�*/
    twoway function y=x, ysize(5) xsize(5)
    
  *-3.2.3.4 ��ͼ������ʾģʽ
    twoway function y=x, plotregion(style(none))    
    twoway function y=x, plotregion(style(ci2))
    
  *-3.2.3.5 ��ͼ����ȫͼ��������ɫ�Ŀ���
    sysuse auto, clear
    scatter mpg weight, graphregion(fcolor(green*0.8)) ///
                        graphregion(ifcolor(yellow))   ///
                        plotregion(fcolor(black*0.3))  ///  
                        plotregion(ifcolor(white))     ///
                        title("Stataͼ�ηֳ��ĸ�����")



*_______________
*-3.2.4 ͼ����
  
  help legend_options

  *-3.2.4.1 �Զ�������ͼ��
  
    * һ��ͼ��ͬʱ���ֶ�����У�����Զ�����ͼ��
    * ���ڱ������ԣ���Ĭ��ͼ�������ı�����ǩ
  
    sysuse sp500, clear
    twoway (line high date) (line low date)  // ��μ�������ͼ����
    
    sysuse auto, clear
    twoway (scatter price weight if foreign==1) ///
             (lfit price weight if foreign==1)  ///
           (scatter price weight if foreign==0) ///
             (lfit price weight if foreign==0)  
    * ��ʱ��ͼ���Եù��ڷ���


  *-3.2.4.2 ���¶���ͼ��

   * ��һ�ַ�ʽ��Ԥ�ȶ��������ǩ
     sysuse sp500, clear
     label var high ��߹ɼ�
     label var low  ��͹ɼ�
     twoway (line high date) (line low date)
     *-ȱ�㣺�����øı������ǩ
     
   * �ڶ��ַ�ʽ��ÿ��ͼ������ͼ��
     sysuse sp500, clear
     twoway (line high date,legend(label (1 "��߼�"))) ///
            (line low date, legend(label (2 "��ͼ�")))
            
   * �����ַ�ʽ�������ͼ��
     twoway line high date || line low date, ///
         legend(label(1 "��߼�") label(2 "��ͼ�"))
         
   * ����ʾͼ�� legend(off)
     twoway (line high date) (line low date), legend(off)


  *-3.2.4.3 ͼ����λ��
 
   * legend ��Ĭ��λ���� ring(3)
   
   * ��ͼ��`��'��ʱ�ӵ���
     twoway line high date || line low date, ///
	        legend(position(12))  
     
   * ��ͼ��`��'��ʱ�ӵ��� ring(0)
     twoway line high date || line low date, ///
	            legend(ring(0)) 
     twoway line high date || line low date, ///
	            legend(position(12) ring(0))
      
   * �ı�legend()�����λ��
     * note()   ��Ĭ��λ���� ring(4)
     * caption()��Ĭ��λ���� ring(5)
     twoway line high date || line low date,  ///
         note("addad") caption(������Դ��Stata ��˾)
     twoway line high date || line low date,   ///
         caption(������Դ��Stata ��˾, ring(3)) ///
         legend(ring(5))    


  *-3.2.4.4 ���ͼ��������  rows(#), cols(#) ѡ��
    sysuse uslifeexp.dta, clear
    line  le le_w le_b  year
    line  le le_w le_b  year, legend(rows(1))
    line  le le_w le_b  year, legend(cols(1) size(small))

	
  *-3.2.4.5 ���͵Ŀ���
    
	help connect_options
    help linepatternstyle
    help linestyle
   
    sysuse sp500, clear
	
    twoway connect open close low  date in 1/10
							  
    twoway connect open close low  date in 1/10,  ///
                   lpattern(solid dash longdash)
					   
    twoway connect open close low  date in 1/10,  ///
                   lpattern(solid dash longdash)  ///
					   scheme(s1mono)  // �ڰ�ͼƬ




	
	
	
	
	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *         -3.2- ��άͼѡ��
		  *                 (II)
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph
		
          
		  *     ==����Ŀ¼==

          *    3.2.5 ��������
          *          3.2.5.1 ѡ��ṹ
          *          3.2.5.2 ������ <λ��>
          *          3.2.5.3 ������ <���>
          *          3.2.5.4 ������ <�߿�>
          *          3.2.5.4 ������ <��ɫ>
          *          3.2.5.5 ������ <����>
          *          3.2.5.5 ���������ԵĶ�����
          *    3.2.6 �������ı���
          *          3.2.6.1 ѡ�����
          *          3.2.6.2 ���ֺ��ı����������
          *          3.2.6.3 �ı�������
          *          3.2.6.4 ��������  
          *    3.2.7 ͼ����
          *          3.2.7.1 ���
          *          3.2.7.2 ͼ���λ��
          *          3.2.7.3 ͼ��Ĵ�С
          *          3.2.7.4 ͼ��ĽǶ� 
          *          3.2.7.5 ͼ�����ɫ
          *    3.2.8 ����ѡ��
          *          3.2.8.1 �����ͼ
          *          3.2.8.2 �������ñ�����ǩ
          *          3.2.8.3 �������ñ�����ʾ��ʽ
          *          3.2.8.4 ����ͼ������
		  
		  
*__________________
*-3.2.5 ��������

  help added_line_options
  
  *-˵���������н��ܵĸ��������ԣ�����������������صĶ���

 *-3.2.5.1 ѡ��ṹ
  
  * twoway ..., yline(����, ��ѡ��)
  * twoway ..., xline(����, ��ѡ��)
    *-�� �֣� ���Ƹ����ߵ�λ��
    *-��ѡ����Ƹ����ߵ����͡���ɫ����ȵ�
    
	
 *-3.2.5.2 ������ <λ��>
   
   sysuse sp500, clear
   line open date, yline(1100)
   line open date, yline(1100 1313) xline(15242)
   
   
 *-3.2.5.3 ������ <���>
   
   * defult      ��������ʾģʽ(set scheme)
   * extended    ���쵽��ͼ����
   * unextended  �����쵽��ͼ����
   
   line open date, yline(1100, style(unextended))
   *-����
   line open date, yline(1100, style(unextended)) ///
                   plotregion(fcolor(green*0.3))  ///
				   plotregion(ifcolor(white))
   line open date, yline(1100)                    ///
                   plotregion(fcolor(green*0.3))  ///
				   plotregion(ifcolor(white))				   
   
   
 *-3.2.5.4 ������ <�߿�>
   
   help linewidthstyle
   
   line open date, yline(1100, lwidth(thick))  // ���ô����趨
   line open date, yline(1100, lwidth(*1.5))   // �趨��Կ��
   
   
 *-3.2.5.4 ������ <��ɫ>
   
   graph query colorstyle
   
   line open date, yline(1100, lcolor(blue))  
   line open date, yline(1100, lcolor(blue*0.3))   
   
   
 *-3.2.5.5 ������ <����>
   
   help linepatternstyle
   
   palette linepalette 
   
   line open date, yline(1100, lpattern(dash) lcolor(black*0.3))  
   line open date, yline(1100, lpattern(dot)) 
    
	
 *-3.2.5.5 ���������ԵĶ�����
   
   line open date, yline(1100,lp(shortdash_dot) lc(blue*0.6))  ///
                   yline(1313,lw(*2.5) lc(green*0.4))          ///
                   xline(15242,lw(*2) lc(pink*0.4) lp(longdash))



*_____________________
*-3.2.6 �������ı���

  help textbox_options
  help textstyle
  help textboxstyle
  
  * ָ���Խ����� word �е��ı���
  * ���ǳ������ֵĵط���������������趨

  
  *-3.2.6.1 ѡ�����
   
   * ���ֺ��ı����������  ���⡢�����⡢�ı���С��
   
   * �ı�������趨���ı�����ɫ�������������ֵı߾��
   
   * ������ص��趨����С����ɫ��λ�á��о�

   
 *-3.2.6.2 ���ֺ��ı����������
   
   *-���ֵķ��: ���ֵı�׼����С
     help textstyle
   
   *-�ı���ķ��
     help textboxstyle
     line open date, title("SP500 ���̼�", tstyle(subheading))
   
   *-�������ı��������
   *  ���֣�  ���У��ޱ߿�
   *  �ı��򣺵��л���У��ɼӱ߿������ֵĸ�һ�㻯����


 *-3.2.6.3 �ı�������
 
   *-��ʾ�ı���
	 line open date, title("SP500 ���̼�", box)
   
   *-�ı������Դ�С
     line open date, title("SP500 ���̼�", box width(60) height(15)) 
   
   *-�ı���ı����ͱ߿����ɫ
     line open date, title("SP500 ���̼�", box fcolor(blue*0.2))   //������
     line open date, title("SP500 ���̼�", box bcolor(yellow*0.4)) //�����ͱ߿�
     line open date, title("SP500 ���̼�", box fc(blue*0.2) lc(red))
   
   *-�߿�Ĵ�ϸ������
     line open date, title("SP500 ���̼�", box fc(yellow*0.2)  ///
                       lc(green) lwidth(*2.5) lpattern(dash)) 
   
   *-������߿�����λ��
     line open date, title("SP500 ���̼�", box width(60) height(15) ///
                     alignment(middle))    // ����λ
     line open date, title("SP500 ���̼�", box width(60) height(15) ///
                     justification(right)) // ����λ 


 *-3.2.6.4 ��������  
 
  *-����λ��
    
	help compassdirstyle
     
	 * ���Ʊ����λ��: place()
       line open date, xtitle("��������", place(right)) ///
                       ytitle("���̼۸�", place(top))
     
	 * ��ͼ���е��ض�������������
       line open date, text(1324.83 15117 "һ������") 
      
	  
  *-���ֵĽǶ�
    
	help anglestyle
    
	line open date
    line open date, xlabel(, angle(30)) ylabel(,angle(0))
    line open date, xlabel(, angle(30)) ylabel(,angle(15)) ///
	                         ymlabel(##4,angle(15))
    
	
  *-���ִ�С
    
	help textsizestyle
     
	line open date, text(1324.83 15117 "һ������",size(huge)) // ���Դ�С
    line open date, text(1324.83 15117 "һ������",size(*1.6)) // ��Դ�С 
      
	  
  *-������ɫ
    
	help colorstyle
     
	line open date, text(1324.83 15117 "һ������",color(blue))
    line open date, text(1324.83 15117 "һ������",color(black*0.4))
     
  *-�����о�
    
	line open date,   ///
	     note("SP500ָ����ʱ��ͼ""(�ڴ��ڼ䣬�������δ����)", ///
		 color(blue))
    
	line open date,   ///
	     note("SP500ָ����ʱ��ͼ""(�ڴ��ڼ䣬�������δ����)", ///
         color(blue) linegap(2.5))



*_______________
*-3.2.7 ͼ����

  help markerlabelstyle
  help marker_options
  help marker_label_options

  
  *-3.2.7.1 ���
   
    *-����ṹ��  twoway (��Ԫͼ) , mlabel(���ֱ���) ����ѡ��
      
	  sysuse lifeexp, clear
	  
      do A3_mlabel.do
      
	  list lexp gnppc country2 if region==2
      scatter lexp gnppc if region==2, mlabel(country2)

	  
 *-3.2.7.2 ͼ���λ��
   
   *-�����趨
     scatter lexp gnppc if region==2,   ///
	         mlabel(country2) mlabposition(9)
     scatter lexp gnppc if region==2,   ///
	         mlabel(country2) mlabp(3) 
               
			   help clockposstyle
             
			 *         11  12  1
             *       10         2
             *        9    0    3
             *        8         4
             *          7  6  5  
   
   *-�����趨
	 gen pos = 3
     replace pos = 4  if country2=="����"
     replace pos = 1  if country2=="�궼��˹"
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos)
     scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             xscale(range(-2000 33000))
        
		
 *-3.2.7.3 ͼ��Ĵ�С
   
   *-��׼����С
     
	 help textstyle
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabtextstyle(heading)
			 
   *-�����С
     
	 help textsizestyle
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabsize(vsmall) 
			 
     scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabsize(*0.7)  // �Ƽ����ô˷���
         
		 
 *-3.2.7.4 ͼ��ĽǶ� 
   
   * ������������ֵ
   * 0 ˮƽ  90 ��ֱ 
   
   help anglestyle
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
           mlabangle(15)
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
		   mlabangle(-15)               ///
		   xscale(range(35000) log)
		   
   help axis_scale_options
   
   
 *-3.2.7.5 ͼ�����ɫ
   
   help colorstyle
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
           mlabcolor(green)



*__________________
*-3.2.8  ����ѡ��

  *-3.2.8.1 �����ͼ
  
    help by_option
   
    sysuse auto, clear
    scatter mpg weight, by(foreign)
    scatter mpg weight, by(foreign, total)
    scatter mpg weight, by(foreign, total rows(1))
    scatter mpg weight, by(foreign, total cols(1))
	scatter mpg weight, by(foreign, total cols(1) style(compact))
	
	
   *------------------һ�����ӵ�ʾ��-----------------------
	use comp2001ts, clear
	  browse
    reshape long price, i(date) j(compname) string
      browse
    
	#delimit ;	    // ��ɫͼ��
	twoway tsline price ,  
	  by(compname, cols(1) yrescale note("") compact)
      ylabel(#2, nogrid) 
	  title(" ", box width(130) height(.001) bcolor(ebblue))
	  subtitle(, pos(5) ring(0) nobexpand nobox color(red))
	  scheme(s2color) ;
    #delimit cr
  
	#delimit ;	    // �ڰ�ͼ��
	twoway tsline price ,  
	  by(compname, cols(1) yrescale note("") compact)
      ylabel(#3, nogrid) 
	  title(" ", box width(130) height(.001) bcolor(black*0.3))
	  subtitle(, pos(5) ring(0) nobexpand nobox color(black))
	  scheme(s1mono) ;
    #delimit cr	
   *--------------------------------------------------------
   
   
  *-3.2.8.2 �������ñ�����ǩ
  
    help advanced_options
   
    sysuse sp500, clear
	
    twoway line close date,     ///
	    yvarlabel("���̼�") xvarlabel("��������")
    
	twoway line high low date,       ///
        yvarlabel("��߼�" "��ͼ�") ///
        xvarlabel("��������")
  
  *-˵������ legend() ����Ҫ���


  *-3.2.8.3 �������ñ�����ʾ��ʽ
  
    help advanced_options 
   
    twoway line high date, xvarformat(%tdY-n-d) yvarformat(%6.2f) 


  *-3.2.8.4 ����ͼ������
  
    twoway line change date, recast(area)
  
    twoway area change date
  
    twoway (line change date if change>0, recast(spike)) ///
           (line change date if change<0, recast(area))
  
    twoway (line change date, recast(area) color(blue)) ///
           (line change date if abs(change)<15, recast(area) color(red)), ///
           legend(label(1 "|change|>=15") label(2 "|change|<15"))
         
    twoway function y=normalden(x), range(-4 4) 
   
    twoway function y=normalden(x), range(-4 4) recast(spike)
  
    twoway (function y=normalden(x), range(-4 4)) ///
       (function y=normalden(x), range(-4 -1.96)  ///
           recast(area) color(black*0.4))         ///
       (function y=normalden(x), range(1.96   4)  ///
           recast(area) color(black*0.4)),        ///
       legend(off)
         
		 
    *-ʾ������ɫ����       
      
	  doedit A3_area02.do


	



	
	
	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *          -3.3- Ԫ�ش���
				  
	  
*------------------------
*-> 3.3     Ԫ�ش���
*------------------------

          *     ==����Ŀ¼==

          *    3.3.1 ��ɫ����
          *    3.3.2 �� ��صĴ���
          *          3.3.2.1 ���ʹ���
          *          3.3.2.2 �߿����
          *          3.3.2.3 ���ӷ�ʽ����
          *    3.3.3 ��Ƿ��ŵĴ���
          *          3.3.3.1 ������ʽ
          *          3.3.3.2 ���ŵı߽�����
          *          3.3.3.3 ���Ŵ���һ��
          *    3.3.4 ������صĴ���
          *          3.3.4.1 ���ִ�С����
          *          3.3.4.2 ���ֽǶȴ���
          *          3.3.4.3 ���ֶ��뷽ʽ�Ĵ���
          *    3.3.5 �߾��С�Ĵ���	
		  
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph		  

		
*________________
*-3.3.1 ��ɫ����

  help colorstyle
  graph query colorstyle
  
  * ��ʾ�ض�����ɫ
    palette color  blue brown
    palette color  olive dkorange
    
  * ��ɫģ��
    palette_all            // �ⲿ����
	palette_all, b(white)  // ָ�����������ڶԱ�
    palette_all, b(black)

	vgcolormap             // �ⲿ����,Ч������
	
	clear
	full_palette           // �ⲿ������� RGB ����, 66 ����ɫ
	browse
    
	
  * �����Լ�ϲ������ɫ
  *    �����ʽ                  ��ɫ��ʽ
  * ---------------------------------------------------------
  *   # # #        RGB value; white = "255 255 255"
  *   # # # #      CMYK value; yellow = "0 0 255 0"
  *   color*#      color with adjusted intensity; yellow*1.2
  *   *#           default color with adjusted intensity
  * ---------------------------------------------------------
  
  *- ������׼ɫ��      
  *		 red     =   255    0    0
  *      green   =     0  255    0
  *      blue    =     0    0  255

      
	*-RGB �� CMYK ֮���ת��
	  colortrans 255 0 0
      colortrans 0 255 255 0
	  ret list
  
  

*____________________
*-3.3.2 �� ��صĴ���

  help lines
  
  help line_options
  

 *-3.3.2.1 ���ʹ���
   
   help linepatternstyle
   help linestyle
   
   palette linepalette           // ͼʾ
   
   graph query linepatternstyle  // ��ʾ����
   
   twoway function y=normalden(x), range(-4 4) lpattern(longdash)
   
 
 *-3.3.2.2 �߿����
   
   help linewidthstyle
   
   graph query linewidthstyle
   
   twoway function y=normalden(x), range(-4 4) lwidth(vthick)
  
 
 *-3.3.2.3 ���ӷ�ʽ����
   
   help connectstyle
   
   graph query connectstyle
   
   twoway function y=normalden(x), range(-4 4) n(50) ///
                   connect(stepstair)


   
*______________________
*-3.3.3 ��Ƿ��ŵĴ���

  help symbolstyle
  palette symbolpalette 
    
  *-3.3.3.1 ������ʽ
   
   sysuse auto, clear
   twoway (scatter price weight if foreign,  msymbol(T))  ///
          (scatter price weight if !foreign, msymbol(dh)),  ///
          legend(label(1 "����") label(2 "����"))
          
   * ��һ���﷨��ʽ
    sysuse sp500, clear
    twoway scatter high low date, msymbol(oh dh)
    
	
  *-3.3.3.2 ���ŵı߽�����
    
	* mlcolor()���߽���ɫ�� mfcolor(): �����ɫ
    
	sysuse auto, clear
    scatter mpg weight, msymbol(O) mlcolor(green) mfcolor(yellow*0.5)

	
  *-3.3.3.3 ���Ŵ���һ��
    
	help showmarkers
	
	showmarkers, over(msymbol)
	showmarkers, over(msymbol) msize(large)
	showmarkers, over(msize)   
	showmarkers, over(mcolor)    // �߽���ɫ
	showmarkers, over(mfcolor)   // �����ɫ
	showmarkers, over(mlcolor) mfcolor(gray)   ///
	             msize(large) mlwidth(medthick)
	showmarkers, over(mlwidth) mfcolor(gray)   ///
	             msize(large) mlcolor(navy)
	showmarkers, over(msymbol) scheme(s1mono)
    showmarkers, over(msymbol) msize(large)    ///
	             scheme(s1mono)
	
	
	
	
*______________________
*-3.3.4 ������صĴ���

  *-3.3.4.1 ���ִ�С����
   
    help textsizestyle
   
   
  *-3.3.4.2 ���ֽǶȴ���
   
    help anglestyle
   
   
  *-3.3.4.3 ���ֶ��뷽ʽ�Ĵ���
   
    help justificationstyle  // ���Ҷ��뷽ʽ
    help alignmentstyle      // ���¶��뷽ʽ


*______________________
*-3.3.5 �߾��С�Ĵ���
   
   help marginstyle


*---------------------���ڴ��ŵ�һ��˵��-------------------------
*  ��������£�Stata��֧�������ֵ��Ϊ�����ṩ��һ�ֱ�ݵ��趨��ʽ
*  ��, text("����",size(*0.5) 
*      color(green*0.3))
*      xline(30, lwidth(*1.5))
*---------------------------------------------------------------








	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *       -3.4- ����ͼ��ʾ��
		  *                 (I)

		
*--------------------------
*-> 3.4   ����ͼ��ʾ�� (I)
*--------------------------

          *    ==����Ŀ¼==

          *    3.4.1 ɢ��ͼ
          *    3.4.2 ����ͼ
          *    3.4.3 ����ͼ
          *    3.4.4 ����ͼ
          *    3.4.5 ֱ��ͼ
          *    3.4.6 �ܶȺ���ͼ
          *    3.4.7 �ۻ��ֲ�����ͼ  
		    
        cd `c(sysdir_personal)'Net_course_A\A3_graph	

		

*-���ԣ������ļ���ʹ��
  
  * ����ͼ�ε�ѡ���Ϊ���ࣺ`ר��ѡ��' �� `����ѡ��'
  * ����ѡ����Բο������˵��������д
  * ר��ѡ��ͨ�����٣�Ҳ������д

  help twoway bar
  help twoway lfit
  help twoway scatter


*--------------
*-3.4.1 ɢ��ͼ

  help twoway scatter
  
     sysuse uslifeexp2, clear
     #delimit ;
        scatter le year,
                title("ͼ1: ɢ��ͼʾ��")
                subtitle("Ԥ������, ����")
                yvarlabel(Ԥ������)
                xvarlabel(���)
                note("1")
                caption("������Դ:  ����������Ҫͳ�����ϱ���,
                         ��5��-��6��")
                scheme(economist);
      #delimit cr


	  
*--------------
*-3.4.2 ����ͼ

  help line  
  
  *-ע�⣺��Ҫ�� x ��������
     sysuse auto, clear
     line mpg weight
     line mpg weight, sort
     
	 
  *-һ���ϸ��ӵ�����   
     
	do A3_line.do  
	 
	*-------------------------A3_line.do --------------------------
	 sysuse uslifeexp, clear
     gen diff = le_wmale - le_bmale
     label var diff "��������"
     #delimit ;  
       twoway (line le_wmale year, yaxis(1 2) xaxis(1 2))
              (line le_bmale year)
              (line diff  year)
              ,
              ylabel(0 20(10)80,     gmax angle(0))
              ylabel(0(5)20, axis(2) gmin angle(0))
              xlabel(1918, axis(2)) 
              title("ͼ2�����˺ͺ���Ԥ������")
              subtitle("����, 1900-1999")
              ytitle("Ԥ������ (��)")
              xtitle("���")
              ytitle("", axis(2))
              xtitle("", axis(2))
              note("������Դ:  ����������Ҫͳ�����ϱ���, ��5��-��6��"
                   "(1918 �޽�: Դ��1918��ȫ�������и�ð)",linegap(1.2))
              legend(label(1 "��������") label(2 "��������") 
                     rows(1) size(*0.7));
     #delimit cr
	*--------------------------------------------------------------     
     
	 
	 
*--------------
*-3.4.3 ����ͼ

   help twoway area
   
   *-��ʵ��������ͼ�ı��Σ��޷����������·���������Ϳ����ɫ���ѣ�
 
   sysuse gnp96, clear
   twoway line d.gnp96 date, yline(0,lc(black*0.4) lp(dash))
   twoway area d.gnp96 date
   
  * һ�����������ʾ��
    #delimit ;
     twoway area d.gnp96 date, 
                 xlabel(36(8)164, angle(45))
                 ylabel(-100(50)200, angle(0))
                 ytitle("Billions of 1996 Dollars")
                 xtitle("")
                 subtitle("Change in U.S. GNP", position(11))
                 note("Source: U.S. Department of Commerce,
                       Bureau of Economic Analysis") ;
    #delimit cr
    
    
	
*--------------
*-3.4.4 ����ͼ

   help twoway spike   // �򵥶���ͼ
   help twoway rspike  // ������ͼ
   
 *-�����ڹ�Ʊ����
  
    sysuse sp500, clear
    twoway spike high date
    twoway rspike high low date
    twoway (rspike hi low date) (line close date) in 1/57
               
  *-����ʾ��    
    
  *-e.g 1
	sysuse sp500, clear
    replace volume = volume/1000
    #delimit ;
        twoway (rspike hi low date)
               (line   close  date)
               (bar    volume date, barw(.25) yaxis(2))
                in 1/57
            , 
		    yscale(axis(1) r(900 1400))
            yscale(axis(2) r(  9   45))
            ylabel(, axis(2) grid)
            ytitle("�ɼ� -- ���, ���, ����",place(top))
            ytitle("������ (�����)", axis(2) bexpand just(left))
            xtitle(" ")
            legend(off)
            subtitle("S&P 500", margin(b+2.5))
            note("������Դ: �Ż��ƾ���");
    #delimit cr
	
  *-e.g 2
	sysuse sp500, clear
    replace volume = volume/10000	
	twoway (rarea high low date)           ///
	       (spike volume date, yaxis(2)),  ///
            legend(span)
	*-�Ľ�
	twoway (rarea high low date)           ///
	       (spike volume date, yaxis(2)),  ///
           legend(span)	                   ///		
           yscale(range(500 1400) axis(1)) ///  // new!
		   yscale(range(0 5) axis(2))      ///  // new!
		   ylabel(,angle(0))               /// // new!
	       ylabel(,angle(0) axis(2)) 


	
*--------------
*-3.4.5 ֱ��ͼ

   help histogram
   
    *-����
      sysuse nlsw88.dta, clear
      histogram wage
      gen ln_wage = ln(wage)
      histogram ln_wage         // ����ת����������������̬�ֲ�
        
    *-ͼ�ε�������
      histogram wage            // �����ĸ߶ȶ�Ӧ������ռ�������ı�����
	                            // �����Ϊ 1
      graph save g0.gph, replace
      histogram wage, fraction  // �������ĸ߶��ܺ�����Ϊ 1
      graph save g_frac.gph, replace
      histogram wage, frequency // ������Ϊ��Ӧ�������������Ǳ���
      graph save g_freq.gph, replace
      graph combine g0.gph g_frac.gph g_freq.gph, rows(1)
      
    *-����ѡ��
      histogram ttl_exp, normal  // ������̬�ֲ�����
      histogram wage, kdensity   // �����ܶȺ�������
      histogram wage, addlabels  // ÿ�������Ϸ�����һ����ʾ��߶ȵ�����
      histogram wage, by(race)
      
    *-��ɢ������ֱ��ͼ
      histogram grade
      graph save d1, replace
      histogram grade, discrete  // ��ɢ������ֱ��ͼ���븽�� discrete ѡ��
      graph save d2, replace
      graph combine d1.gph d2.gph
	  
	*-��������ʾ
	  histogram wage, gap(50)
	  histogram wage, gap(90) scheme(s1mono)	  
	  histogram wage, gap(99.9) scheme(s1mono) blwidth(thick)
      
    *-�������ֱ��ͼ
      sysuse auto, clear
      histogram mpg, percent discrete                 ///
          by(foreign, col(1) note(����ָ�꣺��������) ///
                      title("ͼ3����ͬ������������")  ///
                      subtitle("ֱ��ͼ")              ///
             )                                        ///
          ytitle(�ٷֱ�) xtitle(��������) 
    
	
    *-һ���ϸ��ӵ�����     
      
	  do A3_histogram.do
 
      *-----------------A3_histogram.do----------------------
	   sysuse sp500, clear
       #delimit ;
       histogram volume, freq normal 
                 addlabels addlabopts(mlabcolor(blue))
                 xaxis(1 2)
                 ylabel(0(10)65, grid)
                 xlabel( 12321 "mean"
                          9735 "-1 s.d."
                         14907 "+1 s.d."
                          7149 "-2 s.d."
                         17493 "+2 s.d."
                         20078 "+3 s.d."
                         22664 "+4 s.d."
                        ,axis(2) grid gmax
                       )
                 subtitle("ͼ4��S&P 500 ������ (2001��1��-12��)")
                 ytitle(Ƶ��)
                 xtitle("������(ǧ��)") xscale(titlegap(2))
                 xtitle("", axis(2))
                 note("������Դ���Ż����ƾ�����");
       #delimit cr
      *------------------------------------------------------                
     
 
 
*------------------
*-3.4.6 �ܶȺ���ͼ
 

   *-Kernal �ܶȺ���ͼ
     
	 help kdensity 
	 
	 sysuse nlsw88, clear
	 kdensity wage
	 kdensity wage, normal
     
   *-�Ѷ�������ĺ��ܶȺ���ͼ������һ��ͼ��
     sysuse sp500, clear
     twoway (kdensity open) (kdensity low)
     twoway (kdensity open) (kdensity high) (kdensity low) (kdensity close)
     
   *-�Ƚϲ�ͬ���������ܶȺ���
     sysuse auto, clear
	 kdensity weight, nograph generate(x dx)
	 kdensity weight if foreign==0, nograph generate(dx0) at(x)
	 kdensity weight if foreign==1, nograph generate(dx1) at(x)
	 label var dx  "all cars"
	 label var dx0 "Domestic cars"
	 label var dx1 "Foreign cars"	 
	 line dx dx0 dx1 x, sort lw(*2.5 *1.5 *1.5)
	 
	 *-��һ�ַ���
	 sysuse auto, clear
	 kdensity weight              , nograph gen(p_x  d_x)
	 kdensity weight if foreign==0, nograph gen(p_x0 d_x0)
	 kdensity weight if foreign==1, nograph gen(p_x1 d_x1) 
	 label var d_x  "all cars"
	 label var d_x0 "Domestic cars"
	 label var d_x1 "Foreign cars"
	 twoway (line d_x p_x) (line d_x0 p_x0) (line d_x1 p_x1)
  
   *-������������    -akdensity- �ⲿ���� SJ 3(2):148--156
     sysuse auto, clear
     akdensity length, stdbands(2)
	 
	 
   *-˫���������ܶȺ���ͼ  -kdens2- �ⲿ����
   
     help kdens2
     
	 use grunfeld, clear
     gen linv = log(invest)
     gen lmkt = log(mvalue)
     
	 kdens2 linv lmkt
     kdens2 linv lmkt, n(100)         // defaults Min(_N,50)
     kdens2 linv lmkt, xw(.5) yw(.5)  // defaults `optimal'
  
  
   *-Furthur reading:
   *   Cox, N., 2005, 
   *     Speaking Stata: Density probability plots, 
   *     Stata Journal, 5(2): 259-273.
  
  
  
*----------------------
*-3.4.7 �ۻ��ֲ�����ͼ
      
  help cumul
    
  *-��������	
    sysuse auto, clear
    cumul price, gen(pcum)
    line pcum price, sort
    
	sort price
	list price pcum in 1/5 
	dis 1/74
	dis 3/74
	
	list price pcum in 70/74
	dis 72/74
	dis 73/74
   
  
  *-��Ϊ��������  -displot-  (�ⲿ����)
    
	help distplot
	
	sysuse auto, clear
    distplot scatter mpg
    distplot line mpg, by(foreign)
	distplot connected mpg, trscale(ln(@))

    *-֧�ֵ�ͼ������
	* area bar connected dot dropline line scatter spike

      foreach t in area bar connected dot dropline line scatter spike {
        distplot `t' mpg, by(foreign)
      }

	  
  *-cdfplot- ���� 

    help cdfplot 

	sysuse auto,replace
    cdfplot length, normal
    cdfplot length, by(foreign)
    cdfplot length, by(foreign) norm saving(mygraph, replace) 
   
    *-ʾ��������ת��������
      sysuse nlsw88, clear
	  cdfplot wage, normal
	  gen ln_wage = ln(wage)
	  cdfplot ln_wage, normal

      
   *-Furthur reading:
   *  Cox, N., 2004, 
   *    Speaking stata: Graphing distributions, 
   *    STATA JOURNAL, 4(1): 66-88.                   
   *  Cox, N., 2004, 
   *    Speaking Stata: Graphing categorical and compositional data, 
   *    STATA JOURNAL, 4(1): 190-215.
               
               
                          





	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ������  Stata��ͼ
          *       =====================
          *       -3.4- ����ͼ��ʾ��
		  *                 (II)
		
*--------------------------
*-> 3.4   ����ͼ��ʾ�� (II)
*--------------------------
		  
          *    ==����Ŀ¼==

          *    3.4.8  ����/������ ���ͼ
          *    3.4.9  ����ͼ: ��ʾ������������
          *    3.4.10 ��״ͼ 
          *           3.4.10.1 һά��״ͼ
          *           3.4.10.2 ��ά��״ͼ 
          *    3.4.11 �� ͼ
          *    3.4.12 ����ͼ
          *    3.4.13 ��ͼʾ��
          *    3.4.14 ��άͼ�� 
          *    3.4.15 �� ͼ 	  
		  
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph	
		
		
*--------------------------
*-3.4.8 ����/������ ���ͼ
 
  help twoway lfit
  help twoway qfit
 
  *-��ʾ��
    sysuse auto, clear
    scatter mpg weight || lfit mpg weight
    scatter mpg weight || lfit mpg weight, by(foreign, total row(1))
   
   
  *-������������
    help twoway lfitci
    help twoway qfitci
   
    twoway (lfitci mpg wei, stdf) (scatter mpg wei)  // ������ϵ���������
   
    twoway (scatter mpg wei) (lfitci mpg wei, stdf)  // ͼ��ĸ���
   
    twoway (qfitci mpg wei, stdf) (scatter mpg wei)  // ���������
   
    twoway (qfitci mpg wei, stdf level(99) color(yellow)) ///
           (qfitci mpg wei, stdf level(90))               ///
           (scatter mpg wei)                              // ����ˮ׼



*----------------------------------
*-3.4.9 ����ͼ: ��ʾ������������
  
  help graph matrix
  
  sysuse auto, clear
  graph matrix mpg weight length
  pwcorr mpg weight length
  graph matrix mpg weight length,  ///
         diag("mpg(��������)" . "length (��������)")
  
  *-��������
    graph matrix mpg weight length, scale(1.5)
    graph matrix mpg weight length, scale(0.8)
  
  *-ͼ��
    sysuse citytemp, clear
	sum
    graph matrix heatdd-tempjuly
    gr mat       heatdd-tempjuly, msymbol(point)
    help symbolstyle
     
  *-�����ʾ
    gr mat heatdd-tempjuly, ms(p) half
     
  *-����̶Ⱥͱ�ǩ
    gr mat heatdd-tempjuly, ms(p) half ///
	       maxes(ylab(#4) xlab(#4))

  *-����������
    gr mat heatdd-tempjuly, ms(p) half ///
	       maxes(ylab(#4, grid) xlab(#4, grid))

	

*----------------
*-3.4.10 ��״ͼ 


  *-3.4.10.1 һά��״ͼ  (�μ��ڶ���)
  
  help graph bar
  
  *-�����ʽ1��
  *   graph bar yvars ... 
 
  *-�����ʽ2��
  *   graph bar (mean) varlist, over(g1) over(g2)... [other options]
  
  *-�����÷�: graph bar yvars ...  
    sysuse nlsw88, clear
	graph bar wage, over(race)
  
  
  *-��������趨
  
    sysuse nlsw88, clear
    
    graph bar (mean) wage, over(race) scheme(s1mono) 
 
    graph bar (mean) wage, over(smsa) over(married) over(collgrad) 

    #delimit ;
     graph bar (mean) wage, over(smsa) over(married) over(collgrad)
               title("Average Hourly Wage, 1988, Women Aged 34-46")
               subtitle("by College Graduation, Marital Status,
                          and SMSA residence")
                note("Source:  1988 data from NLS, U.S. Dept. of Labor,
                      Bureau of Labor Statistics");
    #delimit cr

  *-�������ʽ
    help barlook_options
	
    graph bar (mean) wage hours, over(race) over(married) ///
                     scheme(s1mono)      ///
                     bar(1, bstyle(p1))  ///
                     bar(2, bstyle(p6))
           
  *-����ı�ǩ
    help blabel_option
    
    graph bar (mean) wage, over(race) over(married)      ///
           blabel(bar, position(outside) format(%3.1f) color(green))
           
    graph hbar (mean) wage, over(industry) over(married) ///
           blabel(bar, position(outside) format(%3.1f)   ///
                       color(blue) size(vsmall))
  
  *-�ۼ�����
    sysuse educ99gdp, clear
    graph hbar (mean) public private, over(country)
    graph hbar (mean) public private, over(country) stack 
     
    *-����ʾ��
	  generate total = private + public
      #delimit ;
        graph hbar  public private, stack 
          over(country, sort(total) descending)
          blabel(bar, posi(center) color(white) format(%3.1f))
          title( "Spending on tertiary education as % of GDP, 1999",
                  span pos(11))
          subtitle(" ")
          note("Source:  OECD, Education at a Glance 2002", span) ;
      #delimit cr
	  
	*-��һ������
	  generate frac = private/(private + public)
	  #delimit ;
        graph hbar  public private, stack percent
          over(country, sort(frac) descending) 
		  blabel(bar, posi(center) color(white) format(%3.1f))
          title("Public and private spending on tertiary education, 1999",
                 span pos(11) )
          subtitle(" ")
          note("Source: OECD, Education at a Glance 2002", span);
      #delimit cr 
	  
	  
  *-�ص�����
    sysuse nlsw88, clear
    graph bar (mean) hours wage, over(race) over(married) 
    graph bar (mean) hours wage, over(race) over(married) bargap(-30)
   
  *-ͼ�εı���
    sysuse nlsw88, clear
    graph hbar wage, over(ind, sort(1)) over(collgrad)
    graph hbar wage, over(ind, sort(1)) over(collgrad) ///
                     ysize(4) xsize(8)

					 
  *-3.4.10.2 ��ά��״ͼ 		
    
	help twoway bar
	
	sysuse sp500, clear
	
	twoway bar change date in 1/100
	twoway bar change date in 1/100, barwidth(0.6)
	
	
	sysuse pop2000, clear
    replace maletotal = -maletotal
    twoway  bar maletotal agegrp, horizontal ||  ///
            bar  femtotal agegrp, horizontal

   *-һ���ϸ��ӵ�����
    sysuse pop2000, clear
    replace maletotal = -maletotal/1e+6
    replace femtotal = femtotal/1e+6
    gen zero = 0
    #delimit ;
     twoway
         (bar maletotal agegrp, horizontal xvarlab(Males))
         (bar  femtotal agegrp, horizontal xvarlab(Females))
         (scatter  agegrp zero, mlabel(agegrp) mlabcolor(black) msymbol(i))
        , xtitle("Population in millions") ytitle("")
          plotregion(style(none))     
          ysca(noline) ylabel(none)    
          xsca(noline titlegap(-3.5))  
          xlabel(-12 "12" -10 "10" -8 "8" -6 "6" -4 "4" 4(2)12, 
		         tlength(0) grid gmin gmax)
          legend(label(1 Males) label(2 Females)) 
		  legend(order(1 2))
          title("US Male and Female Population by Age, 2000")
          note("Source: U.S. Census Bureau, Census 2000")
	    ;
     #delimit cr

    *-������
	  scatter agegrp zero
	  scatter agegrp zero, mlabel(agegrp) mlabcolor(black) msymbol(i)
  
  

*-------------
*-3.4.11 ��ͼ

   help graph dot  
  
   *-��ʵ������״ͼ����һ�ֱ�ʾ�������Ƚ��ʺ�����Ͷ�壬ʡī��

   sysuse nlsw88, clear
   graph dot wage, over(occ) by(collgrad)
   graph dot wage, over(occ,sort(1)) by(collgrad)
  
  *-һ�����������ʾ��
    sysuse nlsw88, clear
    #delimit ;
    graph dot wage, over(occ, sort(1))
          by(collgrad,
             title("Average hourly wage, 1988, women aged 34-46", span)
             subtitle(" ")
             note("Source:  1988 data from NLS, U.S. Dept. of Labor, 
Bureau of Labor Statistics", span)
            );
    #delimit cr

	

*---------------
*-3.4.12 ����ͼ

   help twoway function
   
   twoway function y=normalden(x), range(-4 4) n(15) 
   
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96)
   
   twoway function y=normalden(x), range(-4 4) xline(-1.96 1.96)
     
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96) horizon

   twoway function y=exp(-x/6)*sin(x), range(0 12.57)  ///
           xlabel(0 3.14 "pi" 6.28 "2 pi" 9.42 "3 pi" 12.57 "4 pi") ///
           yline(0, lstyle(foreground)) dropline(1.48) ///
           plotregion(style(none))                     ///
           xsca(noline) ytitle(" ") xtitle(" ")

   sysuse sp500, clear
   twoway (scatter open close, msize(*.35) mcolor(*.8))  ///
          (function y=x, range(close) yvarlab("y=x") clwidth(*1.5))
 
	 
   *-�ۺ�ʾ��
   
     do A3_function_ci90.do
	 
   *-------------------------A3_function_ci90.do------------------------
     #delimit ;
     twoway 
         function y=normden(x), range(-4 -1.96) color(gs12) recast(area)
      || function y=normden(x), range(1.96 4)   color(gs12) recast(area)
      || function y=normden(x), range(-1.96 -1.64) color(green) recast(area)
      || function y=normden(x), range(1.64 1.96)   color(green) recast(area)
      || function y=normden(x), range(-4 4) lstyle(foreground)
      ||,
         plotregion(style(none))
         legend(off)
         xlabel(-4 "-4 sd" -3 "-3 sd" -2 "-2 sd" -1 "-1 sd" 0 "mean"
                 1  "1 sd"  2  "2 sd"  3  "3 sd"  4  "4 sd"
                , grid gmin gmax)
         xtitle("");
     #delimit cr   
   *--------------------------------------------------------------------
   
   
   
   
*-----------------
*-3.4.13 ��ͼʾ��    -graph combine-

  *-�� 1��
 
   do A3_eg1.do
   
   *--------------------------A3_eg1.do---------------------------
    sysuse lifeexp, clear

    gen loggnp = log10(gnppc)
    label var loggnp "�˾�GNP(Log10)"
    label var lexp   "��������"

    scatter lexp loggnp, ysca(alt titlegap(1.5))   ///
                     xsca(alt titlegap(0.8)) ///
                     xlabel(, grid gmax)     ///
                     ylabel(,angle(0))  ///
                     saving(yx, replace)
    histogram lexp, percent xsca(alt reverse titlegap(0.8)) ///
                horiz xtitle(ռ��) ylabel(,angle(0)) ///
                saving(hy, replace)
    histogram loggnp, percent ysca(alt reverse titlegap(1.5))  ///
                  ytitle(ռ��) ylabel(,nogrid angle(0)) ///
                  xscale(titlegap(2)) xlabel(,grid gmax) ///
                  saving(hx, replace)

    graph combine hy.gph yx.gph hx.gph, ///
           hole(3) imargin(0 0 0 0) ///
           graphregion(margin(l=12 r=12)) ///
           title("ͼ1�������������˾� GNP") ///
           note("������Դ:  ��������С�飬1988")
   *--------------------------------------------------------------
 
 
   *-��һ������
   *--------------------------A3_eg1.do----modify-----------------
    sysuse lifeexp, clear

    gen loggnp = log10(gnppc)
    label var loggnp "�˾�GNP(Log10)"
    label var lexp   "��������"

    scatter lexp loggnp, ysca(alt titlegap(1.5))   ///
                     xsca(alt titlegap(0.8)) ///
                     xlabel(, grid gmax)     ///
                     ylabel(,angle(0))       ///
                     saving(yx, replace)     
    histogram lexp, percent xsca(alt reverse titlegap(0.8)) ///
                horiz xtitle(ռ��) ylabel(,angle(0)) ///
                saving(hy, replace)                  ///
					 fxsize(25)        // new! fy
    histogram loggnp, percent ysca(alt reverse titlegap(1.5))  ///
                  ytitle(ռ��) ylabel(,nogrid angle(0))  ///
                  xscale(titlegap(2)) xlabel(,grid gmax) ///
                  saving(hx, replace)                    ///
					 fysize(25)        // new! fx

    graph combine hy.gph yx.gph hx.gph,      ///
           hole(3) imargin(0 0 0 0)          ///
           graphregion(margin(l=12 r=12))    ///
           title("ͼ1�������������˾� GNP" ) ///
		   subtitle(" ", size(*0.5))         ///  new! a blank line  
           note("������Դ:  ��������С�飬1988")
   *--------------------------------------------------------------   
   *-���ͣ�
   * fxsize(#)  ���� x �᷽����СΪԭʼ�ߴ�� 25%
   * fysize(#)  ���� y �᷽����СΪԭʼ�ߴ�� 25%


  *-�� 2��
    sysuse sp500, clear
	replace volume = volume/1000
    twoway rarea high low date, name(hilo, replace)
	twoway spike volume date, name(vol, replace)
	graph combine hilo vol
	
	*-���� I
	  graph combine hilo vol, cols(1)
	
	*-���� II
	  twoway rarea high low date,   ///
	         xscale(off) name(hilo, replace)  // new! off
	  graph combine hilo vol, cols(1)
	  graph combine hilo vol, cols(1) imargin(b=1 t=1)
	  
	*-���� III
	  twoway spike volume date, name(vol, replace) ///
	         ylabel(5 15 25) fysize(25)           // new! fysize
	  graph combine hilo vol, cols(1) imargin(b=1 t=1)

	  
	  
*-----------------
*-3.4.14 ��άͼ��    -surface- �ⲿ����
	  
    clear
    set obs 900
    gen x = int((_n - mod(_n-1,30) -1 ) /30 )
    gen y = mod(_n-1,30)
    gen z = normalden(x,10,3)*normalden(y,15,5)
    surface x y z



*-----------------
*-3.4.15  �� ͼ 

  *-tmap- ����
  
    *-�ο�����
      
	 *-�鿴��������
	   findit tmap
		
	 *-˵���ĵ��ͷ���
	   *-SJ 4(4):361-378
       view browse http://www.stata.com/support/faqs/graphics/tmap.html 
       shellout tmap.mht             // ������ҳ 
	   shellout tmap2-userguide.pdf  // -tmap- ��˵����
		
	 *-��ظ�������	
       doedit usmaps.do  // module to provide US state map coordinates for tmap
       findit usmaps2    // module to provide US county map coordinates for tmap

   *-����
    
	use Us-Database.dta, clear
    
	tmap choropleth murder, id(id) map(Us-Coordinates.dta)
    
	tmap cho murder if conterminous, id(id) map(Us-Coordinates.dta)
    
	tmap cho murder if conterminous, id(id) ocolor(white) ///
	     map(Us-Coordinates.dta) palette(Blues)           ///
         title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap propsymbol murder if conterminous,               ///
	     x(x_coord) y(y_coord) map(Us48-Coordinates.dta)  ///
         sshape(o) scolor(edkblue) fcolor(eltblue)        ///
		 title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap deviation murder if conterminous,                ///
	     x(x_coord) y(y_coord) map(Us48-Coordinates.dta)  ///
         sshape(s) scolor(sienna) fcolor(eggshell)        ///
		 title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap label label if conterminous,        ///
	     x(x) y(y) map(Us48-Coordinates.dta) ///
		 lc(white) ls(0.9) fc(emerald)

    use MilanoPolice-Database.dta, clear
    tmap dot, x(x) y(y) map(MilanoOutline-Coordinates.dta) ///
	     by(type) marker(both) sshape(s d)                 ///
		 title("Location of police stations")              ///
		 subtitle("Milano 2004") legtitle("Police force",  ///
         size(*0.7)) legbox(lc(black))

 
  *-spmap- ����
    
	*-ʹ��˵����

      view browse http://www.stata.com/support/faqs/graphics/spmap.html 

      shellout spmap_intro.mht 
	  
	  help spmap

      use "Italy-RegionsData.dta", clear
      spmap relig1 using "Italy-RegionsCoordinates.dta", id(id)  ///
        clnumber(20) fc(Greens2) oc(white ..) osize(medthin ..)  ///
        title("Pct. Catholics without reservations", size(*0.8)) ///
        subtitle("Italy, 1994-98" " ", size(*0.8))               ///
        legstyle(3) legend(ring(1) position(3))                  ///
        plotregion(icolor(stone)) graphregion(icolor(stone))
  
      use "Italy-RegionsData.dta", clear
      spmap relig1 using "Italy-RegionsCoordinates.dta", id(id)  ///
        clmethod(stdev) clnumber(5)                              ///
        title("Pct. Catholics without reservations",size(*0.8))  ///
        subtitle("Italy, 1994-98" " ", size(*0.8)) area(pop98)   ///
        note(" "                                                 ///
        "NOTE: Region size proportional to population", size(*0.75))

 
  *-�й���ͼ
  
    findit china map
  
    use china_label,clear
    tab name
    replace name = subinstr(name, "ʡ", "", .)
    replace name = subinstr(name, "��", "", .)
    replace name = subinstr(name, "����������", "", .)
    replace name = subinstr(name, "׳��������", "", .)
    replace name = subinstr(name, "�ر�������", "", .)
    replace name = subinstr(name, "������", "", .)
    replace name = subinstr(name, "ά���", "", .)
    tab name
    gen x = uniform()
    format x %9.3g
  
    spmap x using "china_map.dta", id(id)                  /// 
      label(label(name)                                    ///
        xcoord(x_coord) ycoord(y_coord) size(*.9))         ///
	  plotregion(icolor(stone)) graphregion(icolor(stone)) ///
      clnumber(8) fc(Greens2) oc(white ..) osize(medthin ..) 
  
  
  *-��������
  
    findit spgrid
    doedit spgrid_example.do  // ������ͼ����

	
	

*------------
*-3.5  ����

  *-ѧ����������£�
  
  *-һ�����õ���
    
	* Mitchell, M. 
	*   A visual guide to Stata graphics. 
	*   Stata Press, 2008.
	
	view browse   ///
	     "http://www.stata.com/support/faqs/graphics/gph/statagraphs.html"



*-��ϰ��һ����δ�㶨��ԲȦ

    twoway ( function y = sqrt(1-x^2),        ///
	         plotregion(margin(0))            ///
			 range(-1.5 1.5) lc(blue) )       ///
           ( function y = -sqrt(1-x^2),       ///
		     plotregion(margin(0))            ///
			 range(-1.5 1.5) lc(blue) )       ///
		  ,                                   ///
             ysize(2) xsize(2)                ///
			 ylabel(-1.5 1.5) xlabel(-1.5 1.5)

   *-���� 1��
     twoway ( function y = sqrt(1-(x-1)^2),   ///
	          plotregion(margin(0))           ///
			  range(-0 2) lc(blue) )          ///
            ( function y =-sqrt(1-(x-1)^2),   ///
			  plotregion(margin(0))           ///
			  range(0 2) lc(blue))            ///
		  ,                                   ///
              ysize(3) xsize(3)               ///
			  ylabel(-1.5 1.5) xlabel(-1 2)

   *-���� 2��
     clear
     set obs 100000 
     gen z = invnorm(uniform())
     gen y = sin(z)
     gen x = cos(z)
     twoway (scatter y x), ysize(4) xsize(4)  
     twoway (scatter y x, msymbol(smcircle)), ysize(4) xsize(4)   



*-----------------------------OVER------------------------------------------
