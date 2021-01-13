String[] file(String fileAddress,String name)
{
      // String a[];
         int dataDumpLen ;
         int count=0;
         String cum;
  
       //println("exist");
               
          String[] dataDumpStr = loadStrings(fileAddress);
            dataDumpLen = dataDumpStr.length;
           
             println("there are " + dataDumpLen + " lines");
               
                if (dataDumpLen >0)
                {   
                  dataDumpStr[0] = ("Counter"+ "\t"+"\t"+"Start" +"\t" + "\t"+"End" +"\t" +"\t"+ "Difference(sec)"+"\t" +"\t"+"Cumulative time(sec)"+"\t" +"\t"+"\t" +"\t"+ name);
                  saveStrings(fileAddress, dataDumpStr);
                            count = dataDumpLen-1;
                            println("Latest count:",count);
                           String b=dataDumpStr[dataDumpStr.length-1];
                           // println("cumulative",b);
                            String[] par=b.split("#");
                            cum=par[(par.length-1)];
                            print("The latest cumulative:",cum);
                            //saveStrings(fileAddress, dataDumpStr);
                }
              
                       else
                       { 
                         count=0;
                         cum="0";
                        
                       String dataDumpfirst = ("Counter"+ "\t"+"\t"+"Start" +"\t" + "\t"+"End" +"\t" +"\t"+ "Difference(sec)"+"\t" +"\t"+"Cumulative time(sec)"+"\t" +"\t"+"\t" +"\t"+ name);
                       dataDumpStr=append(dataDumpStr,dataDumpfirst);
                       //String dataDumpsecond = (0+ "\t"+"\t"+0 +"\t" +"\t"+ 0 +"\t" +"\t"+ 0 +"\t" +"\t"+"#"+0);
                       //dataDumpStr=append(dataDumpStr,dataDumpsecond);
                       saveStrings(fileAddress, dataDumpStr);
                       }

  String c=String.valueOf(count);
  dataDumpStr=append(dataDumpStr,cum);
  dataDumpStr=append(dataDumpStr,c);
// for(int i=0;i<dataDumpStr.length;i++)
//  { print(dataDumpStr[i] ) ; 
//println();}     
return dataDumpStr;
}
