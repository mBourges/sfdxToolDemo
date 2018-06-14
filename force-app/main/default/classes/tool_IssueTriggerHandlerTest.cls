@IsTest
public with sharing class tool_IssueTriggerHandlerTest {
  private static Issue__c createIssue() {
    Issue__c issue = new Issue__c(
      Subject__c = 'Test',
      Description__c = 'This is a test.'
    );

    insert issue;

    return issue;
  }

  @testSetup
  static void setup() {
    createIssue();
  }

  static testMethod void constructor_ShouldBeFalseOnCreation() {
    Issue__c actual = null;

    Test.startTest();
    actual = createIssue();
    Test.stopTest();

    System.assertEquals(false, actual.WasClosed__c);
  }

  static testMethod void constructor_ShouldFail() {
    Issue__c issue = [Select Id, ClosedDate__c From Issue__c Limit 1];

    Test.startTest();
    issue.ClosedDate__c = Date.today();
    Test.stopTest();

    System.assertEquals(true, issue.WasClosed__c);
  }
}