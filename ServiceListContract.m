/*
	CSCWorkManagementClient.m
	The implementation classes and methods for the WorkManagementClient web service.
	Generated by SudzC.com
*/

#import "serviceListContract.h"
				
#import "Soap.h"
	
#import "CSCObject.h"
#import "CSCFault.h"
#import "CSCArrayOfTax.h"
#import "CSCArrayOfLoan.h"
#import "CSCArrayOfProp.h"
#import "CSCArrayOfError.h"
#import "CSCArrayOfClause.h"
#import "CSCArrayOfDamage.h"
#import "CSCArrayOfLesion.h"
#import "CSCArrayOfPeriod.h"
#import "CSCArrayOfString.h"
#import "CSCArrayOfBilling.h"
#import "CSCArrayOfMessage.h"
#import "CSCArrayOfPackage.h"
#import "CSCArrayOfBillItem.h"
#import "CSCArrayOfContract.h"
#import "CSCArrayOfCoverage.h"
#import "CSCArrayOfDeathTax.h"
#import "CSCArrayOfPayPoint.h"
#import "CSCArrayOfOperation.h"
#import "CSCArrayOfPartyRole.h"
#import "CSCArrayOfAllocation.h"
#import "CSCArrayOfClaimParty.h"
#import "CSCArrayOfCreditCard.h"
#import "CSCArrayOfHealthItem.h"
#import "CSCArrayOfMembership.h"
#import "CSCArrayOfSettlement.h"
#import "CSCArrayOfAfterEffect.h"
#import "CSCArrayOfBankAccount.h"
#import "CSCArrayOfBeneficiary.h"
#import "CSCArrayOfBenefitItem.h"
#import "CSCArrayOfClaimFolder.h"
#import "CSCArrayOfHealthLimit.h"
#import "CSCArrayOfInvoiceItem.h"
#import "CSCArrayOfPenaltyRate.h"
#import "CSCArrayOfSavingsFlow.h"
#import "CSCArrayOfVariableDfn.h"
#import "CSCArrayOfCoverageFund.h"
#import "CSCArrayOfEMailAddress.h"
#import "CSCArrayOfFeesOverride.h"
#import "CSCArrayOfHouseholdTax.h"
#import "CSCArrayOfInsuredGroup.h"
#import "CSCArrayOfPhoneAddress.h"
#import "CSCArrayOfRegistration.h"
#import "CSCArrayOfEmployeeGroup.h"
#import "CSCArrayOfHealthFormula.h"
#import "CSCArrayOfLiabilityItem.h"
#import "CSCArrayOfMedicalReport.h"
#import "CSCArrayOfPostalAddress.h"
#import "CSCArrayOfRelatedFolder.h"
#import "CSCArrayOfSavingsScheme.h"
#import "CSCArrayOfSettlementTax.h"
#import "CSCArrayOfLoanInstalment.h"
#import "CSCArrayOfPersonalIncome.h"
#import "CSCArrayOfQuestionAnswer.h"
#import "CSCArrayOfSavingsProfile.h"
#import "CSCArrayOfSettlementItem.h"
#import "CSCArrayOfWebSiteAddress.h"
#import "CSCArrayOfBankingLoanRole.h"
#import "CSCArrayOfFinancialOption.h"
#import "CSCArrayOfFundsAllocation.h"
#import "CSCArrayOfHealthCondition.h"
#import "CSCArrayOfMemberSituation.h"
#import "CSCArrayOfSignedStatement.h"
#import "CSCArrayOfClaimEventPeriod.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfHealthAllocation.h"
#import "CSCArrayOfIdentityDocument.h"
#import "CSCArrayOfInterestFundItem.h"
#import "CSCArrayOfMedicalTreatment.h"
#import "CSCArrayOfSettlementFolder.h"
#import "CSCArrayOfDisbursementSplit.h"
#import "CSCArrayOfFinancialActivity.h"
#import "CSCArrayOfGeneralConditions.h"
#import "CSCArrayOfHealthFormulaItem.h"
#import "CSCArrayOfNetworkMembership.h"
#import "CSCArrayOfPartyRelationship.h"
#import "CSCArrayOfPremiumAdjustment.h"
#import "CSCArrayOfRegimeObligatoire.h"
#import "CSCArrayOfAcceptanceDecision.h"
#import "CSCArrayOfCoverageMembership.h"
#import "CSCArrayOfExtraPremiumDetail.h"
#import "CSCArrayOfInjuryCompensation.h"
#import "CSCArrayOfUnitLinkedFundItem.h"
#import "CSCArrayOfOperationAllocation.h"
#import "CSCArrayOfMedicalTreatmentGroup.h"
#import "CSCArrayOfSettlementBeneficiary.h"
#import "CSCArrayOfAdditionalClauseDetail.h"
#import "CSCArrayOfHealthConditionalLimit.h"
#import "CSCBankingLoanRole.h"
#import "CSCHealthCoverageDetail.h"
#import "CSCHealthLimit.h"
#import "CSCPersonalIncome.h"
#import "CSCOperationAllocation.h"
#import "CSCNationalHealthOffice.h"
#import "CSCLiabilityRequest.h"
#import "CSCClaimEventPeriod.h"
#import "CSCFinancialActivity.h"
#import "CSCProductOption.h"
#import "CSCHouseholdTax.h"
#import "CSCOrganizationDetail.h"
#import "CSCRegistration.h"
#import "CSCLaunderingControl.h"
#import "CSCLoanAccount.h"
#import "CSCLoan.h"
#import "CSCLoiMadelin.h"
#import "CSCCoverageMembership.h"
#import "CSCQuestionAnswer.h"
#import "CSCOrganizationProfile.h"
#import "CSCAllocation.h"
#import "CSCHealthAllocation.h"
#import "CSCInjuryCompensation.h"
#import "CSCDisbursementSplit.h"
#import "CSCDistributorDetail.h"
#import "CSCFundsAllocation.h"
#import "CSCSettlementPayment.h"
#import "CSCHealthNetwork.h"
#import "CSCMedicalFolder.h"
#import "CSCClause.h"
#import "CSCPartyRelationship.h"
#import "CSCBillItem.h"
#import "CSCMoneyIn.h"
#import "CSCMedicalReport.h"
#import "CSCVehicleDamage.h"
#import "CSCUnitLinkedFund.h"
#import "CSCWebSiteAddress.h"
#import "CSCInterestFundItem.h"
#import "CSCHealthEstimate.h"
#import "CSCSavingsProfile.h"
#import "CSCAcceptanceDecision.h"
#import "CSCPremiumAdjustment.h"
#import "CSCEMailAddress.h"
#import "CSCInterestFund.h"
#import "CSCSettlementItem.h"
#import "CSCSettlementBeneficiary.h"
#import "CSCExtraPremiumDetail.h"
#import "CSCPersonDetail.h"
#import "CSCSavingsFlow.h"
#import "CSCLoss.h"
#import "CSCTaxSystem.h"
#import "CSCProp.h"
#import "CSCWriteOffAdjustment.h"
#import "CSCMembership.h"
#import "CSCPartyRole.h"
#import "CSCIdentityDocument.h"
#import "CSCAutoLoss.h"
#import "CSCFinancialOption.h"
#import "CSCPayPoint.h"
#import "CSCFeesOverride.h"
#import "CSCCreditCard.h"
#import "CSCBeneficiary.h"
#import "CSCHealthBenefit.h"
#import "CSCBankingLoan.h"
#import "CSCCoverageFund.h"
#import "CSCPhoneAddress.h"
#import "CSCRegimeObligatoire.h"
#import "CSCSettlementFolder.h"
#import "CSCSettlementTax.h"
#import "CSCBankAccount.h"
#import "CSCHealthParty.h"
#import "CSCClaimFolder.h"
#import "CSCClaimParty.h"
#import "CSCWMStatus.h"
#import "CSCExtensionElement.h"
#import "CSCClientProfile.h"
#import "CSCVariableDfn.h"
#import "CSCMessage.h"
#import "CSCCoverage.h"
#import "CSCHealthFormulaItem.h"
#import "CSCFormulaDfn.h"
#import "CSCPeriod.h"
#import "CSCLiabilityItem.h"
#import "CSCAfterEffect.h"
#import "CSCVehicleUsage.h"
#import "CSCAdditionalClauseDetail.h"
#import "CSCPostalAddress.h"
#import "CSCClaimEvent.h"
#import "CSCClaimVictim.h"
#import "CSCMemberSituation.h"
#import "CSCError.h"
#import "CSCHealthConditionalLimit.h"
#import "CSCHealthCondition.h"
#import "CSCValue.h"
#import "CSCMedicalTreatment.h"
#import "CSCWaitingPeriod.h"
#import "CSCMedicalQuestionnaire.h"
#import "CSCPenaltyRate.h"
#import "CSCRecourseRecovery.h"
#import "CSCHealthProfessional.h"
#import "CSCNetworkMembership.h"
#import "CSCLesion.h"
#import "CSCRelatedFolder.h"
#import "CSCClaimReserve.h"
#import "CSCSwitch.h"
#import "CSCIndicators.h"
#import "CSCBilling.h"
#import "CSCOperation.h"
#import "CSCHealthItem.h"
#import "CSCMedicalTreatmentGroup.h"
#import "CSCNetworkActivation.h"
#import "CSCDebt.h"
#import "CSCExpert.h"
#import "CSCLegalParty.h"
#import "CSCRepairer.h"
#import "CSCInsuredRisk.h"
#import "CSCDamage.h"
#import "CSCInsuranceCertificate.h"
#import "CSCDriver.h"
#import "CSCDeathTax.h"
#import "CSCOrganization.h"
#import "CSCBenefitItem.h"
#import "CSCDeathCoverage.h"
#import "CSCIndexation.h"
#import "CSCInsuredGroup.h"
#import "CSCPersonOccupationDetail.h"
#import "CSCEmployeeGroup.h"
#import "CSCMoneyOut.h"
#import "CSCTechnicalOperation.h"
#import "CSCClaimDeathTax.h"
#import "CSCInsurer.h"
#import "CSCSurrender.h"
#import "CSCGeneralConditions.h"
#import "CSCTax.h"
#import "CSCLoanInstalment.h"
#import "CSCLoanRepayment.h"
#import "CSCLoanSettlement.h"
#import "CSCHealthInvoice.h"
#import "CSCBuildingLoss.h"
#import "CSCUnitLinkedFundItem.h"
#import "CSCDuration.h"
#import "CSCTaxes.h"
#import "CSCPerson.h"
#import "CSCWMEnv.h"
#import "CSCHealthFormula.h"
#import "CSCDirectDebitMandate.h"
#import "CSCPremium.h"
#import "CSCHealthAddressee.h"
#import "CSCInvoiceItem.h"
#import "CSCSignedStatement.h"
#import "CSCClaimCause.h"
#import "CSCSettlement.h"
#import "CSCSavingsPool.h"
#import "CSCSavingsScheme.h"
#import "CSCPackage.h"
#import "CSCContract.h"

