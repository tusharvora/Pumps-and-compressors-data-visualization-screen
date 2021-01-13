import processing.io.*;
float height = 900;
float width = 1700;
color screenBackground= #2F2933;
color siragaColor=#F8CA4D;
color dataColour=#C1FDFF;
int day = day();
int month = month();
int year = year();
   
float intBoxDist = 0.015*width;
int jao=19;int jaam=26;int jbo=13;int jbam=06;int dv1o=05;int dv1am=16;int dv2o=20;int dv2am=21;
String fileAddress_jpa = "/home/pi/Desktop/JOCKEY&DV/JOCKEY_PUMP_A/JPA"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+nf(hour(),2,0)+ "_" + "JPA" + ".txt";
String fileAddress_jpb = "/home/pi/Desktop/JOCKEY&DV/JOCKEY_PUMP_B/JPB"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "JPB" + ".txt";
String fileAddress_dv1 = "/home/pi/Desktop/JOCKEY&DV/DV_AC_1/DVAC1"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "DV1" + ".txt";
String fileAddress_dv2 = "/home/pi/Desktop/JOCKEY&DV/DV_AC_2/DVAC2"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "DV2" + ".txt";
String[] dataDumpStr_jpa;String[] dataDumpStr_jpb;String[] dataDumpStr_dv1;String[] dataDumpStr_dv2;
int count_jpa;int count_jpb;int count_dv1;int count_dv2;
int lastButtonState_jpao = 1;    int lastButtonState_jpbo = 1;    int lastButtonState_dv1o = 1;    int lastButtonState_dv2o = 1;
int ButtonState_jpao =0;    int ButtonState_jpbo=0 ;    int ButtonState_dv1o=0 ;    int ButtonState_dv2o=0 ;
long runtime_jpao=0;long runtime_jpbo=0;long runtime_dv1o=0;long runtime_dv2o=0;
  
int ho=0;
int mo=0;
int so=0; 

long buttonOn=0;
long buttonOff;
int sf;  // Values from 0 - 59
int mf ;  // Values from 0 - 59
int hf ; 
void setup()
{
  size(1700,900);
   //JOCKEY PUMP A
 File f1 = new File(fileAddress_jpa);
  File f2 = new File(fileAddress_jpb);
   File f3 = new File(fileAddress_dv1);
      File f4 = new File(fileAddress_dv2);
  


  GPIO.pinMode(jao,GPIO.INPUT); GPIO.pinMode(jaam,GPIO.INPUT); GPIO.pinMode(jbo,GPIO.INPUT); GPIO.pinMode(jbam,GPIO.INPUT); GPIO.pinMode(dv1o,GPIO.INPUT); GPIO.pinMode(dv1am,GPIO.INPUT); GPIO.pinMode(dv2o,GPIO.INPUT); GPIO.pinMode(dv2am,GPIO.INPUT);
  

 // dataDumpStr_jpa[0] = ("Counter"+ "\t"+"\t"+"Start" +"\t" + "\t"+"End" +"\t" +"\t"+ "Difference(sec)"+"\t" +"\t"+"Cumulative time(sec)"+"\t" +"\t"+"\t" +"\t"+ "JPA");
 //saveStrings(fileAddress_jpa, dataDumpStr_jpa);
  if (f1.exists() )
 { println("File f1 exits");
  String[]jpadat =file(fileAddress_jpa,"JOCKEY PUMP A");
  //print(jpadat.length);
 // if(dataDumpStr_
String [] dataDumpStr_jpa1 = shorten(jpadat);
 dataDumpStr_jpa=shorten(dataDumpStr_jpa1);

  count_jpa=int(jpadat[jpadat.length-1]);
    if (jpadat.length>1){ runtime_jpao=int(jpadat[jpadat.length-2]);}
  
  //print("count is:",count_jpa);
   //print("cumulative is:",runtime_jpao);
 }

 //JOOCKEY PUMP B

  if (f2.exists() )
 { 
  String[]jpbdat =file(fileAddress_jpb,"JOCKEY PUMP B");
 //print(jpbdat.length);
String [] dataDumpStr_jpb1  = shorten(jpbdat);
dataDumpStr_jpb=shorten(dataDumpStr_jpb1);
  count_jpb=int(jpbdat[jpbdat.length-1]);
  if (jpbdat.length>1){runtime_jpbo=int(jpbdat[jpbdat.length-2]);}
 // print("count is:",count_jpb);
 }
 //DV AIR COMPRESSOR 1
  
  if (f3.exists() )
  {
 //{ println("File f3 exits");
  String[]dv1dat =file(fileAddress_dv1,"DV AIR COMPRESSOR 1");
  //print(jpadat.length);
 String[] dataDumpStr_dv1a = shorten(dv1dat);
 
dataDumpStr_dv1 = shorten(dataDumpStr_dv1a);

  count_dv1=int(dv1dat[dv1dat.length-1]);
   if (dv1dat.length>1){runtime_dv1o=int(dv1dat[dv1dat.length-2]);}
  //print("count is:",count_dv1);
 }
 ///DV AIR COMPRESSOR 2

  if (f4.exists() )
 { 
  String[]dv2dat =file(fileAddress_dv2,"DV AIR COMPRESSOR 2");
  //print(jpadat.length);
  String[] dataDumpStr_dv2a = shorten(dv2dat);
  dataDumpStr_dv2 = shorten(dataDumpStr_dv2a);
  count_dv2=int(dv2dat[dv2dat.length-1]);
  if (dv2dat.length>1){runtime_dv2o=int(dv2dat[dv2dat.length-2]);}
  
  //print("count is:",count_dv2);
 }
}

