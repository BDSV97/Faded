class   Mar{

String nombre;
int velocidad;
float direccion;
float px, py;


  Mar(String nombre_,int velocidad_, float direccion_,float px_, float py_){
 
   nombre = nombre_;
   velocidad = velocidad_;
   direccion = direccion_;
   px = px_;
   py = py_;
  
   
  }
 
  Mar(){
    
   velocidad = 1 + int (random(5));
   direccion = int (random(TWO_PI));
   px =  (random(500));
   py =  (random(500));
    
  }
  
   void mostrar(){

    pushMatrix();
    scale(0.2);  
    image(mono,px,py); 
    popMatrix();
    
 }
   
    void movimiento(){ 
        px += velocidad; 
     
      if (px >= 1950){
         velocidad = -10;
       }
  
      if (px <= 25){
          velocidad = 10;
       }
   }
   
 }