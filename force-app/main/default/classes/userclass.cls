public with sharing class userclass {
    public userclass() {
        @future //runs asynchronously
        public static void PermissionSetToUserProfile (Set<Id> userId)
        {
            system.debug('inside future method');
            //finding permission set id
            Permissionset pset= [SELECT Id, Name FROM Permissionset WHERE Name='Marketing_User_Premission'LIMIT 1];
            
            //bulkifying the code use collection
            List<PermissionSetAssignment> newpermission = new List<PermissionSetAssignment>();
            //assign permission set to user records
            for(Id ouserId: userId)
            {
              // Mapping the permission set
              PermissionSetAssignment opsetassign=  new PermissionSetAssignment();
              opsetassign.PermissionSetId = pset.Id;
              opsetassign.AssigneeId = ouserId;
              newpermission.add(opsetassign);
            }
            
            if(newpermission != null)
            {
               insert newpermission; 
            }
            
        }

    }
}