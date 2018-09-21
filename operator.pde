public class operator{
  public cnumber toRect(float mag, float angle){
    float x=(float) (mag*Math.cos(angle));
    float y=(float) (mag*Math.sin(angle));
    return new cnumber(x,y);
  }
  public cnumber add(cnumber a, cnumber b){
    return new cnumber(a.x+b.x, a.y+b.y);
  }
  public cnumber mult(cnumber a, cnumber b){
    float mag=a.mag*b.mag;
    float angle=a.angle+b.angle;
    return toRect(mag,angle);
  }
  public cnumber squared(cnumber a){
    float mag = (float) Math.pow(a.mag,2);
    float angle = a.angle*2;
    return toRect(mag, angle);
  }
  public cnumber cubed(cnumber a){
    float mag = (float) Math.pow(a.mag,3);
    float angle = a.angle*3;
    return toRect(mag,angle);
  }
  public cnumber subtract(cnumber a, cnumber b){
    return new cnumber(a.x-b.x,a.y-b.y);
  }
  public cnumber exp(cnumber a){
    return toRect((float) Math.pow(Math.E, a.x), a.y);
  }
  public cnumber ln(cnumber a){
    a.angle = a.angle % (2*PI);
    return new cnumber((float) Math.log(a.mag),a.angle);
  }
  public cnumber divide(cnumber a, cnumber b){
    return new cnumber((a.x*b.x-a.y*b.y)/(b.x*b.x+b.y*b.y),(b.x*a.y+a.x*b.y)/(b.x*b.x+b.y*b.y));
  }
  public cnumber power(cnumber a, cnumber b){
    return exp(mult(b, ln(a)));
  }
  public cnumber sine(cnumber a){
    return new cnumber((float) (Math.sin(a.x)*Math.cosh(a.y)), (float) (Math.cos(a.x)*Math.sinh(a.y)));
  }
  public cnumber cosine(cnumber a){
    return new cnumber((float) (Math.cos(a.x)*Math.cosh(a.y)), (float) (-1*Math.sin(a.x)*Math.sinh(a.y)));
  }
}