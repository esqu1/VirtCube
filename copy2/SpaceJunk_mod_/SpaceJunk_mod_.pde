/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int anglex, initanglex, angley, initangley, anglez, initanglez;
boolean rotatedx = true, rotatedy = true, rotatedz = true;
int asdf = 0;

// Array for all cubes
//Cube[] cubes = new Cube[27];
Cube[][][] cubes = new Cube[3][3][3];

// Array for colors
int[][] colors = {
  { 
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  { 
    2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  { 
    3, 3, 3, 3, 3, 3, 3, 3, 3
  }
  , 
  { 
    4, 4, 4, 4, 4, 4, 4, 4, 4
  }
  , 
  { 
    5, 5, 5, 5, 5, 5, 5, 5, 5
  }
  , 
  { 
    6, 6, 6, 6, 6, 6, 6, 6, 6
  }
};

public static void pause(int n) {
  try {
    Thread.sleep(1000 * n);
  }
  catch(InterruptedException e) {
    Thread.currentThread().interrupt();
  }
}


void setup() {
  size(800, 400, P3D);
  background(255); 
  noStroke();
  anglex = 90;
  angley = 90;
  anglez = 90;
  initanglex = 0;
  initangley = 0;
  initanglez = 0;

  // Instantiate cubes, passing in random vals for size and postion
  //cubes[0] = new Cube(30, 30, 30, 0, 0, 0);
  //cubes[1] = new Cube(30, 30, 30, 200, 0, 0);

  /*
  cubes[0] = new Cube(30, -7.5, -7.5, -7.5);
   cubes[1] = new Cube(30, -52.5, -52.5, -52.5);
   cubes[2] = new Cube(30, -7.5, -52.5, -52.5);
   cubes[3] = new Cube(30, 37.5, -52.5, -52.5);
   cubes[4] = new Cube(30, -52.5, -52.5, -7.5);
   cubes[5] = new Cube(30, -7.5, -52.5, -7.5);
   cubes[6] = new Cube(30, 37.5, -52.5, -7.5);
   cubes[7] = new Cube(30, -52.5, -52.5, 37.5);
   cubes[8] = new Cube(30, -7.5, -52.5, 37.5);
   cubes[9] = new Cube(30, 37.5, -52.5, 37.5);
   cubes[10] = new Cube(30, -52.5, -7.5, -52.5);
   cubes[11] = new Cube(30, -7.5, -7.5, -52.5);
   cubes[12] = new Cube(30, 37.5, -7.5, -52.5);
   cubes[13] = new Cube(30, -52.5, -7.5, -7.5);
   cubes[14] = new Cube(30, 37.5, -7.5, -7.5);
   cubes[15] = new Cube(30, -52.5, -7.5, 37.5);
   cubes[16] = new Cube(30, -7.5, -7.5, 37.5);
   cubes[17] = new Cube(30, 37.5, -7.5, 37.5);
   cubes[18] = new Cube(30, -52.5, 37.5, -52.5);
   cubes[19] = new Cube(30, -7.5, 37.5, -52.5);
   cubes[20] = new Cube(30, 37.5, 37.5, -52.5);
   cubes[21] = new Cube(30, -52.5, 37.5, -7.5);
   cubes[22] = new Cube(30, -7.5, 37.5, -7.5);
   cubes[23] = new Cube(30, 37.5, 37.5, -7.5);
   cubes[24] = new Cube(30, -52.5, 37.5, 37.5);
   cubes[25] = new Cube(30, -7.5, 37.5, 37.5);
   cubes[26] = new Cube(30, 37.5, 37.5, 37.5); 
   for(
  cubes[0] = new Cube(30, 0, 0, 0);
  cubes[1] = new Cube(30, -45, -45, -45);
  cubes[2] = new Cube(30, 0, -45, -45);
  cubes[3] = new Cube(30, 45, -45, -45);
  cubes[4] = new Cube(30, -45, -45, 0);
  cubes[5] = new Cube(30, 0, -45, 0);
  cubes[6] = new Cube(30, 45, -45, 0);
  cubes[7] = new Cube(30, -45, -45, 45);
  cubes[8] = new Cube(30, 0, -45, 45);
  cubes[9] = new Cube(30, 45, -45, 45);
  cubes[10] = new Cube(30, -45, 0, -45);
  cubes[11] = new Cube(30, 0, 0, -45);
  cubes[12] = new Cube(30, 45, 0, -45);
  cubes[13] = new Cube(30, -45, 0, 0);
  cubes[14] = new Cube(30, 45, 0, 0);
  cubes[15] = new Cube(30, -45, 0, 45);
  cubes[16] = new Cube(30, 0, 0, 45);
  cubes[17] = new Cube(30, 45, 0, 45);
  cubes[18] = new Cube(30, -45, 45, -45);
  cubes[19] = new Cube(30, 0, 45, -45);
  cubes[20] = new Cube(30, 45, 45, -45);
  cubes[21] = new Cube(30, -45, 45, 0);
  cubes[22] = new Cube(30, 0, 45, 0);
  cubes[23] = new Cube(30, 45, 45, 0);
  cubes[24] = new Cube(30, -45, 45, 45);
  cubes[25] = new Cube(30, 0, 45, 45);
  cubes[26] = new Cube(30, 45, 45, 45);*/
  
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      for(int k = -1; k < 2; k++){
        cubes[i+1][j+1][k+1] = new Cube(30,45*i,45*j,45*k);
      }
    }
  }
}

void draw() {
  background(157, 157, 157);
  fill(200);
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  if (asdf == 0) {
    drawAllCubes();
  }
  /*
  if (anglex < 90 && rotatedy && rotatedz) {
   anglex++;
   } else {
   rotatedx = true;
   }
   
   if (angley < 90 && rotatedx && rotatedz) {
   angley++;
   } else {
   rotatedy = true;
   }
   
   if (anglez < 90 && rotatedx && rotatedy) {
   anglez++;
   } else {
   rotatedz = true;
   }
   */

  drawAllCubes();
}

void drawAllCubes(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cubes[i][j][k].drawCube();
      }
    }
  }
}

void keyPressed() {
  println("rotatedx: " + rotatedx);
  println("rotatedy: " + rotatedy);
  println("rotatedz: " + rotatedz);
  println(key);
  if (rotatedx && rotatedy && rotatedz) {
    if (key == 'i') {
      rotX(0);
    } else if (key == 'h') {
      angley = 0; 
      initangley++; 
      rotatedy = false;
    } else if (key == 'f') {
      anglez = 0; 
      initanglez++; 
      rotatedz = false;
    } else if (key == 'u') {
      //Uturn();
    }
  }
}

/*
void swap(int[][] swapper) {
  Cube temp = cubes[swapper[0][0]]; 
  cubes[swapper[0][0]] = cubes[swapper[0][1]]; 
  cubes[swapper[0][1]] = cubes[swapper[0][2]]; 
  cubes[swapper[0][2]] = cubes[swapper[0][3]]; 
  cubes[swapper[0][3]] = temp; 
  Cube temp2 = cubes[swapper[1][0]]; 
  cubes[swapper[1][0]] = cubes[swapper[1][1]]; 
  cubes[swapper[1][1]] = cubes[swapper[1][2]]; 
  cubes[swapper[1][2]] = cubes[swapper[1][3]]; 
  cubes[swapper[1][3]] = temp2;
}*/



// Problem: the cubes will not be rotated; their orientation stays the same.
void rotX(int dir) {
  if(anglex < 90){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 3; k++){
          cubes[i][j][k].rot(0,1);
        }
      }
    }
  }else{
      anglex = 0;
  }
}

