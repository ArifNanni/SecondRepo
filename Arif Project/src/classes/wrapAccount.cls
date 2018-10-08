public class wrapAccount  implements Comparable
{


public Account acc;

public wrapAccount  (Account acc)
{
  this.acc = acc;
}


public Integer compareTo(Object compareToTab1)
{

   wrapAccount compareToTab = (wrapAccount)compareToTab1;
        if (acc.Squence__c== compareToTab.acc.Squence__c){
            return 0;
        }
        
        if (acc.Squence__c > compareToTab.acc.Squence__c ){
            return 1;
        }
        return -1;        
    }




}