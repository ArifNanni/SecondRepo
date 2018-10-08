public class QueueableExample1 implements Queueable {
 
    public void execute(QueueableContext context) {
              System.enqueueJob(new QueueableExample2()); 
    }
}