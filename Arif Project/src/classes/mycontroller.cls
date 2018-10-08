public class mycontroller {

    public String name { get; set; }
public String mystring;

    public String getMethod2() {
    if(mystring == null)
          mystring='Method2';  
        return  mystring;
    }


    public String getMethod1() {
        return mystring;
    }

    public String getmyString()
     { return 'mystring'; }
}