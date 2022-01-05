trigger userupdatetrigger on User (after insert) {
    if(Trigger.isAfter && Trigger.isInsert)
    {
        system.debug('inside after insert');
        Set<Id> userId = new Set<Id>();  //storing Ids
        
        Profile userprofile =[SELECT Id, Name FROM Profile WHERE Name='Custom: Marketing Profile']; //retriving required profile id
        
        for(User user:Trigger.new)
        {
            if(User.ProfileId == userprofile.Id)
            {
                userId.add(user.Id); // adding the ids of the required profile
            }
        }
         
        system.debug('calling future method');
        UserTriggerHelper.PermissionSetToUserProfile(userId);  //inserting permission set to the required profiles  
    }
}