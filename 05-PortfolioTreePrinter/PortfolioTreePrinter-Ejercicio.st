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


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'GP 10/17/2018 10:57:09'!
addTo: aBalance

	^ self value + aBalance! !

!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:00'!
affectBalance: currentBalance

	^currentBalance + value! !

!Deposit methodsFor: 'value' stamp: 'GP 10/21/2018 17:41:39'!
affectTransferNet: aValue

	^ aValue! !

!Deposit methodsFor: 'value' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:13:43'!
summaryLine

	^ 'Deposito por ' , value asString.! !

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

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:48:54'!
affectBalance: currentBalance

	^currentBalance + self value! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 17:33:41'!
affectTransferNet: aValue

	^ aValue + self value! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:02:48'!
initializeFor: aValue withTransfer: aTransfer

	value := aValue .
	transfer := aTransfer.! !

!TransferedDeposit methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:13:24'!
summaryLine

	^ 'Transferencia por ' , self value asString.! !

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

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:49:25'!
affectBalance: currentBalance

	^currentBalance - self value! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 17:36:17'!
affectTransferNet: aValue

	^ aValue - self value! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 20:03:47'!
initializeFor: aValue withTransfer: aTransfer

	value := aValue .
	transfer := aTransfer.! !

!TransferedWithdraw methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:13:15'!
summaryLine

	^ 'Extraccion por ' , (self value * -1) asString .! !

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


!Withdraw methodsFor: 'value' stamp: 'GP 10/17/2018 10:57:25'!
addTo: aBalance

	^ aBalance - self value! !

!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:08'!
affectBalance: currentBalance

	^currentBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'GP 10/21/2018 17:41:30'!
affectTransferNet: aValue 

	^ aValue
! !

!Withdraw methodsFor: 'value' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:13:33'!
summaryLine

	^ 'Extraccion por ' , value asString.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !

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

!Portfolio methodsFor: 'transactions' stamp: 'GP 10/21/2018 17:31:12'!
transferNet

	^ accounts sum: [ :account | account transferNet ]
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


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


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


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


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

!ReceptiveAccount methodsFor: 'transactions' stamp: 'GP 10/21/2018 17:35:47'!
transferNet

	^ transactions inject: 0 into: [ :net :transaction | transaction affectTransferNet: net ]! !



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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:07:54'!
summaryLines
	^ transactions inject: OrderedCollection new into: [ :balance :transaction | transaction summaryLine]! !


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
