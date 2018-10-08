public class myControllerExtension12 {
 public ApexPages.StandardController standardController { get; set; }
 public pagereference page { get; set; }
    public myControllerExtension12(ApexPages.StandardController controller) {
        Account d = (Account)controller.getRecord();
       // page = d.edit();
        PageReference editPage = new ApexPages.StandardController(d).edit();
        editPage.setRedirect(true);

        page = editPage;
    }


    public myControllerExtension12(Account12 controller) {

    }

public pagereference save1()
{
  return page;
}
    

}