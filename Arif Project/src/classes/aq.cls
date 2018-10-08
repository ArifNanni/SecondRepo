public class aq {
 public aq(ApexPages.StandardController stdCtrl)
 {
  stdCtrl.addFields(new List<String>{'Name', 'BillingCity'});
  Account acc=(Account) stdCtrl.getRecord();
 }
}