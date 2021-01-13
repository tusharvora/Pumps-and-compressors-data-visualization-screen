String[] inputs(int reading,String[]dataDumpStr,String fileAddress,int count,long runtime)
 {
  
long s1=runtime;
String data;
  
      if (reading == GPIO.LOW) 
  
  { 
    println();
    count=count+1;
    print (count);
    println();
   
    ho= hour();
    mo=minute();
    so= second();
    buttonOn=ho*3600+mo*60+so;
   
   } 
  else 
  
  {
    // fillCol = 15; 
    hf= hour();
    mf= minute();
    sf= second();
    buttonOff=hf*3600+mf*60+sf;
    long s=buttonOff-buttonOn;
   
  if (count==0 && (reading==1)){ s1=0;}
    
        else 
        {
          s1=s1+s; 
   
        data = (count + "\t" + "\t" + ho + ":" + mo+ ":" + so + "\t" +"\t" + hf + ":" + mf + ":" + sf + "\t"+"\t" + s  +"\t" +"\t"+"\t"+"#" +s1);
           print (data);
         
       
              dataDumpStr=append(dataDumpStr,data); 
           //print(dataDumpStr[0]);
            }
  
          
                            
   }
 
saveStrings(fileAddress, dataDumpStr);
  // save the reading. Next time through the loop, it'll be the lastButtonState:
  int lastButtonState = reading;
  String lb=String.valueOf(lastButtonState);//integer to string
  String c=String.valueOf(count);
  String cu=String.valueOf(s1);
  dataDumpStr=append(dataDumpStr,cu);
  dataDumpStr=append(dataDumpStr,lb);
  dataDumpStr=append(dataDumpStr,c);
   
  return (dataDumpStr);
  
}
