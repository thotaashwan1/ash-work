/* Best practicess for writing SOQL and DML - code style 1 */
trigger accountTriggerTest on Account (before insert, before update) {
    
    //Write SOQL and DML outside the forloop and bulkify the code
    list<Id> listIds = new List<Id>();
    for(Account a : Trigger.new)
        listIds.add(a.Id);
    
    List<Contact> listContacts = new List<Contact>();
   // List<Contact> listConts = [SELECT Id, name, salutation, firstname, lastname from Contact where ID IN : listIds];
    for(Contact c: [SELECT Id, name, salutation, firstname, lastname from Contact where ID IN : listIds]){
        c.Description = c.salutation + ' ' + c.firstname + ' ' + c.lastname;
        listContacts.add(c);
    }
    update listContacts;
}