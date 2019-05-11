/* Best practices for writing SOQL and DML coding style 2*/
trigger accountTriggerTest2 on Account (before update) {

    List<Account> accountsWithContacts = [SELECT Id, name, (SELECT ID, name, salutation, description, email, firstname, lastname from contacts)
                                            from Account where Id IN : Trigger.newMap.keyset()];
    
    List<Contact> listConts = new List<Contact>();
    for(Account a : accountsWithContacts){
        for(Contact c : a.contacts){
            c.description = c.salutation + ' ' + c.firstname + ' ' + c.lastname;
            listConts.add(c);
        }
    }
    update listConts;
}