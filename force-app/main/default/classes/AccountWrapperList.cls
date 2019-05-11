public with sharing class AccountWrapperList {

        public List<WrapperAccounts> wrpList{get;set;}
        public List<Account> act{get;set;}
        public List<Contact> cont{get;set;}
        public Map<Id, List<Contact>> mapActContList{get; set;}

        
        public AccountWrapperList() {
                act = new List<Account>([select id, name, industry, phone, type, (select Id, name, email, phone, Department,Birthdate, AccountId from Contacts) from Account]);
                system.debug('List of Accounts: '+act);
            //    cont = new List<Contact>([select id, name, email, phone, Department,Birthdate, AccountId from Contact where Contact.Account.id IN :act]);
                wrpList = new List<WrapperAccounts>();
                mapActContList = new Map<Id, List<Contact>>();
                
                for(Account a : act){
                    if(a.Contacts != null && !(a.Contacts.isEmpty()) ){
                        if(mapActContList.get(a.Id) == null){
                            List<Contact> lc = new List<Contact>();
                            for(Contact c: a.Contacts){
                                lc.add(c);
                            }
                            mapActContList.put(a.Id, lc);
                        }
                        else {
                            List<Contact> lc = mapActContList.get(a.Id);
                            for(Contact c: a.Contacts){
                                lc.add(c);
                            }
                            mapActContList.put(a.id, lc);
                        }
                    }
                }
                Integer actSize = mapActContList.size();
                for(integer i=0; i<actSize; i++)
                {
                        boolean chbox = false;
                      //  List<Contact> c = mapActContList.get(act[i].Id);
                        wrpList.add(new WrapperAccounts(chbox, string.valueof(i+1), act[i], mapActContList.get(act[i].Id) ));     
                }
        }


        public class WrapperAccounts{
                public string sno{get;set;}
                public boolean checkbox{get;set;}
                public Account accList{get;set;}
                public List<Contact> con{get;set;}
                

                public WrapperAccounts(){

                }

                public WrapperAccounts(boolean b,string s, Account a, List<Contact> c){
                        this.sno = s;
                        this.checkbox = b;
                        this.accList = a;
                        this.con = c;
                        
                }

                public WrapperAccounts(string s, Account a){
                        this.sno = s;
                        this.checkbox = false;
                        this.accList = a;
                }


        }
}