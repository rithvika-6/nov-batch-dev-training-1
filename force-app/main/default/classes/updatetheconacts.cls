public with sharing class updatethecontacts Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        string query ='SELECT Id, Title, Description, Account.Name, Account.Description FROM Contact WHERE AccountId !=null';
        return Database.getQueryLocator(query);
    }
      
    
      public void execute(Database.BatchableContext bc, List<Contact> contacts)
    {
        if(contacts !=null)   
            {
              for(Contact con : contacts)
                  {
                          con.Description = con.Title + ' of ' + con.Account.Name + ' : ' + con.Account.Description;                       
                  }
                update contacts;
            }
       
    }
      
    public void finish(Database.BatchableContext bc)
    {
        //success or failure
    }
  
}
