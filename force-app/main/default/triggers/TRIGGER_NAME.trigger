trigger TRIGGER_NAME on Account (after insert) {
    
    system.debug('**after insert:**'+Trigger.new);
    system.debug('**after insert:**'+Trigger.old);
    
}