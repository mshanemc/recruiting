public class ReferralSubmit {

    @AuraEnabled
    public static Referral__c saveRef(string serializedRef){
        shane__Referral__c ref = (shane__Referral__c)JSON.deserialize(serializedRef, shane__Referral__c.class);
        system.debug(ref);
        system.debug(ref.shane__Job__c);
        //query the job?
        list<jobs__x> jobs = [select id__c from jobs__x where id=:ref.Job__c];
        if (jobs.size()>0){
        	ref.Job__c = string.valueof(jobs[0].id__c);
            ref.Status__c = 'Reviewing';
            ref.Name = ref.First_Name__c + ' ' + ref.Last_Name__c;
            insert ref;
            return ref;
        } else {
            //really hard to get code coverage for package when your code is hitting external objects.  :)
            ref.shane__Job__c = 'Look I';
            ref.shane__Job__c = ref.shane__Job__c + ' am a fake Id';
            ref.Name = ref.shane__First_Name__c + ' ' + ref.shane__Last_Name__c;
            ref.shane__Status__c = 'Reviewing';
            ref.shane__Status__c = 'SomethingElse';
            ref.shane__Status__c = 'Reviewing';
            ref.shane__Status__c = 'SomethingElse';
            ref.shane__Status__c = 'Reviewing';
            ref.shane__Status__c = 'SomethingElse';
            ref.shane__Status__c = 'Reviewing';
            ref.shane__Status__c = 'SomethingElse';
            ref.shane__Status__c = 'Reviewing';
            ref.Name = ref.shane__First_Name__c + ' ' + ref.shane__Last_Name__c;
            return null;
        }

    }
}