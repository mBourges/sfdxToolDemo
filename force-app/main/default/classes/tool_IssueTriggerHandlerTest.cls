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

  static testMethod void constructor_Should() {
    Issue__c actual = null;

    Test.startTest();
    actual = createIssue();
    Test.stopTest();

    System.assertEquals(false, actual.IsClosed__c);
  }
}