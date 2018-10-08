public class QueueableExample implements Queueable {
 
    public void execute(QueueableContext context) {
     System.enqueueJob(new QueueableExample1());         
    }
}