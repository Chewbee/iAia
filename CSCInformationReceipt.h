/*
	CSCInformationReceipt.h
	The interface definition of properties and methods for the CSCInformationReceipt object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfInformationRequest;
@class CSCOrganization;
@class CSCPerson;
@class CSCOrganization;
@class CSCPerson;
#import "CSCObject.h"
@class CSCObject;


@interface CSCInformationReceipt : CSCObject
{
	CSCObject* _BusinessObject;
	NSString* _Channel;
	NSString* _ChannelLabel;
	NSString* _EdmsIdentifier;
	NSString* _EdmsType;
	NSString* _Identifier;
	NSMutableArray* _InformationRequestList;
	CSCOrganization* _Organization;
	CSCPerson* _Person;
	NSDate* _ReceivedDate;
	NSDate* _ReceivedTime;
	CSCOrganization* _SenderOrganization;
	CSCPerson* _SenderPerson;
	NSString* _Type;
	NSString* _TypeLabel;
	
}
		
	@property (retain, nonatomic) CSCObject* BusinessObject;
	@property (retain, nonatomic) NSString* Channel;
	@property (retain, nonatomic) NSString* ChannelLabel;
	@property (retain, nonatomic) NSString* EdmsIdentifier;
	@property (retain, nonatomic) NSString* EdmsType;
	@property (retain, nonatomic) NSString* Identifier;
	@property (retain, nonatomic) NSMutableArray* InformationRequestList;
	@property (retain, nonatomic) CSCOrganization* Organization;
	@property (retain, nonatomic) CSCPerson* Person;
	@property (retain, nonatomic) NSDate* ReceivedDate;
	@property (retain, nonatomic) NSDate* ReceivedTime;
	@property (retain, nonatomic) CSCOrganization* SenderOrganization;
	@property (retain, nonatomic) CSCPerson* SenderPerson;
	@property (retain, nonatomic) NSString* Type;
	@property (retain, nonatomic) NSString* TypeLabel;

	+ (CSCInformationReceipt*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
