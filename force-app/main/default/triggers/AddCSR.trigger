trigger AddCSR on Opportunity (before insert) {
    
    //Get the CSR custom setting variables
    CSR_Settings__c settings = CSR_Settings__c.getInstance('CSR100');    
    String CSR_User_ID = settings.CSR_User_ID__c;
    Decimal Opp_Minimum_Value = settings.Opp_Minimum_Value__c;
    
    //Create a Master list for Accounts
    List<Account> accounts = New List<Account>();
    
    FOR(Opportunity opp : Trigger.New){
        IF(opp.Amount >= Opp_Minimum_Value){
            Account acc = New Account();
            acc.Id = opp.AccountId;
            acc.CSR__c = CSR_User_ID;
            
            //Add the CSR to the master Account list
            accounts.add(acc);
        }
        
    }
    update accounts;

}