final int myWidth = 900;      //definir tamanho da janela
final int myHeight = 600;     //definir tamanho da janela
//PImage[] images = new PImage[23];
char a[]={'a', 'b', 'c', 'd', 'e', 'f', 'g',
  'h', 'i', 'j', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
  's', 't', 'u', 'v', 'x', 'z'};
color windowColor;            //cor da janela
String[] filenames = {"aviao.jpg", "burro.jpg", 
  "cao.jpg", "dado.jpg", "estrela.jpg", 
  "faca.jpg", "gato.jpg", "hipopotamo.jpg", 
  "igreja.jpg", "janela.jpg", "lua.jpg", 
  "mar.jpg", "nuvens.jpg", "ovos.jpg", 
  "porco.jpg", "queijo.jpg", "rato.jpg", 
  "sol.jpg", "tomate.jpg", "urso.jpg", 
  "vaca.jpg", "xilofone.jpg", "zebra.jpg"};
PImage img;
PImage[] images = new PImage[filenames.length];

color borderColor= color (255,255,255);
int index;
int cell;

void settings()
{
  size(myWidth, myHeight);        //define o tamanho da janela
}

void loadAllImages()
{
  for( int i= 0 ; i < filenames.length; i++)
  {
    img= loadImage(filenames[i]);
    images[i]= img;
  }
}


void setup()
{
 windowColor = color(0,0, 0);     //define a cor inicial da janela
loadAllImages();
index=int(random(a.length));
}

void drawAllImages()
{
  int x=0;
  int y=0;
  for(int i=0; i < images.length; i++)
  {
  image(images[i],x,y,150,150);
  x+=(width/6);
  if( x > 750)
  {
  x=0;
  y+=(height/4);
  }
  }
}

void mouseClicked()
{
cell = getCell(mouseX, mouseY);
if(cell == index){
 borderColor = color(0, 255, 0); 
 index=int(random(a.length));
}
 else
   borderColor = color(255, 0, 0); 
}

int getCell (int x, int y)
{
  int coluna = int((x-width*0.1)/((width*0.8)/6)); 
  int linha = int((y-height*0.1)/((height*0.8)/4)); 
  int result = (linha)*6 + coluna; 
  return result; 
}
 
void draw()
{ 
  background(windowColor); 
  text(a[index],0.91*width,0.83*height); 
  textSize(100); 
  textAlign(CENTER,CENTER);
  drawAllImages();
   noFill(); 
  strokeWeight(3);
  stroke(borderColor); 
  rect(((width)/6)*(cell%6), (cell/6)*((height)/4), (width)/6, (height)/4);
}

void keyPressed()
{
  index = int(random(a.length));
}
