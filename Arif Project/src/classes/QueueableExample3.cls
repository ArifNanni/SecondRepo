public class QueueableExample3 implements Queueable {
 
    public void execute(QueueableContext context) {
              System.enqueueJob(new QueueableExample1()); 
    }
}