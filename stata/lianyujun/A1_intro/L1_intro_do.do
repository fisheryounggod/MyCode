

cd D:\stata11\ado\personal\Net_course_A\A1_intro

*- ��ʼʹ��log�ļ�        // -> ���ǵ�һ��ע�ͷ���
  cap log close
  log using L1_intro_do.log, replace

  sysuse auto, clear      // -> Note1: ��������

  sum                     // ����ͳ����

  d,d
  
  #delimit ;              // -> ע��˴��Ķ��з���
     grss twoway (scatter price wei)
            (lfit price wei),
            title("ɢ��ͼ���������ͼ");
  #delimit cr

  log close           
  exit
 
 
*- ˵����
   ����ļ�����˵��stata��do�ĵ���log�ļ���ʹ�÷����� 
