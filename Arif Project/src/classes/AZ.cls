public  class AZ{

public static void abc()
{

//List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
 //System.debug('+++=+++'+lstShare );
 List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
System.debug('out+++=+++'+lstShare );
 new AZ2().abc2();
}
public with sharing Class AZ2{
public  void abc2()
{

List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
System.debug('in+++=+++'+lstShare );
}


}

}