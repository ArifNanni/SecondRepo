public class ExampleController {

    DateTime T1{get{System.debug('++**()'); return  t1; } set;}
    transient DateTime T2{get; set;}

    public DateTime getT1() {
    System.debug('**()');
        if (t1 == null) t1 = System.now();
        return  t1;
    }

    public DateTime getT2() {
        if (t2 == null) t2 = System.now();
        return t2;
    }
}