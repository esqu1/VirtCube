/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int anglex, initanglex, angley, initangley,anglez,initanglez;
boolean rotatedx = true, rotatedy = true, rotatedz = true;

// Cube count-lower/raise to test performance
int limit = 2;

// Array for all cubes
Cube[] cubes = new Cube[27];

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
  cubes[26] = new Cube(30, 45, 45, 45);
}

void draw(){
  background(157,157,157); 
  fill(200);
  translate(width/2, height/2, 100);

  if(anglex < 90 && rotatedy && rotatedz){
    anglex++;
  }else{
    rotatedx = true;
  }
  
  if(angley < 90 && rotatedx && rotatedz){
    angley++;
  }else{
    rotatedy = true;
  }
  
  if(anglez < 90 && rotatedx && rotatedy){
    anglez++;
  }else{
    rotatedz = true;
  }
  
  
  for (int i = 0; i < cubes.length; i++){
    pushMatrix();
    rotateX(radians(initanglex*90));
    rotateX(radians(anglex));
    rotateY(radians(initangley*90));
    rotateY(radians(angley));
    rotateZ(radians(initanglez*90));
    rotateZ(radians(anglez));
    
    cubes[i].drawCube();
    popMatrix();
  }
}

void keyPressed() {
  println("rotatedx: " + rotatedx);
  println("rotatedy: " + rotatedy);
  println("rotatedz: " + rotatedz);
  println(key);
  if(rotatedx && rotatedy && rotatedz){
    if(key == 'i'){
      anglex = 0;
      initanglex++;
      rotatedx = false;
    }else if(key == 'h'){
      angley = 0;
      initangley++;
      rotatedy = false;
    }else if(key == 'f'){
      anglez = 0;
      initanglez++;
      rotatedz = false;
    }
  }
  
}

