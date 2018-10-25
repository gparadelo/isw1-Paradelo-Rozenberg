!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 18:48:48'!
affectBalance: currentBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:08:07'!
summaryLine

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value duration interest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 21:03:16'!
accept: aVisitor
	aVisitor visitCertificateOfDeposit: self! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:15:37'!
affectBalance: aBalance

	^ aBalance - value! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:24:18'!
duration

	^ duration! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 13:52:04'!
earning

^value*(interest/360)*duration! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:39:54'!
initializeFor: anAmount during: aNumberOfDays at: anInterestRate

	value := anAmount.
	duration := aNumberOfDays.
	interest := anInterestRate. ! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:24:40'!
interest

	^ interest! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:18:04'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:38:12'!
for: anAmount during: aNumberOfDays at: anInterestRate.

	^ self new initializeFor: anAmount during: aNumberOfDays at: anInterestRate ! !

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:32:06'!
register: anAmount during: aNumberOfDays at: anInterestRate on: anAccount

	| certificate |
	
	certificate := self for: anAmount during: aNumberOfDays at: anInterestRate.
	anAccount register: certificate.
		
	^ certificate! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 21:03:00'!
accept: aVisitor
	aVisitor visitDeposit: self! !

!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:00'!
affectBalance: currentBalance

	^currentBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:41'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #TransferLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:34:21'!
affectInvestmentNet: aNet

	^ aNet! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:47:23'!
transfer

	^transfer! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:48:36'!
value

	^ transfer value! !


!classDefinition: #TransferedDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferedDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 21:04:12'!
accept: aVisitor
	aVisitor visitTransferedDeposit: self! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:48:54'!
affectBalance: currentBalance

	^currentBalance + self value! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:02:48'!
initializeFor: aValue withTransfer: aTransfer

	value := aValue .
	transfer := aTransfer.! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:13:28'!
transfer

	^transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferedDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferedDeposit class
	instanceVariableNames: ''!

!TransferedDeposit class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:02:12'!
for: aValue withTransfer: aTransfer

	^ self new initializeFor: aValue withTransfer: aTransfer.! !


!classDefinition: #TransferedWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferedWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 21:04:21'!
accept: aVisitor
	aVisitor visitTransferedWithdraw: self! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:49:25'!
affectBalance: currentBalance

	^currentBalance - self value! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:03:47'!
initializeFor: aValue withTransfer: aTransfer

	value := aValue .
	transfer := aTransfer.! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:13:38'!
transfer

	^transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferedWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferedWithdraw class
	instanceVariableNames: ''!

!TransferedWithdraw class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:03:29'!
for: aValue withTransfer: aTransfer

	^ self new initializeFor: aValue withTransfer: aTransfer.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:08'!
affectBalance: currentBalance

	^currentBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:32:12'!
accept: aVisitor
	aVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountTransactionVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 18:49:21'!
visit
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 21:04:49'!
visitCertificateOfDeposit: aTransaction
self subclassResponsibility 
! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:36'!
visitDeposit: aTransaction
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:26'!
visitTransferedDeposit: aTransaction
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:23'!
visitTransferedWithdraw: aTransaction
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:20'!
visitWithdraw: aTransaction
self subclassResponsibility ! !


!classDefinition: #AccountCertificatesOfDepositEarnings category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountCertificatesOfDepositEarnings
	instanceVariableNames: 'account earning'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:04:00'!
initializeOf: aReceptiveAccount

account := aReceptiveAccount 
! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:31:01'!
value
	earning :=0.
	account visitTransactionsWith: self.
	^earning.
! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:21:39'!
visit: aTransaction

	aTransaction accept: self.
 ! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:29:10'!
visitCertificateOfDeposit: aCertificateOfDeposit
earning := earning +aCertificateOfDeposit earning ! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:25:53'!
visitDeposit: aTransaction
! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:26:00'!
visitTransferedDeposit: aTransaction
! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:26:07'!
visitTransferedWithdraw: aTransaction
! !

!AccountCertificatesOfDepositEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:26:12'!
visitWithdraw: aWithdraw
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountCertificatesOfDepositEarnings class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountCertificatesOfDepositEarnings class
	instanceVariableNames: ''!

!AccountCertificatesOfDepositEarnings class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:01:26'!
Of: aReceptiveAccount
^self new initializeOf: aReceptiveAccount .! !


!classDefinition: #AccountCertificatesOfDepositNet category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountCertificatesOfDepositNet
	instanceVariableNames: 'account net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:04:03'!
initializeOf: aReceptiveAccount

account := aReceptiveAccount 
! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:23:51'!
value
	net:=0.
	account visitTransactionsWith: self.
	^net.
! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:20:54'!
visitCertificateOfDeposit: aCertificateOfDeposit
net :=net + aCertificateOfDeposit value! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:20:28'!
visitDeposit: aTransaction
! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:20:20'!
visitTransferedDeposit: aTransaction
! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:20:12'!
visitTransferedWithdraw: aTransaction
! !

!AccountCertificatesOfDepositNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:19:31'!
visitWithdraw: aWithdraw
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountCertificatesOfDepositNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountCertificatesOfDepositNet class
	instanceVariableNames: ''!

!AccountCertificatesOfDepositNet class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:03:47'!
Of: aReceptiveAccount
^self new initializeOf: aReceptiveAccount .! !


!classDefinition: #AccountSummaryLines category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountSummaryLines
	instanceVariableNames: 'summaryLines account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 10:52:43'!
initializeOf: aReceptiveAccount

account := aReceptiveAccount 
! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:13:14'!
value

	summaryLines := OrderedCollection new.
	account visitTransactionsWith: self.
	^summaryLines .
! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 18:50:32'!
visit: aTransaction

	aTransaction accept: self.
! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:00:19'!
visitCertificateOfDeposit: aCertificateOfDeposit
summaryLines add: 'Plazo fijo por ' , aCertificateOfDeposit value  asString,' durante ',aCertificateOfDeposit duration asString ,' dias a una tna de ', (aCertificateOfDeposit interest * 100) asString ,'%'
! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 11:09:31'!
visitDeposit: aTransaction
 summaryLines add: 'Deposito por ' ,aTransaction value asString.! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 11:09:36'!
visitTransferedDeposit: aTransaction
 summaryLines add: 'Transferencia por ' , aTransaction value asString.! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 14:58:01'!
visitTransferedWithdraw: aTransaction
	 summaryLines add:  'Transferencia por ' , (aTransaction value * -1) asString .! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 11:09:52'!
visitWithdraw: aWithdraw
	 summaryLines add: 'Extraccion por ' , aWithdraw value asString.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryLines class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryLines class
	instanceVariableNames: ''!

!AccountSummaryLines class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:01:29'!
Of: aReceptiveAccount
^self new initializeOf: aReceptiveAccount .! !


!classDefinition: #AccountTransferNet category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountTransferNet
	instanceVariableNames: 'account net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:04:12'!
initializeOf: aReceptiveAccount

account := aReceptiveAccount 
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:17:50'!
value
	net:=0.
	account visitTransactionsWith: self.
	^net.
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 18:50:40'!
visit: aTransaction

	aTransaction accept: self.
 ! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:14:03'!
