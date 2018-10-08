global class batchAccount implements Database.Batchable<sObject> {
    Integer party = 0;
    static Integer statef = 0;
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,AccountNumber FROM Account';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Account> scope) {
      system.Debug('==========='+statef);
      statefulll.state  = statefulll.state + 200 ;
      statef = statef + 200;
      party = statef;
         
         for(Account a : scope)
         {
            
            system.debug('-----Batch RIP1 '+party);
            system.debug('-----Batch RIP2 '+statefulll.state);
             a.AccountNumber = '1000';            
         }
         update scope;
    }   
    
    global void finish(Database.BatchableContext BC) {
   // Database.executeBatch(new batchAccountupdate(), 200);
    }
}