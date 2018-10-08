Public class Queuable
{
 public void abcd()
 {
   //futureClass.futureMethod();
   System.debug('*******'+Limits.getQueueableJobs()+'***1');
   ID jobID1 = System.enqueueJob(new AsyncExecutionExample());
   System.debug('*******'+Limits.getQueueableJobs()+'***2');
   
 }

}