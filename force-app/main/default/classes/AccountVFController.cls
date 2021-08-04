public class AccountVFController {
    public Account acct {get; set;}
    public String acctSearchParm {get; set;}
    public String errorMessage {get; set;}
    public PageReference search() {
        String searchTerm = '%' + acctSearchParm + '%';
        try {
            acct = [select Name, Id from Account where name like :searchTerm limit 1];
            errorMessage = null;
        } catch (Exception e) {
            errorMessage = e.getMessage();
            acct = null;
        }
        return null;
    }

}