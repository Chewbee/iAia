/*
	CSCWorkManagementClient.h
	The interface definition of classes and methods for the WorkManagementClient web service.
	Generated by SudzC.com
*/
				
#import "Soap.h"
	
/* Add class references */
				
#import "CSCObject.h"
#import "CSCAny.h"
#import "CSCFault.h"
#import "CSCArrayOfTax.h"
#import "CSCArrayOfDate.h"
#import "CSCArrayOfLoan.h"
#import "CSCArrayOfProp.h"
#import "CSCArrayOfReal.h"
#import "CSCArrayOfError.h"
#import "CSCArrayOfClause.h"
#import "CSCArrayOfPeriod.h"
#import "CSCArrayOfString.h"
#import "CSCArrayOfBilling.h"
#import "CSCArrayOfMessage.h"
#import "CSCArrayOfPackage.h"
#import "CSCArrayOfBillItem.h"
#import "CSCArrayOfContract.h"
#import "CSCArrayOfCoverage.h"
#import "CSCArrayOfDeathTax.h"
#import "CSCArrayOfFootnote.h"
#import "CSCArrayOfPayPoint.h"
#import "CSCArrayOfOperation.h"
#import "CSCArrayOfPartyRole.h"
#import "CSCArrayOfAllocation.h"
#import "CSCArrayOfCreditCard.h"
#import "CSCArrayOfHealthItem.h"
#import "CSCArrayOfIndexation.h"
#import "CSCArrayOfMembership.h"
#import "CSCArrayOfPreference.h"
#import "CSCArrayOfSettlement.h"
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
#import "CSCArrayOfHealthDomain.h"
#import "CSCArrayOfInsuredGroup.h"
#import "CSCArrayOfPersonDetail.h"
#import "CSCArrayOfPhoneAddress.h"
#import "CSCArrayOfRegistration.h"
#import "CSCArrayOfEmployeeGroup.h"
#import "CSCArrayOfHealthFormula.h"
#import "CSCArrayOfLiabilityItem.h"
#import "CSCArrayOfPostalAddress.h"
#import "CSCArrayOfSavingsScheme.h"
#import "CSCArrayOfSettlementTax.h"
#import "CSCArrayOfSavingsProfile.h"
#import "CSCArrayOfSettlementItem.h"
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
#import "CSCArrayOfHealthBeneficiary.h"
#import "CSCArrayOfHealthFormulaItem.h"
#import "CSCArrayOfNetworkMembership.h"
#import "CSCArrayOfPartyRelationship.h"
#import "CSCArrayOfPremiumAdjustment.h"
#import "CSCArrayOfRegimeObligatoire.h"
#import "CSCArrayOfCoverageMembership.h"
#import "CSCArrayOfInformationRequest.h"
#import "CSCArrayOfOrganizationDetail.h"
#import "CSCArrayOfUnitLinkedFundItem.h"
#import "CSCArrayOfOperationAllocation.h"
#import "CSCArrayOfMedicalTreatmentGroup.h"
#import "CSCArrayOfSettlementBeneficiary.h"
#import "CSCArrayOfHealthConditionalLimit.h"
#import "CSCWMEnv.h"
#import "CSCDeathCoverage.h"
#import "CSCOperationAllocation.h"
#import "CSCDirectDebitMandate.h"
#import "CSCHealthAddressee.h"
#import "CSCNationalHealthOffice.h"
#import "CSCLiabilityRequest.h"
#import "CSCSavingsScheme.h"
#import "CSCFinancialActivity.h"
#import "CSCNote.h"
#import "CSCProductOption.h"
#import "CSCContract.h"
#import "CSCHealthLimit.h"
#import "CSCLoanRepayment.h"
#import "CSCLoanSettlement.h"
#import "CSCSurrender.h"
#import "CSCDuration.h"
#import "CSCInformationRequest.h"
#import "CSCLoan.h"
#import "CSCLoanAccount.h"
#import "CSCCoverageMembership.h"
#import "CSCRegistration.h"
#import "CSCLaunderingControl.h"
#import "CSCPremium.h"
#import "CSCHealthAllocation.h"
#import "CSCDisbursementSplit.h"
#import "CSCPackage.h"
#import "CSCAllocation.h"
#import "CSCHealthCoverageDetail.h"
#import "CSCOrganizationProfile.h"
#import "CSCHealthNetwork.h"
#import "CSCClaimEventPeriod.h"
#import "CSCWMActivity.h"
#import "CSCLoiMadelin.h"
#import "CSCClause.h"
#import "CSCUnitLinkedFund.h"
#import "CSCPremiumAdjustment.h"
#import "CSCDistributorDetail.h"
#import "CSCInterestFundItem.h"
#import "CSCFundsAllocation.h"
#import "CSCInformationReceipt.h"
#import "CSCPartyRelationship.h"
#import "CSCInterestFund.h"
#import "CSCSettlementItem.h"
#import "CSCEMailAddress.h"
#import "CSCMoneyIn.h"
#import "CSCHealthEstimate.h"
#import "CSCSavingsProfile.h"
#import "CSCSettlementBeneficiary.h"
#import "CSCHealthInsurer.h"
#import "CSCHealthBeneficiary.h"
#import "CSCProp.h"
#import "CSCActivityRequest.h"
#import "CSCWriteOffAdjustment.h"
#import "CSCReference.h"
#import "CSCMembership.h"
#import "CSCIdentityDocument.h"
#import "CSCPartyRole.h"
#import "CSCSavingsFlow.h"
#import "CSCTaxSystem.h"
#import "CSCClaimFolder.h"
#import "CSCDirectPaymentCard.h"
#import "CSCFinancialOption.h"
#import "CSCBeneficiary.h"
#import "CSCCreditCard.h"
#import "CSCSettlementFolder.h"
#import "CSCCoverageFund.h"
#import "CSCHealthBenefit.h"
#import "CSCSettlementTax.h"
#import "CSCPhoneAddress.h"
#import "CSCRegimeObligatoire.h"
#import "CSCClaimEvent.h"
#import "CSCPayPoint.h"
#import "CSCWMStatus.h"
#import "CSCMessage.h"
#import "CSCFeesOverride.h"
#import "CSCHealthParty.h"
#import "CSCBankAccount.h"
#import "CSCCoverage.h"
#import "CSCOrganizationDetail.h"
#import "CSCClientProfile.h"
#import "CSCFormulaDfn.h"
#import "CSCVariableDfn.h"
#import "CSCPeriod.h"
#import "CSCLiabilityItem.h"
#import "CSCMemberSituation.h"
#import "CSCPersonDetail.h"
#import "CSCExtensionElement.h"
#import "CSCHealthFormulaItem.h"
#import "CSCHealthConditionalLimit.h"
#import "CSCHealthCondition.h"
#import "CSCValue.h"
#import "CSCWaitingPeriod.h"
#import "CSCPenaltyRate.h"
#import "CSCHealthProfessional.h"
#import "CSCNetworkMembership.h"
#import "CSCCriterion.h"
#import "CSCFootnote.h"
#import "CSCIndicators.h"
#import "CSCOperation.h"
#import "CSCBilling.h"
#import "CSCError.h"
#import "CSCMedicalTreatmentGroup.h"
#import "CSCMedicalTreatment.h"
#import "CSCNetworkActivation.h"
#import "CSCDeathTax.h"
#import "CSCOutputDocument.h"
#import "CSCHealthItem.h"
#import "CSCInsuredGroup.h"
#import "CSCPersonOccupationDetail.h"
#import "CSCEmployeeGroup.h"
#import "CSCSwitch.h"
#import "CSCClaimDeathTax.h"
#import "CSCGeneralConditions.h"
#import "CSCTax.h"
#import "CSCOrganization.h"
#import "CSCPostalAddress.h"
#import "CSCBenefitItem.h"
#import "CSCPreference.h"
#import "CSCMoneyOut.h"
#import "CSCIndexation.h"
#import "CSCHealthInvoice.h"
#import "CSCUnitLinkedFundItem.h"
#import "CSCHealthDomain.h"
#import "CSCTaxes.h"
#import "CSCHealthFormula.h"
#import "CSCBillItem.h"
#import "CSCSettlementPayment.h"
#import "CSCInvoiceItem.h"
#import "CSCSignedStatement.h"
#import "CSCSavingsPool.h"
#import "CSCClaimCause.h"
#import "CSCSettlement.h"
#import "CSCPerson.h"

/* Interface for the service */
				
@interface ServiceGetTariff : SoapService
		
	/* Returns NSMutableArray*.  */
	- (SoapRequest*) CalculationOfPremium: (id <SoapDelegate>) handler Environment: (CSCWMEnv*) Environment FamilyStructure: (NSString*) FamilyStructure State: (NSString*) State BirthDateList: (CSCArrayOfDate*) BirthDateList Contract: (CSCContract*) Contract;
	- (SoapRequest*) CalculationOfPremium: (id) target action: (SEL) action Environment: (CSCWMEnv*) Environment FamilyStructure: (NSString*) FamilyStructure State: (NSString*) State BirthDateList: (CSCArrayOfDate*) BirthDateList Contract: (CSCContract*) Contract;

		
	+ (ServiceGetTariff*) service;
	+ (ServiceGetTariff*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password;
@end
	