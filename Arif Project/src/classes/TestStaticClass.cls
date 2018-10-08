public class TestStaticClass {

    public static String testVariable;
    static{
        testVariable='1234';
    }
    public  TestStaticClass(){
        testVariable='1234';
    }
    
    public static void debugMyValue(){
        System.debug('testVariable'+testVariable);
        //testVariable='1234';
        //System.debug('testVariable line 11 '+testVariable);
    }
}