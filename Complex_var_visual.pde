import controlP5.*;
ControlP5 controller;
ControllerGroup controllergroup;
Textfield xInput;
Textfield yInput;
boolean doColor;
boolean doGridlines;
PImage imgOn;
PImage imgOff;
PImage radioOn;
PImage radioOff;
float xmin = -10;
float xmax = 10;
float ymin = -10;
float ymax = 10;
float xFactor=600/(xmax-xmin);
float yFactor=600/(ymax-ymin);
boolean draw=false;
float drawX;
float drawY;
int delaycount = 0;
int selectedFunction = 0;
String customFunctionDescription = "";
grid Grid = new grid((float) 5,(float) 5,15,15);
operator o = new operator();
void setup() {
  settings();
  String[] args = {"TwoFrameTest"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
  controller = new ControlP5(this);
  xInput = new Textfield(controller, "Input number of vertical gridlines");
  xInput=xInput.setVisible(true);
  xInput=xInput.setColorCaptionLabel(255);
  yInput = new Textfield(controller, "Input number of horizontal gridlines");
  yInput=yInput.setVisible(true);
  yInput=yInput.setColorCaptionLabel(255);
  xInput=xInput.setPosition(10000, 10000);
  yInput=yInput.setPosition(10000, 10000);
  doColor=false;
  doGridlines = false;
  imgOff = loadImage("checkbox_no.png");
  imgOn = loadImage("checkbox_yes.png");
  radioOn = loadImage("radioOn.png");
  radioOff = loadImage("radioOff.png");
  xInput.setInputFilter(ControlP5.INTEGER);
  yInput.setInputFilter(ControlP5.INTEGER);
  colorMode(HSB,1,1,1);
}
public void settings(){
  size(600,600);
}
void draw() {
  colorMode(RGB,255,255,255);
  background(255);
  fill(0);
  textSize(15);
  text("Color Grid", 32,28);
  text("Show Gridlines", 147,28);
 if(doColor){
    image(imgOn, 15,15, 15, 15);
    
  } else{
    image(imgOff, 15,15,15,15);
    
  }
  if(doGridlines){
    image(imgOn,130,15,15,15);
  } else {
    image(imgOff,130,15,15,15);
  }
 text("Select Function",8,68);
 text("Custom Function | "+customFunctionDescription ,25,98-9);
 text("f(z) = z",25,98+13);
 text("f(z) = z^2",25,120+13);
 text("f(z) = z^3",25,142+13);
 text("f(z) = e^z",25,164+13);
 text("f(z) = ln(z)",25,186+13);
 text("f(z) = 1/z",25,208+13);
 text("f(z) = sin(z)",25,230+13);
 text("f(z) = cos(z)",25,252+13);
 if(selectedFunction==-1){
   image(radioOn, 8, 98-22,15,15);
 }else{
   image(radioOff,8,98-22,15,15);
 }
 if(selectedFunction==0){
   image(radioOn, 8, 98,15,15);
 }else{
   image(radioOff,8,98,15,15);
 }
  if(selectedFunction==1){
   image(radioOn, 8, 120,15,15);
 }else{
   image(radioOff,8,120,15,15);
 }
  if(selectedFunction==2){
   image(radioOn, 8, 142,15,15);
 }else{
   image(radioOff,8,142,15,15);
 }
  if(selectedFunction==3){
   image(radioOn, 8, 164,15,15);
 }else{
   image(radioOff,8,164,15,15);
 }
  if(selectedFunction==4){
   image(radioOn, 8, 186,15,15);
 }else{
   image(radioOff,8,186,15,15);
 }
  if(selectedFunction==5){
   image(radioOn, 8, 208,15,15);
 }else{
   image(radioOff,8,208,15,15);
 }
   if(selectedFunction==6){
   image(radioOn, 8, 230,15,15);
 }else{
   image(radioOff,8,230,15,15);
 }
   if(selectedFunction==7){
   image(radioOn, 8, 252,15,15);
 }else{
   image(radioOff,8,252,15,15);
 }
  if(delaycount>=0)delaycount--;

  pushMatrix();
  scale(1,-1);
  translate(0,-600);
  scale(xFactor,yFactor);
  translate(-xmin,-ymin);
  
  colorMode(HSB,1,1,1);
  stroke(0);
  strokeWeight(2/yFactor);
  line(xmin,0,xmax,0);
  strokeWeight(2/xFactor);
  line(0,ymin,0,ymax);
  if(doGridlines){
      strokeWeight(0);
    for(int x = (int)xmin;x<xmax;x++){
      line(x,ymin,x,ymax);
    }
    for(int y = (int)ymin;y<ymax;y++){
      line(xmin,y,xmax,y);
    }
  }
  
  
  float newMX=mouseX;
  float newMY=-1.0*mouseY;
  newMY+=600;
  newMX/=xFactor;
  newMY/=yFactor;
  newMX+=xmin;
  newMY+=ymin;
  
  
  if(mousePressed){
    if (mouseButton==LEFT){
      if(xInput.isInside() || yInput.isInside()){
      
      } else {
         if(mouseX>15 && mouseX<30 && mouseY<30 && mouseY>15){
          if (delaycount<0){
            doColor = !doColor;
            delaycount = 15;
          }
        } else {
        if(mouseX>8 && mouseX<8+15 && mouseY<98-22+15 && mouseY>98-22){
          if (delaycount<0){
            selectedFunction = -1;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<98+15 && mouseY>98){
          if (delaycount<0){
            selectedFunction = 0;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<120+15 && mouseY>120){
          if (delaycount<0){
            selectedFunction = 1;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<142+15 && mouseY>142){
          if (delaycount<0){
            selectedFunction = 2;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<164+15 && mouseY>164){
          if (delaycount<0){
            selectedFunction = 3;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<186+15 && mouseY>186){
          if (delaycount<0){
            selectedFunction = 4;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<208+15 && mouseY>208){
          if (delaycount<0){
            selectedFunction = 5;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<230+15 && mouseY>230){
          if (delaycount<0){
            selectedFunction = 6;
            delaycount = 15;
          }
        }
        if(mouseX>8 && mouseX<8+15 && mouseY<252+15 && mouseY>252){
          if (delaycount<0){
            selectedFunction = 7;
            delaycount = 15;
          }
        }
        if(mouseX>130 && mouseX<130+15 && mouseY<30 &&mouseY>15){
          if (delaycount<0){
            doGridlines = !doGridlines;
            delaycount = 15;
          }
        }
          if(delaycount<0){
            noCursor();
            Grid.centerX=newMX;
            Grid.centerY=newMY;
            xInput.setVisible(false);
            xInput.setLabelVisible(false);
            yInput.setVisible(false);
            yInput.setLabelVisible(false);
            if (!xInput.getText().equals("")){
              Grid.ylines = Integer.parseInt(xInput.getText());
              xInput.setText("");
            }
            if (!yInput.getText().equals("")){
              Grid.xlines = Integer.parseInt(yInput.getText());
              yInput.setText("");
            }
           } 
         }
       }
    } else {
      if (mouseButton==RIGHT){
        xInput=xInput.setVisible(true);
        xInput.setLabelVisible(true);
        yInput=yInput.setVisible(true);
        yInput.setLabelVisible(true);
        float xCoord=xFactor*(Grid.centerX-xmin);
        float yxCoord=-1.0*(yFactor*((Grid.centerY+0.5*Grid.Height)-ymin)-600)-35;
        float yyCoord=-1.0*(yFactor*((Grid.centerY-0.5*Grid.Height)-ymin)-600)+5;
        xInput=xInput.setPosition(xCoord, yxCoord);
        yInput=yInput.setPosition(xCoord, yyCoord);
      }
    }
  }else{
    cursor(ARROW);
  }
  Grid.drawgrid();
  popMatrix();
}     

public class SecondApplet extends PApplet {

  public void settings() {
    size(600, 600);
  }
  public void draw() {
    pushMatrix();
    
    scale(1,-1);
  translate(0,-600);
  scale(xFactor,yFactor);
  translate(-xmin,-ymin);
    colorMode(RGB,255,255,255);
    background(255);
    fill(0);
    colorMode(HSB,1,1,1);
    stroke(0);
  strokeWeight(2/yFactor);
  line(xmin,0,xmax,0);
  strokeWeight(2/xFactor);
  line(0,ymin,0,ymax);
  if(doGridlines){
      strokeWeight(0);
    for(int x = (int)xmin;x<xmax;x++){
      line(x,ymin,x,ymax);
    }
    for(int y = (int)ymin;y<ymax;y++){
      line(xmin,y,xmax,y);
    }
  }
  cnumber [] [] original=Grid.getCnumbers().clone();
  cnumber[][] alteredarr=original.clone();
  
  for (int r=0;r<alteredarr.length;r++){
    for (int c=0;c<alteredarr[0].length;c++){
      
      //Custom Function here
      customFunctionDescription = "f(z) = tan(z)";
      if (selectedFunction == -1){     //f(z) = z^0.5
        alteredarr[r][c]= o.divide(o.sine(alteredarr[r][c]),o.cosine(alteredarr[r][c]));
      }
      if (selectedFunction == 0){     //f(z)=z
        //do nothing
      }
      if (selectedFunction == 1){     //f(z)=z^2
        alteredarr[r][c]=o.squared(alteredarr[r][c]);
      }
      if (selectedFunction == 2){     //f(z)=z^3
        alteredarr[r][c]=o.cubed(alteredarr[r][c]);
      }
      if (selectedFunction == 3){     //f(z)=e^z
        alteredarr[r][c]=o.exp(alteredarr[r][c]);
      }
      if (selectedFunction == 4){     //f(z)=ln(z)
        alteredarr[r][c]=o.ln(alteredarr[r][c]);
      }
      if (selectedFunction == 5){     //f(z)=1/z
        alteredarr[r][c]=o.divide(new cnumber(1,0), alteredarr[r][c]);
      }
      if (selectedFunction == 6){     //f(z)=sin(z)
        alteredarr[r][c]=o.sine(alteredarr[r][c]);
      }
      if (selectedFunction == 7){     //f(z)=sin(z)
        alteredarr[r][c]=o.cosine(alteredarr[r][c]);
      }
      alteredarr[r][c].hue = (float) (r+c)/(Grid.xlines+Grid.ylines);
    }
  }
  for (int c = 0;c<alteredarr[0].length;c++){
      for (int r = 1;r<alteredarr.length;r++){
        if(doColor){
          stroke(alteredarr[r-1][c].hue,1,1);
        }
        strokeWeight(1/yFactor);
        line(alteredarr[r-1][c].x,alteredarr[r-1][c].y,alteredarr[r][c].x,alteredarr[r][c].y);
      }
    }
    for (int r=0;r<alteredarr.length;r++){
      for (int c=1;c<alteredarr[0].length;c++){
        if(doColor){
          stroke(alteredarr[r][c-1].hue,1,1);
        }
        strokeWeight(1/xFactor);
        line(alteredarr[r][c-1].x,alteredarr[r][c-1].y,alteredarr[r][c].x,alteredarr[r][c].y);
      }
    }
  popMatrix();
  }
}

//Custom function library
//f(z) = sin(z)^2+cos(z)^2
//alteredarr[r][c]=o.add(o.power(o.sine(alteredarr[r][c]),new cnumber(2,0)), o.power(o.cosine(alteredarr[r][c]),new cnumber(2,0)));
//
//f(z) = tan(z)
//alteredarr[r][c]= o.divide(o.sine(alteredarr[r][c]),o.cosine(alteredarr[r][c]));
//
//f(z) = z^z
//alteredarr[r][c]= o.power(alteredarr[r][c],alteredarr[r][c]);
//
//f(z) = z^0.5
//alteredarr[r][c]= o.power(alteredarr[r][c],new cnumber(0.5,0));
