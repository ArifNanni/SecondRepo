public with sharing class PassParameterActionFunction {
  public String val{get;set;}
    public String enteredText1{get;set;}
    public String enteredText2{get;set;}
 
    public void echoVal()
    {
    String s1=enteredText1;
    String s2=enteredText2;
    system.debug('s1s1'+s1+'s2s2'+s2);
     val = 'You have entered : 1 - '+enteredText1+' 2 -'+enteredText2;
    }
}