 class Astro{

String nombre;
int velocidad;
float direccion;
float px, py;


  Astro(String nombre_,int velocidad_, float direccion_,float px_, float py_){
 
   nombre = nombre_;
   velocidad = velocidad_;
   direccion = direccion_;
   px = px_;
   py = py_;
  
   
  }
 
  Astro(){
    
   velocidad = 1 + int (random(1));
   direccion = int (random(TWO_PI));
   px =  (random(500));
   py =  (random(500));
    
  }
  
  
  void mostrar(){

    pushMatrix();
    scale(0.3);  
    image(personaje,px,py); 
    popMatrix();
    
   }
   
   void movimiento(){
      px += velocidad;
      py += velocidad;
   }
   
   void regreso(){
    if(px>=1470) {
     velocidad*=-1;
     }
    if(px<=0){
     velocidad*=-1;  
     }
     if(py>=0) {
     velocidad*=-1;
     }
    if(py<=1470){
     velocidad*=-1;  
     }
   }
   
 void rebote(){
    px += cos(direccion) * velocidad;
    py += sin(direccion) * velocidad;
    
    if(px>=500){
      direccion = random (HALF_PI,HALF_PI+PI);
      }
    if(px<=0){
      direccion = random (-HALF_PI, HALF_PI);
      }
    if(py<=0){
      direccion = random (PI);
      }  
     if(py>=500){
      direccion = random (PI, TWO_PI);
      } 
  
   }  
   
}