visitCertificateOfDeposit: aCertificateOfDeposit
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:14:08'!
visitDeposit: aTransaction
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:14:32'!
visitTransferedDeposit: aTransaction
net:=net+ aTransaction value! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:15:33'!
visitTransferedWithdraw: aTransaction
net:=net- aTransaction value! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:15:42'!
visitWithdraw: aWithdraw
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 15:01:20'!
Of: aReceptiveAccount
^self new initializeOf: aReceptiveAccount .
! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 13:03:51'!
doesManageAny: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'GP 10/21/2018 20:31:40'!
investmentNet

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'GP 10/21/2018 17:31:02'!
transferNet

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount doesManage: anAccount) or: [ anAccount doesManage: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 13:09:13'!
doesManageAny: anAccount

	^ accounts anySatisfy: [:account | account doesManageAny: anAccount]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 19:09:05'!
accept: aVisitor
	aVisitor visitPortfolio: self! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 10/18/2018 16:31:24'!
transactionsOf: anAccount 

	^ (self doesManage: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/16/2018 14:56:21'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'GP 10/17/2018 11:40:49'!
initializeAccounts: aCollectionOfAccounts

	self initialize.
	aCollectionOfAccounts do: [ :each | ( self doesManage: each ) ifTrue: [ self error: self class accountAlreadyManagedErrorMessage ] ifFalse: [ accounts add: each ] ]
	! !

!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !

!Portfolio methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 20:09:49'!
visitAccountsDepthFirstOrder: aVisitor

	accounts do: [ :acc |  acc  accept:  aVisitor]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HAW 10/18/2018 16:31:24'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount doesManage: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 13:55:40'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	certificates := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 19:09:47'!
accept: aVisitor
	aVisitor visitReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 10/18/2018 18:49:23'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 13:16:33'!
doesManageAny: anAccount

	^  anAccount doesManage:  self
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 11:06:40'!
visitTransactionsWith: aVisitor

	transactions do: [:aTransaction | aTransaction accept: aVisitor ]
! !


!classDefinition: #SummarizingAccountPrinter category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccountPrinter
	instanceVariableNames: 'lines names depth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccountPrinter methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 19:56:47'!
initializeWith: aListOfNames

	lines := OrderedCollection new.
	names := aListOfNames.
	depth := 0.! !

!SummarizingAccountPrinter methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 19:41:32'!
visit: aSummarizingAccount

	aSummarizingAccount accept: self.
	^ lines! !

!SummarizingAccountPrinter methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 20:35:26'!
visitPortfolio: aPortfolio
	|whiteSpaces|
	whiteSpaces:= (String new: depth) atAllPut: $ .
	lines add: (whiteSpaces , (names at: aPortfolio )).

	depth := depth + 1.
	aPortfolio visitAccountsDepthFirstOrder: self.
	depth := depth - 1! !

!SummarizingAccountPrinter methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 20:26:55'!
visitReceptiveAccount: aReceptiveAccount
	|whiteSpaces|
	whiteSpaces:= (String new: depth) atAllPut: $ .

	lines add: (whiteSpaces , (names at: aReceptiveAccount )).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummarizingAccountPrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountPrinter class
	instanceVariableNames: ''!

!SummarizingAccountPrinter class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/22/2018 19:40:56'!
print: aPortfolio with: aDictionary
	
	| printer |
	
	printer := self new initializeWith: aDictionary.
	^ printer visit: aPortfolio.! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg fromAccount toAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:00:46'!
accountSummaryLinesOf: anAccount! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:04:17'!
depositLeg

	^depositLeg ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:03:06'!
initialize:  anAmount  from: aFromAccount to: aToAccount
	value:=anAmount.
	fromAccount := aFromAccount.
	toAccount:=aToAccount .
	
	depositLeg := TransferedDeposit for: anAmount withTransfer: self.
	aToAccount register: depositLeg.
	
	withdrawLeg := TransferedWithdraw for: anAmount withTransfer: self.
	aFromAccount register: withdrawLeg.
	
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:11:34'!
value

	^ value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:05:08'!
withdrawLeg

	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 19:57:45'!
register: anAmount from: aFromAccount to: aToAccount


	^ self with: anAmount from: aFromAccount to: aToAccount.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 19:28:56'!
with: aValue  from: fromAccount to: toAccount
^self new initialize:  aValue  from: fromAccount to: toAccount! !
