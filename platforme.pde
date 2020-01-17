import processing.serial.*;
Serial myPort;  // Create object from Serial class
String message ;
String vitesse1 = " " ,vitesse_aff ="" , frequence1 = "",frequence_aff ="", frequence2 = "",vitesse2 = " ";
String[] string_array ;
char  back ;
PImage img;

PImage img1;
PImage img2;
PImage img3;
int x = 100 , y = 100 ,  z = 100 , t = 100 ,scene =1 , a=0 , b =0 , c= 0;
public void setup(){
  size(700,700);
  surface.setTitle("PLATFORME MOBILE");
  surface.setResizable(true);
  surface.setLocation(100, 100);
 myPort = new Serial(this, "COM4", 115200);
  
  myPort.bufferUntil('\n');
 
}

void serialEvent (Serial myPort){
  if ( myPort.available() > 0) {
    // If data is available,
 message = myPort.readStringUntil('\n'); 
 
 string_array = split(message ," ");
 print(message);
 vitesse1 = string_array[0];
 frequence1 = string_array[1];
  vitesse2 = string_array[2];
 frequence2 = string_array[3];
 println(vitesse1);
 println(vitesse2);
 println(frequence1);
 
}
}

public void draw(){
   
  if(scene ==1){
    
    scene_zero();}
    else {
      
      draw_scene();}
     
 
}

public void draw_scene(){
  background(255,255,121);
  textSize(25);
  fill(x+40,x-40,x);
 ellipse(width/2,height/6,150 + 100/x, 150+ 100/x);
 fill(y+40,y-40,y);
 ellipse(width/2,height - height/6,150, 150);
 fill(z+40,z-40,z);
 ellipse(width/6,height/2,150+ 100/z, 150+ 100/z);
 fill(t+40,t-40,t);
 ellipse(width-width/6,height/2,150+ 100/t, 150+ 100/t);
 fill(255,255,255);
 image(img1,width/2-80,height/2-80);
 image(img2,width-120,80);
 image(img3,60,80);
 text("Forward ", width/2 -50, height/6); 
 text("Backward ", width/2 -50,height - height/6); 
  text("Left ",width/6-30,height/2); 
   text("Right" ,width-width/6-30,height/2); 
    textSize(15);
  fill(40,90,80);

  vitesse_aff  = "Vitesse1: " + vitesse1 + "tours/min";
  
  text(vitesse_aff ,5,20);
  frequence1 = "Frequence1: "+ frequence1 + "Hz" ;
  text(frequence_aff,5,60);
  vitesse_aff  = "Vitesse2: " + vitesse2 + "tours/min";
  
  text(vitesse_aff ,width-200,20);
  frequence1 = "Frequence2: "+ frequence2 + "Hz" ;
  text(frequence_aff,width-200,60);
  
  x = 100 ;
  y = 100 ;
  z = 100 ;
  t = 100 ;
  a=0;
  b =0;
  c =0 ;
  delay(100);
}
void keyPressed() {
 println(keyCode);
  switch(keyCode){
  case 38: 
      x = 200;
     y = 100;
     z= 100;
     t= 100; 
     myPort.write('z');
  break ;
  case 40: 
     y = 200;
     x = 100;
     z= 100;
     t= 100;  
      myPort.write('s');
  break ;
  case 37: 
     z = 200;
     y = 100;
     x= 100;
     t= 100;  
      myPort.write('q');
  break ;
  case 39: 
     t = 200;
     y = 100;
     z= 100;
     x = 100;
      myPort.write('d');
  break ;
  case 10: 
    a =20;
    
    myPort.write('b');
  
 
  break;
  case 71: 
    b = 10;
    
    myPort.write('g');
  break;
 
  
  case 79: 
  
    c =10;
    
    myPort.write('o');
  break;
 
  }
img1.resize(150 + a, 150 +a);
img2.resize(60 + b, 60 +b);
img3.resize(60 + c, 60 +c);}
 void mouseClicked() {
  
  if (mouseX >= width/2 && mouseX <= width/2+200 &&    mouseY >= height/8   && mouseY <=height/8+50 ){
   scene =2;
   
  } 
     
 }
 public void scene_zero(){
   
 img = loadImage("image_first.jpg");
 img1 = loadImage("stop.jpg");
 img2 = loadImage("rotation.png");
 img3 = loadImage("rotation1.png");
 img.resize(width, height); 
 img1.resize(150, 150); 
 img2.resize(60, 60);
 img3.resize(60, 60);
 background(img);
 fill(100,230,140);
 textSize(30); 
 text("Platforme Mobile", 200, 50); 
 fill(230,149,40);
 rect(width/2,height/8,200, 50);
  fill(70,230,70);
 textSize(20); 
 text("Click to Start ", width/2 +20, height/5-10); 
 }
