/*
//Future Method Test
System.debug('Calling nonFutureCall()');
MyFutureMethodClass.nonFutureCall();
System.debug('Finished Calling nonFutureCall()');

System.debug('Calling futureCall()');
MyFutureMethodClass.futureCall();
System.debug('Finished Calling futureCall()');
*/
/*
//Batch class test
System.debug('Starting a batch job');
MyBatchClass mbc = new MyBatchClass();
Database.executeBatch(mbc, 20);
System.debug('Started a batch job');
*/

//Queueable Apex test
//Will give an error due to recursion as it will try to keep queuing beyond the allowed depth of 5
/*
MyQueueableClass1 mqc = new MyQueueableClass1('Hello Stratos');
System.enqueueJob(mqc);
*/

//Apex REST Callout
//SimpleRESTCallout.getAccounts();

/*
//Hack to get session id
System.debug(UserInfo.getSessionId().substring(0, 10) + ' ' + UserInfo.getSessionId().substring(10));
*/

//SOAP Service Callout
CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
System.debug('>>>>> ' + calc.doDivide(10, 3));