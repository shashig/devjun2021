public with sharing class SimpleRESTCallout {
    private static final String HFS_ACCOUNTS = 'http://getaccounts-jzgj.us-e2.cloudhub.io/accounts';
    private static final String HTTP_METHOD_GET = 'GET';
    public static void getAccounts() {
        Http httpInstance = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(HFS_ACCOUNTS);
        request.setMethod(HTTP_METHOD_GET);
        HttpResponse response = httpInstance.send(request);
        
        System.debug('Status Code: ' + response.getStatusCode() + ', Status: ' + response.getStatus());
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
        } 
    }
}
