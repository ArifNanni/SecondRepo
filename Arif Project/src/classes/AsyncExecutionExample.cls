public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        
         //  ID jobID2 = System.enqueueJob(new AsyncExecutionExample());
              System.debug('++++++FUTUREMETHOD+++++++');
    }
}