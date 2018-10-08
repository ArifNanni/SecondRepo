trigger trigge on M1__c (before insert,after insert,before update,after update) {



if(Trigger.isupdate)
{
 if(Trigger.isbefore)
 {
//  Trigger.new[0].recalculateFormulas();
  System.debug('**********************************beforee update'+Trigger.new[0].Formula__c);
 }
  if(Trigger.isAfter)
 {
 //Trigger.new[0].recalculateFormulas();
  M1__c v=[ Select id, name from M1__c where id =:Trigger.new[0].id];
 // v.recalculateFormulas();
 /*
 System.debug('****++'+trigger.new.size());
 Set<id> idns = new Set<id>();
 idns.add('a150I00000DfXBC');
 idns.add('a150I00000DfXBH');
 idns.add('a150I00000DfXLx');
 idns.add('a150I00000DfXM2');
 System.debug('O++-++'+trigger.old[0].wText3__c );
 System.debug('N++-++'+trigger.new[0].wText3__c );
 if(constants.flag1)
     {
  System.debug('Afterr update');
   List<M1__c> M1 = [Select id,wText3__c from  M1__c where id =:idns limit 4];
  
 
 M1[0].wText3__c = '19';
 M1[1].wText3__c = '19';
 M1[2].wText3__c = '19';
 M1[3].wText3__c = '19';
 
     
      constants.flag1 = false;
      update M1;
      
      }
      
      System.debug('PPPPPPPPPPP'); 
      
      
      Set<id> idns1 = new Set<id>();
 idns1.add('a150I00000DwQ5y');
 idns1.add('a150I00000DfXBH');
 
 if(constants.flag2)
     {
  System.debug('Afterr update');
   List<M1__c> M1 = [Select id,wText3__c from  M1__c where id =:idns1 limit 2];
  
 
 M1[0].wText3__c = '19';
 M1[1].wText3__c = '21';

     
      constants.flag2 = false;
      update M1;
      
      }
 
 System.debug('ZZZZZZZZZZ'); 
 
  
 
 */
 }
}
}