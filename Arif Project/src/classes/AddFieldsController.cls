public class AddFieldsController 
{
 public AddFieldsController(ApexPages.StandardController stdCtrl)
 {
  stdCtrl.addFields(new List<String>{'Name', 'BillingCity'});
  Account acc=(Account) stdCtrl.getRecord();
 }
}