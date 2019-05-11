public class AccountWrapJSON {
   // public List<AccountWrap> AccountWrapDes = new List<AccountWrap> ();
    
    public AccountWrapJSON(){
        prepareData();
    }
    
    public Class AccountWrap{
        public String AccountName{get;set;}
        public String AccountPhone{get;set;}
        public String Id{get;set;}
        public String BillingCity{get;set;}
        public String AccountIndustry{get;set;}
    }
    
    public List<AccountWrap> lstAccountWrap = new List<AccountWrap>();

    public void prepareData(){
    for(Account objAcc:[select id,name,Billingcity,phone,Industry from account limit 5]){
        AccountWrap objAccWrp = new AccountWrap();
        objAccWrp.AccountName = objAcc.name;
        objAccWrp.id = objAcc.id;
        objAccWrp.BillingCity = objAcc.Billingcity;
        objAccWrp.AccountPhone = objAcc.phone;
        objAccWrp.AccountIndustry = objAcc.Industry;
        lstAccountWrap.add(objAccWrp);
    }
    system.debug('**lstAccountWrap**'+lstAccountWrap);
    String JSONString = JSON.Serialize(lstAccountWrap);
    system.debug('**JSONString**'+JSONString);
    List<AccountWrap> AccountWrapDes = (List<AccountWrap>)JSON.deserialize(JSONString, List<AccountWrap>.class);
    system.debug('**AccountWrapDes**'+AccountWrapDes);
   }
}