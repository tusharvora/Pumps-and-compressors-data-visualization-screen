void big_box(String heading,int boxCount,int onOff,int counter,long runTime,int autoManual)
{ 
  int noOfRow = 2;
  int noOfCol = 2;
  
  int rowPosition = ((boxCount-1)/noOfCol)+1;
  int colPosition = ((boxCount-1) % noOfCol)+1;
  
  float yClearance = 0.15*height; // clearance height before the first big box is drawn
  float xLen = (width-((noOfCol+1)*intBoxDist))/noOfCol;// length of each big console box
  float yLen = (height-(((noOfCol)*intBoxDist)+yClearance))/noOfCol;    // height of each big console box
  
  float x = intBoxDist+(colPosition-1)*(intBoxDist+xLen);              //  X COORDINATE OF UPPER LEFT CORNER OF EACH CONSOLE BOX 
  float y = yClearance+(rowPosition-1)*(intBoxDist+yLen);             //  Y COORDINATE OF UPPER LEFT CORNER OF EACH CONSOLE BOX
  float r = 0.001*width;
  float hts= xLen*0.05;                                         // HEIGHT OF HEADING
  float hx=xLen*0.5;                                             // X COORDINATE OF HEADING
  float hy=0.08*yLen;             // Y COORDINATE OF HEADING
   float xCle=xLen*0.02;            // CLEARANCE OF BETWEEN CIRCLES
  float dia=(xLen-(5*xCle))/4;                      // DIAMETER OF CIRCLE
  float x1=xCle+dia/2;
  float x2=x1+xCle+dia;
  float x3=x2+xCle+dia;
  float x4=x3+xCle+dia;
  float y1=yLen *0.5;
  float y2=yLen*0.9;
color onoff;
String o;
int A_M;
String a_m;

//MOVING TO NEW COORDINATES SYSTEM I.E BIG BOX
  pushMatrix();                                              
  translate(x,y);
  
    rectMode(CORNER);
    strokeWeight(xLen*0.004); stroke(#C1FDFF);
    fill(10);  // Set fill to gray
    rect(0, 0, xLen, yLen,r);                               //BOX CREATION
    
    PFont myFont;
    myFont = createFont ("CordiaUPC Bold",100); 
   textFont(myFont);
    
    fill(#FFFFA6);
    textSize(hts);                                    
    textAlign(CENTER,CENTER);
    text(heading, hx ,hy );                           // BOX HEADING CREATION
     //------------------------------------------------------------
    // DRAWING CIRCLES
    //------------------------------------------------------------
    if (onOff==0)
    {  onoff=color(255,0,0);
       o="ON";}
    else {  
      onoff = color (0,255,0);
      o="OFF"; }
    
    strokeWeight(xLen*0.004); stroke(#24EBFF);
    fill(onoff);  // Set fill to gray
    ellipse(x1, y1, dia, dia); 
    rectMode(CENTER);
    strokeWeight(xLen*0.004); stroke(#C1FDFF);
    fill(10);  // Set fill to gray
    rect(x1, y2, dia, dia/4,r/4);  
    fill(siragaColor);
    textSize(dia/4*0.7);                                    
    textAlign(CENTER,CENTER);
    text(o,x1 ,yLen*0.9); 
    
    
    
     if (autoManual==0)
    { A_M=color(255,0,0);
       a_m="AUTO";}
    else{  A_M=color (0,255,0);
          a_m="MANUAL"; }
    
    strokeWeight(xLen*0.004); stroke(#24EBFF);
    fill(A_M);  // Set fill to gray
    ellipse(x2, y1, dia, dia); 
    rectMode(CENTER);
     strokeWeight(xLen*0.004); stroke(#C1FDFF);
    fill(10);  // Set fill to gray
    rect(x2, y2, dia, dia/4,r/4);   
         fill(siragaColor);
    textSize(dia/4*0.7);                                    
    textAlign(CENTER,CENTER);
    text(a_m,x2 ,yLen*0.9 ); 
    
    
    strokeWeight(xLen*0.004); stroke(#C1FDFF);
    fill(10);  // Set fill to gray
    ellipse(x3, y1, dia, dia); 
    rectMode(CENTER);
     strokeWeight(xLen*0.004); stroke(#24EBFF);
    fill(10);  // Set fill to gray
    rect(x3, y2, dia, dia/4,r/4); 
    fill(siragaColor);
    textSize(dia/4*0.7);                                    
    textAlign(CENTER,CENTER);
    text("COUNTER",x3 ,yLen*0.9); 
     fill(dataColour);
    textSize(dia/4*0.9);                                    
    textAlign(CENTER,CENTER);
    text(counter,x3 ,y1);
    
    
    strokeWeight(xLen*0.004); stroke(#24EBFF);
    fill(10);  // Set fill to gray
    ellipse(x4, y1, dia, dia); 
    rectMode(CENTER);
     strokeWeight(xLen*0.004); stroke(#C1FDFF);
    fill(10);  // Set fill to gray
    rect(x4, y2, dia, dia/4,r/4);  
    fill(siragaColor);
    textSize(dia/4*0.7);                                    
    textAlign(CENTER,CENTER);
    text("RUN TIME",x4,yLen*0.9);
     fill(dataColour);
    textSize(dia/4*0.8);                                    
    textAlign(CENTER,CENTER);//(runTime)/60.0
    text((runTime)/60.0,x4 ,y1);
    fill(#FF4A08);
     textSize(dia/4*0.7);   
    textAlign(CENTER,CENTER);
    text("MIN",x4 ,y1+(0.3*y1));
    popMatrix();
 }
