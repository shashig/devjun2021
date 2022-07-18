//Future method demo
/*
System.debug('>>> Calling synchronously ' + System.now());
MyFutureMethodClass.nonFutureCall();
System.debug('>>> Calling asynchronously ' + System.now());
MyFutureMethodClass.futureCall();
*/

//Batch class demo
/*
MyBatchClass mbc = new MyBatchClass();
Database.executeBatch(mbc, 30);
*/

//Queueable Class demo
/*
System.debug('Enqueuing Queueable Apex');
MyQueueableClass1 mqc = new MyQueueableClass1('Hello Stratos Team');
System.enqueueJob(mqc);
*/

//Apex REST Callout
//SimpleRESTCallout.getAccounts();

//Apex SOAP Service Callout
/*
CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
Integer divideResult = (Integer)calcService.doDivide(34, 7);

System.debug('>>> 34 / 7: ' + divideResult);
*/

//Getting session id
String sessionId = UserInfo.getSessionId();
System.debug(sessionId.substring(0, 15));
System.debug(sessionId.substring(15));

//00D5g000005UvqG!AQUAQIgGdpvKPyYIY3H6T6naN4_kLlwiTsOtQdE6sVgYkM.EEhQa9PPWjKDsJrpit0iGq6A29xSIuMLNolLIcZ8fAiNOJ_Ty