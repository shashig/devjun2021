public with sharing class CreateTeamData {
    public static void createData() {
        Project_Team__c project = new Project_Team__c(Name = 'M1');
        insert (project);

        List<Project_Team_Member__c> teamMembers = new List<Project_Team_Member__c>();
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Ram', Project_Team__c = project.Id
        ));
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Rahim', Project_Team__c = project.Id
        ));
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Rosy', Project_Team__c = project.Id
        ));
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Roshan', Project_Team__c = project.Id
        ));
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Ramitha', Project_Team__c = project.Id
        ));
        teamMembers.add(new Project_Team_Member__c(
            Name = 'Rupinder', Project_Team__c = project.Id
        ));

        insert(teamMembers);
    }
}