/* Implementation of the service */
				
@implementation serviceListContract

	- (id) init
	{
		if(self = [super init])
		{
			// @"http://ec2-46-137-35-33.eu-west-1.compute.amazonaws.com:8080";
            //
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
            NSString *theService = [[NSMutableString alloc] initWithString:@"http://"] ;
            theService =[theService stringByAppendingString: [defaults stringForKey:@"server" ]];
            theService = [theService stringByAppendingString:@".compute.amazonaws.com:8080" ];

            self.serviceUrl = theService;
			self.namespace = @"http://www.csc.com/graphtalk/aia/";
			self.headers = nil;
			self.logging = NO;
		}
		return self;
	}
	
	- (id) initWithUsername: (NSString*) username andPassword: (NSString*) password {
		if(self = [super initWithUsername:username andPassword:password]) {
		}
		return self;
	}
	
	+ (serviceListContract*) service {
		return [serviceListContract serviceWithUsername:nil andPassword:nil];
	}
	
	+ (serviceListContract*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password {
		return [[serviceListContract alloc] initWithUsername:username andPassword:password];
	}

		
	/* Returns NSMutableArray*.  */
	- (SoapRequest*) ContractDisplayExtract: (id <SoapDelegate>) handler Environment: (CSCWMEnv*) Environment Contract: (CSCContract*) Contract
	{
		return [self ContractDisplayExtract: handler action: nil Environment: Environment Contract: Contract];
	}

	- (SoapRequest*) ContractDisplayExtract: (id) _target action: (SEL) _action Environment: (CSCWMEnv*) Environment Contract: (CSCContract*) Contract
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: Environment forName: @"Environment"]];
		[_params addObject: [[SoapParameter alloc] initWithValue: Contract forName: @"Contract"]];
		NSString* _envelope = [Soap createEnvelope: @"ContractDisplayExtract" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"ContractDisplayExtract" postData: _envelope deserializeTo: [CSCArrayOfContract alloc]];
		[_request send];
		return _request;
	}


@end
	