void draw()
{  
  int read_jpao = GPIO.digitalRead(jao); //print(read_jpao );
  int read_jpaam = GPIO.digitalRead(jaam);
  int read_jpbo = GPIO.digitalRead(jbo);
  int read_jpbam = GPIO.digitalRead(jbam);
  int read_dv1o = GPIO.digitalRead(dv1o);
  int read_dv1am = GPIO.digitalRead(dv1am);//print(read_dv1am);
  int read_dv2o = GPIO.digitalRead(dv2o);
  int read_dv2am = GPIO.digitalRead(dv2am);//print(read_dv1am);
  

 // long lastDebounceTime_jpao = 0; long lastDebounceTime_jpbo = 0; long lastDebounceTime_dv1o = 0; long lastDebounceTime_dv2o = 0; 
  
   drawMain();
   
   
    ///DV AIR COMPRESSOR 1
    if ( read_dv1o != lastButtonState_dv1o) 
 { 
    String[]dv1data = inputs(read_dv1o,dataDumpStr_dv1,fileAddress_dv1,count_dv1,runtime_dv1o);
    
   String[]dataDumpStr_dv11 = shorten(dv1data);
    String[]dataDumpStr_dv1a = shorten(dataDumpStr_dv11);

         dataDumpStr_dv1=shorten(dataDumpStr_dv1a);
         runtime_dv1o=int(dv1data[(dv1data.length)-3]);
         lastButtonState_dv1o=int(dv1data[(dv1data.length)-2]);
         count_dv1=int(dv1data[dv1data.length-1]);
 }
  ///DV AIR COMPRESSOR B
    if ( read_dv2o != lastButtonState_dv2o) 
 { 
   //println("length of string",dataDumpStr_dv2.length);
    String[]dv2data = inputs(read_dv2o,dataDumpStr_dv2,fileAddress_dv2,count_dv2,runtime_dv2o);
    
    String[]dataDumpStr_dv21 = shorten(dv2data);
    String[]dataDumpStr_dv2a = shorten(dataDumpStr_dv21);
  
             dataDumpStr_dv2=shorten(dataDumpStr_dv2a);
             runtime_dv2o=int(dv2data[(dv2data.length)-3]);
             lastButtonState_dv2o=int(dv2data[(dv2data.length)-2]);
             count_dv2=int(dv2data[dv2data.length-1]);
     
 }
   /// JOCKEY PUMP A 
   if (read_jpao != lastButtonState_jpao) 
 { 
   // if (dataDumpStr_jpa.length>0){print("null nathiche \\\\\\\\\\\\\\\\\\\\\\\\");}
    String[]jpadata = inputs(read_jpao,dataDumpStr_jpa,fileAddress_jpa,count_jpa,runtime_jpao);
   
   String[]dataDumpStr_jpa1 = shorten(jpadata);
   String[]dataDumpStr_jpa2 = shorten(dataDumpStr_jpa1);
  
     dataDumpStr_jpa=shorten(dataDumpStr_jpa2);
     runtime_jpao=int(jpadata[(jpadata.length)-3]);
     lastButtonState_jpao=int(jpadata[(jpadata.length)-2]);
     count_jpa=int(jpadata[jpadata.length-1]);
}
 ///JOCKEY PUMP B
    if ( read_jpbo != lastButtonState_jpbo) 
 {
   String[]jpbdata = inputs(read_jpbo,dataDumpStr_jpb,fileAddress_jpb,count_jpb,runtime_jpbo);
    
  String[]dataDumpStr_jpb1 = shorten(jpbdata);
  String[]dataDumpStr_jpb2 = shorten(dataDumpStr_jpb1);
  
  dataDumpStr_jpb=shorten(dataDumpStr_jpb2);
       runtime_jpbo=int(jpbdata[(jpbdata.length)-3]);
       lastButtonState_jpbo=int(jpbdata[(jpbdata.length)-2]);
       count_jpb=int(jpbdata[jpbdata.length-1]);
     
 }


   big_box("JOCKEY PUMP A",1,lastButtonState_jpao,count_jpa,runtime_jpao,read_jpaam);
   big_box("JOCKEY PUMP B",2,lastButtonState_jpbo,count_jpb,runtime_jpbo,read_jpbam);
   big_box("DV AIR COMPRESSOR 1",3,lastButtonState_dv1o,count_dv1,runtime_dv1o,read_dv1am);
   big_box("DV AIR COMPRESSOR 2",4,lastButtonState_dv2o,count_dv2,runtime_dv2o,read_dv2am);
   
}
