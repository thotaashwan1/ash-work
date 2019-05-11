@isTest
private class AccountHanler_Test {
    
    @isTest static void createNewOpp_Test(){
        
        List<Account> listActs = new List<Account>();
        for(Integer i=0; i<200; i++){
            Account act = new Account(Name = 'Test Account - ' + i);
            listActs.add(act);
        }
        
        Test.StartTest();
        if(listActs.size() > 0)
        insert listActs;
        Test.stopTest();
        
        //Verify Account Records
        List<Account> verifyActs = [SELECT Id, Name from Account];
        system.assertEquals(200, verifyActs.size());
        
        //Verify Opportunit records created
        List<Opportunity> verifyOpps = [SELECT ID, Name from Opportunity];
        system.assertEquals(200, verifyOpps.size());
    }


}