//Future Method Call
/*
System.debug("Calling nonFutureCall method");
MyFutureMethodClass.nonFutureCall();

System.debug("Calling futureCall method");
MyFutureMethodClass.futureCall();
*/

//Batch class
/*
System.debug("Executing batch process");
MyBatchClass mbc = new MyBatchClass();
Database.executeBatch(mbc, 30);
*/

//Queueable class
/*
System.debug("Enqueing Queueable Apex job");
MyQueueableClass1 mqc = new MyQueueableClass1("Hello Stratos Team");
System.enqueueJob(mqc);
*/

//REST Service Call
//SimpleRESTCallout.getAccounts();

//SOAP Service Call
//CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
//System.debug('>>> 20/3 = ' + calc.doDivide(20, 3));

//Get Session ID
String sessionId = UserInfo.getSessionId();
System.debug(sessionId.substring(0, 20));
System.debug(sessionId.substring(20));

//Retrieved Session ID
00D5g000005UvqG!AQUAQCbEx_duIpncatFwqBD0m0aYSMv8QUI9ypEhecZT.fusSScbS25oW556PghEpmHbYPDzh..5r.kQ7MPjPnN2F3pRfczv