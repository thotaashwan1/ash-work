trigger updateContacts on Account (After update) {
    
    UpdateContactRecords.updateConts(Trigger.New);
}