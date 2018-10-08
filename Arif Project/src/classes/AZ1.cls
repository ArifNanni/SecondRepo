public  class AZ1{

public static void abc1()
{

List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
System.debug('+++=+++'+lstShare );
}
}