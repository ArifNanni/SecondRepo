public class aaa {

    public aaa(ApexPages.StandardSetController controller) {

    }


    public aaa(Account9 controller) {
    
      System.debug('Thisssssssssss is  mmnormal'+controller.a.id);          

    }


    public aaa(ApexPages.StandardController controller) {
    System.debug('This Abnormal');
   // System.debug()

    }
    public aaa()
    {
     System.debug('-----This normal');
    }

public Pagereference save()
{
Account a = new Account();

return null;
}
}