trigger AccountAddressTrigger on Account (before insert, before update) {
    
    for(Account a : Trigger.new){
     //  if(a.BillingPostalCode != null && a.){
            a.ShippingPostalCode = a.BillingPostalCode;
   //    }
        
    }

}