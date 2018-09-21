public class grid{
  public float Width;
  public float Height;
  public int xlines;
  public int ylines;
  public float centerX;
  public float centerY;
  public grid(float thewidth, float theheight, int Xlines, int Ylines){
    Width=thewidth;
    Height=theheight;
    xlines=Xlines;
    ylines=Ylines;
    centerX= -500;
    centerY= -500;
  }
  public cnumber[][] getCnumbers(){
    float xwidth=Width/(xlines-1);
    float ywidth=Height/(ylines-1);
    float cornerX=centerX-0.5*Width;
    float cornerY=centerY-0.5*Height;
    cnumber[][] cnumberarr = new cnumber[ylines][xlines];
    for (int r=0;r<ylines;r++){
      for (int c=0;c<xlines;c++){
        cnumberarr[r][c]=new cnumber(cornerX+r*ywidth, cornerY+c*xwidth);
        cnumberarr[r][c].hue = (float) (r+c)/(xlines+ylines);
      }
    }
    return cnumberarr;
  }
  public void drawgrid(){
    colorMode(HSB,1.0,1.0,1.0);
    cnumber[][] cnumberarr=getCnumbers().clone();
    for (int c = 0;c<xlines;c++){
      for (int r = 1;r<ylines;r++){
        if(doColor){
          stroke(cnumberarr[r-1][c].hue,1,1);
        }
        strokeWeight(1/yFactor);
        line(cnumberarr[r-1][c].x,cnumberarr[r-1][c].y,cnumberarr[r][c].x,cnumberarr[r][c].y);
      }
    }
    for (int r=0;r<ylines;r++){
      for (int c=1;c<xlines;c++){
        if(doColor){
          stroke(cnumberarr[r][c-1].hue,1,1);
        }
        strokeWeight(1/xFactor);
        line(cnumberarr[r][c-1].x,cnumberarr[r][c-1].y,cnumberarr[r][c].x,cnumberarr[r][c].y);
      }
    }
  }
}