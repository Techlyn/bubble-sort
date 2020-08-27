
import java.util.Random;

float[] values;

int iter = 0;

Segment[] segments;

void setup() {

  size(1000, 600);
  segments = new Segment[width];
  values = new float[width];
  segments = new Segment[width];
  float numOfSegments = width;
  float j = height/numOfSegments;
  
  colorMode(HSB, width);
  for (int i = 0; i < values.length; i++) {
    values[i] = i * j;
    segments[i] = new Segment(i, height, i, height - values[i], values[i]);
  }

  AShuffle(segments);
}

void draw() {
  background(0);


  for (int i = 0; i < segments.length; i++) {
    stroke(segments[i].colour,1000,1000);
    segments[i].show();
  }
  
  if(iter < values.length){
    for(int j = 0; j < values.length - iter - 1; ++j){
      float a = segments[j].endPos.y;
      float b = segments[j + 1].endPos.y;
      
      if(a < b){
        arrange(segments, j, j + 1);
      }
    }
 
  } else {
    println("Finished");
    noLoop();
  }
  iter++;
}

class Segment {

  PVector startPos, endPos;
  int r, g, b;
  float colour;

  Segment(float sPosX, float sPosY, float ePosX, float ePosY, float inCol) {
    colour = inCol;
    startPos = new PVector(sPosX, sPosY);
    endPos = new PVector(ePosX, ePosY);
    
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
  }

  void show() {
   
    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }
}

void arrange(Segment[] arr, int a, int b) {
  float temp = arr[a].endPos.y;
  arr[a].endPos.y = arr[b].endPos.y;
  arr[a].colour = arr[b].endPos.y;
  arr[b].endPos.y = temp;
  arr[b].colour = temp;
}

void AShuffle(Segment[] arr) {
  Random random = new Random();

  for (int i = 0; i < arr.length; i++) {
    int j = random.nextInt(i+1);
    arrange(arr, i, j);
  }
}
