/*public class RecursiveTriggerHandler{
     public static Boolean isFirstTime = true;
}*/
public Class checkRecursive{
    private static boolean run = true;
    public static boolean runOnce(){
    if(run){
     run=false;
     return true;
    }else{
        return run;
    }
    }
}