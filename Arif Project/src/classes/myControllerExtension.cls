public class myControllerExtension {

    public myControllerExtension(Account12 controller) {

    }

ApexPages.StandardController sc;
    public myControllerExtension(ApexPages.StandardSetController controller) {

    }

    private final Account acct;
     
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard

    // controller.

    public myControllerExtension(ApexPages.StandardController stdController) {

        this.acct = (Account)stdController.getRecord();
        sc = new ApexPages.StandardController(acct);
     //   stdController.edit();
      //  sc.save();
    //    sc.delete();
        

    }

    public Pagereference getGreeting() {
        return null;

    }

}