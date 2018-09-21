public class cnumber{
  float x;
  float y;
  float mag;
  float angle;
  float hue;
  public cnumber(){
    x=0;
    y=0;
    mag=0;
    angle=0;
    hue=0;
  }
  public cnumber(float X, float Y){
    x=X;
    y=Y;
    mag=(float) Math.sqrt(x*x+y*y);
    angle=(float) Math.atan2(y,x);
  }
}