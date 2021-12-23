//A simple schedulable class
public class MySchedulableClass implements Schedulable {
    public void execute(SchedulableContext sc) {
        System.debug('Came into MySchedulableClass.execute() @ ' + System.now());
    }
}
