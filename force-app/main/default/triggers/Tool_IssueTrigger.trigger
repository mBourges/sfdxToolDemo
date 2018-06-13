trigger Tool_IssueTrigger on Issue__c (
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
) {
  if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    tool_IssueTriggerHandler.tool_IssueTriggerHandler(Trigger.new);
  }
}
