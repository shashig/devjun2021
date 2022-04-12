public with sharing class AttemptQuizController {
    public String recordId {get; set;}
    public AttemptQuizController() {
        recordId  = ApexPages.currentPage().getParameters().get('id');
    }
}
