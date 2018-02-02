@isTest
public class ReferralSubmitTest {

    @isTest static void testComponentApex() {
        shane__Referral__c ref = new shane__Referral__c();
        ref.shane__First_Name__c = 'Shane';
        ref.shane__Last_Name__c = 'McLaughlin';
        string serialized = JSON.serialize(ref);

        shane__Referral__c newRef = ReferralSubmit.saveRef(serialized);
        system.assertEquals(newRef, null);

    }

    //trigger test
    @isTest static void testTrigger(){
        shane__Referral__c ref = new shane__Referral__c();
        ref.shane__First_Name__c = 'Shane';
        ref.shane__Last_Name__c = 'McLaughlin';
        ref.Email__c = 'shane.mclaughlin@salesforce.com';
        insert ref;
    }


}