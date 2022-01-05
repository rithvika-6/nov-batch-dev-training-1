global class scheduledBatchable implements schedulable {
    global void execute(schedulableContext sc){
         updatethecontacts b = new updatethecontacts();
        database.executebatch(b);
    }
}
