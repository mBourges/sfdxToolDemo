public with sharing class tool_IssueTriggerHandler {
  static public void tool_IssueTriggerHandler(List<Issue__c> issues) {
    for (Issue__c issue : issues) {
      issue.WasClosed__c = hasClosedDate(issue);
    }
  }

  static public Boolean hasClosedDate(Issue__c issue) {
    return issue.ClosedDate__c != null;
  }

  static public Boolean isTrue() {
    return true;
  }
}