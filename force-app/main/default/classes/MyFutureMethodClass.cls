public class MyFutureMethodClass {
    @future
    public static void futureCall() {
        System.debug('MyFutureMethodClass.futureCall() ran at: ' + System.now());
    }

    public static void nonFutureCall() {
        System.debug('MyFutureMethodClass.nonFutureCall() ran at: ' + System.now());
    }
}
