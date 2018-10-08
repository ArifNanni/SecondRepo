public class MyController90 {

    public static String someValue1 { get; set; }
    public transient String someValue { get; set; }
    
  public MyController90() {
    someValue = '1';
  }
  public void incrementCounter() {
    someValue = someValue + '1';
  }
}