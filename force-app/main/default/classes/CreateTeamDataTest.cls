@isTest
public with sharing class CreateTeamDataTest {
    static testMethod void testCreateData() {
        CreateTeamData.createData();
        List<Project_Team__c> projects = [select id, name from Project_Team__c];
        System.assertEquals(1, projects.size());
        System.assertEquals('M1', projects[0].Name);

        List<Project_Team_Member__c> teamMembers = [select id, name, Project_Team__r.Name from Project_Team_Member__c];
        System.assertEquals(6, teamMembers.size());
        System.assertEquals('M1', teamMembers[0].Project_Team__r.Name);
    } 
}
