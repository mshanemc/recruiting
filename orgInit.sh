sfdx force:org:create -s -f config/project-scratch-def.json -d 1
sfdx force:source:push

sfdx force:user:permset:assign -n Referrals
sfdx force:data:bulk:upsert -f data/referrals.csv -s shane__Referral__c -i Id

sfdx force:org:open

