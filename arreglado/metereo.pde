class Metereo{

String nombre;
int    velocidad;
float  direccion;
float  px, py;


  Metereo(String nombre_,int velocidad_, float direccion_,float px_, float py_){
 
   nombre = nombre_;
   velocidad = velocidad_;
   direccion = direccion_;
   px = px_;
   py = py_;
   
   
  }
  
  Metereo(){
    
   velocidad = 1 + int (random(2));
   direccion = int (random(TWO_PI));
   px =  (random(500));
   py =  (random(500));
    
  }
  
  void mostrar(){

    pushMatrix();
    scale(0.5);  
    image(roca,px,py); 
    popMatrix();
    
   }

   
    void movimiento(){
       px += velocidad;
       py += velocidad;
   }
   
   void regreso(){
        
        if(px>=600) {
           velocidad*=-1;
        }
        if(px<=10){
           velocidad*=-1;  
        }
        if(py>=10) {
           velocidad*=-1;
        }
        if(py<=600){
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