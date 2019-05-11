trigger FirstTrigger on Account (Before Insert, Before Update, After Insert, After Update) {

    if(Trigger.isBefore){
        System.debug('**isBefore:**');
        if(Trigger.isInsert){
            system.debug('**Is Insert?**');
            system.debug('**Trigger New**'+Trigger.new);
            system.debug('**Trigger Old**'+Trigger.old);
            system.debug('**Trigger newMap**'+Trigger.newMap);
            system.debug('**Trigger oldMap**'+Trigger.oldMap);
        }
        if(Trigger.isUPdate){
            system.debug('**Is Update?**');
            system.debug('**Trigger New**'+Trigger.new);
            system.debug('**Trigger Old**'+Trigger.old);
            system.debug('**Trigger newMap**'+Trigger.newMap);
            system.debug('**Trigger oldMap**'+Trigger.oldMap);
        }
    }
    if(Trigger.isAfter){
        System.debug('**isAfter:**');
        if(Trigger.isInsert){
            system.debug('**Is Insert?**');
            system.debug('**Trigger New**'+Trigger.new);
            system.debug('**Trigger Old**'+Trigger.old);
            system.debug('**Trigger newMap**'+Trigger.newMap);
            system.debug('**Trigger oldMap**'+Trigger.oldMap);
        }
        if(Trigger.isUPdate){
            system.debug('**Is Update?**');
            system.debug('**Trigger New**'+Trigger.new);
            system.debug('**Trigger Old**'+Trigger.old);
            system.debug('**Trigger newMap**'+Trigger.newMap);
            system.debug('**Trigger oldMap**'+Trigger.oldMap);
        }
    }
    
    
    

}