ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();
int w,h,ball_size,dir,xx,yy;
int[]dx={0,0,1,-1};
int[]dy={1,-1,0,0};
boolean gameover=false;

void setup()
{
  size(500,500); x.add(4); y.add(4);
  w = 30;
  h = 30;
  ball_size = 17;
  dir = 2;
  xx = 12;
  yy = 10;
}

void draw() 
{
  background(255);
  fill(0,0,0);
  
  for(int i =0; i < x.size(); i++)
  ellipse(x.get(i) * ball_size, y.get(i) * ball_size, ball_size, ball_size);
  if (!gameover) 
  {
    fill(255,0,0);
  ellipse(xx  *ball_size,  yy * ball_size, ball_size, ball_size);
  if (frameCount%5 == 0) 
  {
      x.add(0, x.get(0) + dx[dir]);
      y.add(0, y.get(0) + dy[dir]);
      
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) //crach the wall
      gameover = true;
      
      for(int i = 1; i < x.size(); i++)
      if (x.get(0) == x.get(i) && y.get(0) == y.get(i))
      gameover = true;
      
       if (x.get(0) == xx && y.get(0) == yy)
      {
        xx = (int)random(0 , w);
        yy = (int)random(0 , h);
      }
      else {
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
    }
  }
  else
  {
    fill(0,0,0);
    textSize(30);
    textAlign(CENTER);
    text("Game Over.",width / 2, height / 2);
    
    if(keyPressed && key == ' ')
    {
      x.clear();
      y.clear();
      x.add(4);
      y.add(4);
      gameover = false;
    }
  }
}

  void keyPressed() 
  {
    int nd = key == 's'? 0:(key == 'w'? 1:(key == 'd'? 2:(key == 'a'? 3: -1)));
        
    if (nd != -1 && (x.size() <= 1 || !(x.get(1) == x.get(0) + dx[nd] && 
          y.get(1) == y.get(0) + dy[nd])))
        
      dir = nd;
  }
  