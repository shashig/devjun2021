//Making a REST Callout from an Apex Method
SimpleRESTCallout.getAccounts();

//Making a call to a SOAP Method
//CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
//System.debug('>>> 20 / 4 = ' + calc.doDivide(20, 4));

//Getting session ID
System.debug(UserInfo.getSessionId());
System.debug(UserInfo.getSessionId().substring(0, 8));
System.debug(UserInfo.getSessionId().substring(8));