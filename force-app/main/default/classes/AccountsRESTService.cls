@RestResource(urlMapping='/Account/*')
global with sharing class AccountsRESTService {
    @HttpGet
    global static List<Account> getAccounts() {
        String accountName = null;
        RestRequest req = RestContext.request;
        String reqUri = req.requestURI;
        Integer lastIndexOfSlash = req.requestURI.lastIndexOf('/');
        if (reqUri.length() > lastIndexOfSlash + 1) {
            accountName = reqUri.substring(lastIndexOfSlash + 1);
        }

        if (accountName != null) {
            return ([select id, name, type from Account where name = :accountName limit 1]);
        } else {
            return ([select id, name, type from Account limit 10]);
        } 
    }
}
