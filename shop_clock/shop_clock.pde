PFont bebas;

String hour;
String minute;
int second;
int storedSecond;
int storedMinute;
int hourInt;

float plusMinus;
int whiteBlack;
int alpha;

String time;

void setup(){
  fullScreen();
  //size(1280, 700);
  frameRate(30);
  bebas = createFont("BebasNeue Bold.otf", width/3);
  textFont(bebas);
  textSize(width/2);
  textAlign(CENTER, CENTER);
  background(0);
  whiteBlack = 0;
  alpha = 0;
}

void draw(){
  second = second();
  
  if(minute() < 10){
      minute = "0" + minute();
  }else{
     minute = str(minute()); 
  }
  
  if(hour() < 10){
     hour = "0" + hour;
  }else{
     hour = str(hour());
  }
  
  time = hour + ":" + minute;

  if(storedSecond != second){
      plusMinus = random(1);  
      println(second);
  }
  
  if(storedMinute != minute()){
    if(whiteBlack == 0){
       whiteBlack = 255; 
    }else{
       whiteBlack = 0; 
    }
    alpha = 0;
    storedMinute = minute();
  }


  loadPixels();
  if(second > 0){
    for (int i = second; i < width*height - second; i=i+second) {
      if(plusMinus >= 0.5){
        pixels[i+int(random(second))] = pixels[i];
      }else{
        pixels[i-int(random(second))] = pixels[i];
      }
    } 
    updatePixels();
  }

  fill(whiteBlack, whiteBlack, whiteBlack, alpha);
  text(time,width/2,height/2);

  if(alpha < 255){
    alpha++;
  }
  storedSecond = second;
  
}