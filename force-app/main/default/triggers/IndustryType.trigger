trigger IndustryType on Account (Before Insert,Before Update) {
    
    
    FOR(Account a : Trigger.New ){
        IF(a.Industry == 'Education')
        a.adderror('Cannot enter record for Education Industry');
    
        
    }
        


}