// el proyecto lo que hace es tener tres personajes desplazándose por la pantalla.
// al mover el mouse sobre la pantalla la canción que se está reproduciendo se va distorsionando
// en la parte de abajo hay una figura que va cambiando su dirección de acuerdo a la posición del mouse
// hay unos ellipse en toda la pantalla que van cambiando de color simulando estrellas


import processing.sound.*;

SoundFile soundfile;

Astro Personaje;
Astro Personaje2;
Astro Personaje3;
Metereo Roca;
Mar Mono;


int i = 20, j =20;
int fondo1;

PImage inicio;
PImage personaje;
PImage roca;
PImage mono;
PImage fondo;

ArrayList <Astro> astros;
ArrayList <Metereo> metereos;
ArrayList <Mar> mars;



void setup(){

   size(500,500,P3D);
   fill(#e9ab00);
   
   soundfile = new SoundFile(this, "musica.mp3");

   inicio     =   loadImage   ("inicio.jpg");
   inicio.resize(width,height);
   personaje  =   loadImage   ("astro.png");
   roca       =   loadImage   ("metereo.png");
   mono       =   loadImage   ("mar.png");
   fondo      =   loadImage   ("fondo.jpg");
   fondo.resize(width,height);
   
   astros   = new ArrayList <Astro>();
   metereos = new ArrayList <Metereo>();
   mars     = new ArrayList <Mar>();
   
   Personaje  = new Astro ("Personaje",2,1, random(300), random(200));
   Personaje2 = new Astro ("Personaje",1,3, random(200), random(100));
   Personaje3 = new Astro ("Personaje",3,2, random(100), random(300));
   Roca = new Metereo ("Roca",1,1, random(100), random(100));
   Mono = new Mar ("Mars",1,1, random(100), random(100));
  
    println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
    println("SFSamples= " + soundfile.frames() + " samples");
    println("SFDuration= " + soundfile.duration() + " seconds");
    
    soundfile.loop();
   
   for (int i=0; i<3; i++){
      astros.add(new Astro());
   }
   for (int i=0; i<1; i++){
      metereos.add(new Metereo());
   }
   for (int i=0; i<1; i++){
      mars.add(new Mar());
   } 
   
   frameRate(15);
     if (frame != null){ 
       frame.setResizable(true);
      }
 
}

  void draw(){
      switch(fondo1){

        case 0: 
                 image(inicio,0,0);
                 intro();
 
       break;
    
       case 1:
                 image (fondo,0,0);
                 todo();
       break;      
     }
}  
    
  void intro(){
     if (mousePressed){
        fondo1 = 1;
     }
}
    
  void todo(){  
    
      soundfile.rate(map(mouseX, 0, width, 0.25, 4.0)); 
      soundfile.amp(map(mouseY, 0, width, 0.2, 1.0));
 
      for(Astro a: astros){
        a.mostrar(); 
        a.movimiento();
        a.regreso();
        a.rebote(); 
      }
   
       for(Metereo m: metereos){
         m.mostrar(); 
         m.movimiento();
         m.regreso();
         m.rebote();
       }
   
      for(Mar m: mars){
        m.mostrar(); 
        m.movimiento();
       }
   
   
      for (i=10; i<=width; i=i+20){
        for (j=10; j<=height; j=j+20){
             ellipse(i,j,2,2);
             colorear(i,j);
          }
      }
   
     noStroke(); 
  
   float dirY = (mouseY / float(height) - 0.5) * 2;
   float dirX = (mouseX / float(width) - 0.5) * 2;
   directionalLight(204, 204, 204, -dirX, -dirY, -1); 
   scale(.5);
   translate(90, 910,-50); 
   sphere(90); 
   
 }
 
 void colorear(int i, int j){
 
   if ((i+j)%90==255){
     fill(0,(int) random(0,233),0);
     stroke(0,(int)random(0,233),0);
     strokeWeight((int)random(0,5));
   }
   
   else if ((i+j)%16==255){
     fill((int) random(0,233),0,0);
     stroke((int)random(0,233),0,0);
     strokeWeight((int)random(0,5));
   }
   
   else  {
     fill(0,0,(int) random(0,233));
     stroke(0,0,(int)random(0,233));
     strokeWeight((int)random(0,5));
   }
 }