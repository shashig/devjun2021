public with sharing class OauthController {
    String clientId = '3MVG9QDx8IX8nP5Qv7CRDuv.AB.tYlhtmfdfNh6Y.oV8ahe6WO6nyE1odYu7fU6CVOzVIgP51IAovgXCn_mZ0';
    String clientSecret = '1470949522550952369';
    String redirectUri = 'https://hfs-jun21-dev-ed--c.visualforce.com/apex/oauth';
    String tokenEndpoint = 'https://adssotest-dev-ed.my.salesforce.com/services/oauth2/token';
    String salesforceInstance = 'https://adssotest-dev-ed.my.salesforce.com';
    String queryEndpoint = '/services/data/v54.0/query/';
    public String queryResponse {get; set;}
    public String tokenResponse {get; set;}
    public String code {get; set;}
    String accessToken = '00DU0000000HWtX!AQ4AQL40xKk1iqMWzUknWN4OUgdks8OzmYvikgRZBT27bs30av5xf19i5ULwLBEZpy9DBBhQwVb56rUTZfrAEpHecFdQxXcC';
    public OauthController() {
        System.debug('Came into OauthController constructor');
        String code = Apexpages.currentPage().getParameters().get('code');
        if (code != null) {
            this.code = code;
            String postBody = 'grant_type=authorization_code' + 
                '&code=' + code + 
                '&client_id=' + clientId + 
                '&client_secret=' + clientSecret + 
                '&redirect_uri=' + EncodingUtil.urlEncode(redirectUri, 'UTF-8');
            System.debug('>>>>> ' + postBody);
                Http httpInstance = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint(tokenEndpoint);
                request.setMethod('POST');
                request.setBody(postBody); 
                request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                HttpResponse response = httpInstance.send(request);
                
                System.debug('Status Code: ' + response.getStatusCode() + ', Status: ' + response.getStatus());
                if (response.getStatusCode() == 200) {
                    System.debug(response.getBody());
                    tokenResponse = response.getBody();
                } 
        }
    }

    public Pagereference getAccounts() {
        String query = 'select+name,+id+from+Contact';
        Http httpInstance = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(salesforceInstance + queryEndpoint + '?q=' + query);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        HttpResponse response = httpInstance.send(request);
        
        System.debug('Status Code: ' + response.getStatusCode() + ', Status: ' + response.getStatus());
        if (response.getStatusCode() == 200) {
            queryResponse = response.getBody();
            System.debug(response.getBody());
        } 

        return (null);
    }
}