 void drawMain()
{  
  float hts=width*0.03;
  float hx=width*0.5;
  float hy=0.06*height;
  int h= hour();
    int m=minute();
    int s= second();
  background(screenBackground);
  
  PFont myFont;
  myFont = createFont ("CordiaUPC Bold",100);
  textFont(myFont);
    
    fill(siragaColor);
    textSize(hts);
    textAlign(CENTER,CENTER);
   // text("DV AIR COMPRESSOR / JOCKEY PUMP" + "  " + nf(day,2) + "." + nf(month,2) + "." +nf(year,4)+"/"+h+":"+m+":"+s, hx ,hy );
    text("DV AIR COMPRESSOR / JOCKEY PUMP" ,hx,hy);
    fill(#FF9E00);
    textSize(hts/2);
    textAlign(CENTER,CENTER);
    text( nf(day,2) + "." + nf(month,2) + "." +nf(year,4)+"  "+h+":"+m+":"+s, hx*1.8 ,hy );
} 
