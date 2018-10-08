global class CM_Sch_Batch_Create_New_Case_KYC implements Schedulable
{
    global void execute( SchedulableContext sc )
    {
          
        database.executebatch(new CM_BatchClass(),200);
       
    }
   
}