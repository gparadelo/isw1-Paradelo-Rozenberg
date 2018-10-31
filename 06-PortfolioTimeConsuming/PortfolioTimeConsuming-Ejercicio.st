!classDefinition: #AccountSummaryWithAllInvestmentInformation category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #AccountSummaryWithAllInvestmentInformation
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountSummaryWithAllInvestmentInformation methodsFor: 'initialization' stamp: 'HernanWilkinson 7/17/2011 23:56'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount ! !


!AccountSummaryWithAllInvestmentInformation methodsFor: 'evaluating' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:35:00'!
lines 

	| lines investmentEarnings  semaphore earnings|
	semaphore := Semaphore new.
	[	investmentEarnings := InvestmentNetVisitor for: account.
		earnings:=investmentEarnings value.
		semaphore signal.
	] fork.

	lines := (AccountSummaryWithInvestmentEarnings for: account) lines.
	semaphore wait.
	lines add: 'Inversiones por ', earnings printString.
	
	 ^ lines
	
	
! !


!AccountSummaryWithAllInvestmentInformation methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:11:02'!
forkAndSendSemaphore: aClosureToFork
	|semaphore|
	semaphore := Semaphore new.
	[	aClosureToFork value.
		semaphore signal.
	] fork.
   ^semaphore! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryWithAllInvestmentInformation class' category: #'PortfolioTimeConsuming-Ejercicio'!
AccountSummaryWithAllInvestmentInformation class
	instanceVariableNames: ''!

!AccountSummaryWithAllInvestmentInformation class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/17/2011 23:56'!
for: aReceptiveAccount 

	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountSummaryWithInvestmentEarnings category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #AccountSummaryWithInvestmentEarnings
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountSummaryWithInvestmentEarnings methodsFor: 'initialization' stamp: 'HernanWilkinson 7/17/2011 23:52'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount ! !


!AccountSummaryWithInvestmentEarnings methodsFor: 'evaluating' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:57:04'!
lines 

	| lines investmentEarnings   earnings  paralelClosure |
	paralelClosure:= ParalelClosureValuer with:[investmentEarnings := InvestmentEarningVisitor for: account. earnings:=investmentEarnings value.].
	lines := (AccountSummary for: account) lines.
	paralelClosure join
	lines add: 'Ganancias por ',earnings value printString.
	 ^ lines! !


!AccountSummaryWithInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:11:19'!
forkAndSendSemaphore: aClosureToFork
	|semaphore|
	semaphore := Semaphore new.
	[	aClosureToFork value.
		semaphore signal.
	] fork.
   ^semaphore! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryWithInvestmentEarnings class' category: #'PortfolioTimeConsuming-Ejercicio'!
AccountSummaryWithInvestmentEarnings class
	instanceVariableNames: ''!

!AccountSummaryWithInvestmentEarnings class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/17/2011 23:51'!
for: aReceptiveAccount 

	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTransaction category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:20:37'!
affectBalance: currentBalance  

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:08:07'!
summaryLine

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !



!AccountTransaction methodsFor: 'visiting' stamp: 'HAW 5/15/2018 07:23:29'!
accept: anAccountTransactionVisitor

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:06:37'!
for: anAmount

	self subclassResponsibility ! !


!AccountTransaction class methodsFor: 'registering' stamp: 'HAW 10/18/2018 19:48:18'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

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



!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HernanWilkinson 7/14/2011 06:23'!
days
	
	^numberOfDays ! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HernanWilkinson 7/14/2011 05:14'!
earnings

	^ value*(tna/360)*numberOfDays
	! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HernanWilkinson 7/14/2011 06:24'!
tna
	^ tna! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HernanWilkinson 7/14/2011 06:13'!
value

	^ value! !


!CertificateOfDeposit methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
accept: aTransactionVisitor

	^ aTransactionVisitor visitCertificateOfDeposit: self! !


!CertificateOfDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 05:16'!
initializeFor: aValue during: aNumberOfDay at: aTNA on: anAccount

	value := aValue.
	numberOfDays := aNumberOfDay.
	tna := aTNA.
	account := anAccount ! !


!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'HAW 10/24/2018 12:41:35'!
affectBalance: currentBalance

	^currentBalance - self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTimeConsuming-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:38:12'!
for: anAmount during: aNumberOfDays at: anInterestRate.

	^ self new initializeFor: anAmount during: aNumberOfDays at: anInterestRate ! !


!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:12'!
for: aValue during: aNumberOfDay at: aTNA on: anAccount

	^ self new initializeFor: aValue during: aNumberOfDay at: aTNA on: anAccount! !

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:09'!
register: aValue during: aNumberOfDay at: aTNA on: anAccount

	| certificateOfDeposit |
	
	certificateOfDeposit := self for: aValue during: aNumberOfDay at: aTNA on: anAccount.
	anAccount register: certificateOfDeposit.
	
	^ certificateOfDeposit   ! !


!classDefinition: #Deposit category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 20:37:28'!
affectBalance: currentBalance  

	^currentBalance + self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !



!Deposit methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
accept: aTransactionVisitor

	^ aTransactionVisitor visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTimeConsuming-Ejercicio'!
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


!classDefinition: #TransferLeg category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'GP 10/21/2018 20:34:21'!
affectInvestmentNet: aNet

	^ aNet! !


!TransferLeg methodsFor: 'transfer' stamp: 'HAW 10/18/2018 21:05:34'!
transfer

	^transfer ! !


!TransferLeg methodsFor: 'initialization' stamp: 'HAW 10/18/2018 21:07:15'!
initializeRelatedTo: aTransfer 
	
	transfer := aTransfer ! !


!TransferLeg methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:35:56'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'PortfolioTimeConsuming-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:07:07'!
relatedTo: aTransfer 
	
	^self new initializeRelatedTo: aTransfer ! !


!classDefinition: #TransferDeposit category: #'PortfolioTimeConsuming-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!TransferDeposit methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:34:58'!
affectBalance: currentBalance

	^currentBalance + self value! !


!TransferDeposit methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
accept: aTransactionVisitor

	 ^ aTransactionVisitor visitTransferDeposit: self! !


!classDefinition: #TransferWithdraw category: #'PortfolioTimeConsuming-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!TransferWithdraw methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:34:40'!
affectBalance: currentBalance

	^currentBalance - self value! !


!TransferWithdraw methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
accept: aTransactionVisitor

	 ^ aTransactionVisitor visitTransferWithdraw: self! !


!classDefinition: #Withdraw category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 20:36:35'!
affectBalance: currentBalance  

	^currentBalance - self value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !



!Withdraw methodsFor: 'visiting' stamp: 'HAW 10/24/2018 12:40:17'!
accept: anAccountTransactionVisitor

	anAccountTransactionVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTimeConsuming-Ejercicio'!
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


!classDefinition: #AccountTransactionVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 18:49:21'!
visit
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:26'!
visitTransferedDeposit: aTransaction
self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/24/2018 19:54:23'!
visitTransferedWithdraw: aTransaction
self subclassResponsibility ! !


!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:54'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:54'!
visitDeposit: aDeposit  
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:56'!
visitTransferDeposit: aTransferDeposit  
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:56'!
visitTransferWithdraw: aTransferWithdraw 
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:55'!
visitWithdraw: aWithdraw 
	
	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransactionVisitor subclass: #AccountSummary
	instanceVariableNames: 'account lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountSummary methodsFor: 'visiting' stamp: 'HAW 8/13/2017 17:57:33'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	lines add: 
		'Plazo fijo por ', aCertificateOfDeposit value printString, 
		' durante ', aCertificateOfDeposit days printString, 
		' dias a una tna de ', (aCertificateOfDeposit tna * 100) printString, '%'! !

!AccountSummary methodsFor: 'visiting' stamp: 'HAW 8/13/2017 17:57:37'!
visitDeposit: aDeposit 
	
	lines add: 'Deposito por ', aDeposit value printString ! !

!AccountSummary methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:56'!
visitTransferDeposit: aTransferDeposit 
	
	^ lines add: 'Transferencia por ', aTransferDeposit value  printString ! !

!AccountSummary methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferWithdraw: aTransferWithdraw 
	
	^ lines add: 'Transferencia por ', aTransferWithdraw value negated printString ! !

!AccountSummary methodsFor: 'visiting' stamp: 'HAW 8/13/2017 17:57:45'!
visitWithdraw: aWithdraw 

	lines add: 'Extraccion por ', aWithdraw value printString ! !


!AccountSummary methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/17/2011 23:59'!
lines
	
	(Delay forSeconds: 1) wait.
	
	lines := OrderedCollection new.
	
	account visitTransactionsWith: self.
	
	^ lines! !


!AccountSummary methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 05:41'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'PortfolioTimeConsuming-Ejercicio'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:40'!
for: aReceptiveAccount 

	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTransferNetVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransactionVisitor subclass: #AccountTransferNetVisitor
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!AccountTransferNetVisitor methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:07'!
value 

	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !


!AccountTransferNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	! !

!AccountTransferNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitDeposit: aDeposit 
	
	! !

!AccountTransferNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferDeposit: aTransferDeposit 

	value := value + aTransferDeposit value! !

!AccountTransferNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferWithdraw: aTransferWithdraw 
	
	value := value - aTransferWithdraw value! !

!AccountTransferNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:55'!
visitWithdraw: aWithdraw 
	
	! !


!AccountTransferNetVisitor methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 06:04'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNetVisitor class' category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransferNetVisitor class
	instanceVariableNames: ''!

!AccountTransferNetVisitor class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:04'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount   ! !


!classDefinition: #BalanceVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransactionVisitor subclass: #BalanceVisitor
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!BalanceVisitor methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 05:59'!
value 

	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value! !


!BalanceVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	value := value - aCertificateOfDeposit value! !

!BalanceVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitDeposit: aDeposit 
	
	^ value := value + aDeposit value! !

!BalanceVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferDeposit: aTransferDeposit 
	
	value := value + aTransferDeposit value! !

!BalanceVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferWithdraw: aTransferWithdraw 
	
	value := value - aTransferWithdraw value! !

!BalanceVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:55'!
visitWithdraw: aWithdraw 
	
	value := value - aWithdraw value! !


!BalanceVisitor methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 05:58'!
initializeOf: aReceptiveAccount 
	
	account := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BalanceVisitor class' category: #'PortfolioTimeConsuming-Ejercicio'!
BalanceVisitor class
	instanceVariableNames: ''!

!BalanceVisitor class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:58'!
of: aReceptiveAccount 

	^ self new initializeOf: aReceptiveAccount ! !


!classDefinition: #InvestmentEarningVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransactionVisitor subclass: #InvestmentEarningVisitor
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!InvestmentEarningVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	value := value + aCertificateOfDeposit earnings ! !

!InvestmentEarningVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:56'!
visitDeposit: aDeposit  ! !

!InvestmentEarningVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:57'!
visitTransferDeposit: aTransferDeposit    ! !

!InvestmentEarningVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:57'!
visitTransferWithdraw: aTransferWithdraw      ! !

!InvestmentEarningVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:57'!
visitWithdraw: aWithdraw  ! !


!InvestmentEarningVisitor methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/18/2011 00:00'!
value

	(Delay forSeconds: 1) wait.
	
	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !


!InvestmentEarningVisitor methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 06:17'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarningVisitor class' category: #'PortfolioTimeConsuming-Ejercicio'!
InvestmentEarningVisitor class
	instanceVariableNames: ''!

!InvestmentEarningVisitor class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:17'!
for: aReceptiveAccount 
	
	^ self new initializeFor: aReceptiveAccount   ! !


!classDefinition: #InvestmentNetVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
AccountTransactionVisitor subclass: #InvestmentNetVisitor
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!InvestmentNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitCertificateOfDeposit: aCertificateOfDeposit 
	
	value := value + aCertificateOfDeposit value! !

!InvestmentNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitDeposit: aDeposit 
	! !

!InvestmentNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:57'!
visitTransferDeposit: aTransferDeposit  ! !

!InvestmentNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:53'!
visitTransferWithdraw: aTransferWithdraw 
	! !

!InvestmentNetVisitor methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:55'!
visitWithdraw: aWithdraw 
	! !


!InvestmentNetVisitor methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/18/2011 00:00'!
value

	(Delay forSeconds: 1) wait.
	
	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !


!InvestmentNetVisitor methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 06:11'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentNetVisitor class' category: #'PortfolioTimeConsuming-Ejercicio'!
InvestmentNetVisitor class
	instanceVariableNames: ''!

!InvestmentNetVisitor class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:11'!
for: aReceptiveAccount 
	
	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #ParalelClosureValuer category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #ParalelClosureValuer
	instanceVariableNames: 'semaphore'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!ParalelClosureValuer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:56:34'!
initializeWith: aClosureToRun
	semaphore:= Semaphore new.
	[
		aClosureToRun value.
		semaphore signal	
	] fork.! !

!ParalelClosureValuer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 22:00:04'!
join
semaphore wait! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ParalelClosureValuer class' category: #'PortfolioTimeConsuming-Ejercicio'!
ParalelClosureValuer class
	instanceVariableNames: ''!

!ParalelClosureValuer class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/25/2018 21:54:11'!
with: aClosureToRun
^self new initializeWith: aClosureToRun ! !


!classDefinition: #ReversePortfolioTreePrinter category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #ReversePortfolioTreePrinter
	instanceVariableNames: 'portfolio accountNames'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!ReversePortfolioTreePrinter methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
lines
	
	^ (PortfolioTreePrinter of: portfolio namingAccountsWith: accountNames) lines reverse! !


!ReversePortfolioTreePrinter methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 06:47'!
initializeOf: aPortfolio namingAccountsWith: aDictionary 
	
	portfolio := aPortfolio.
	accountNames := aDictionary ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReversePortfolioTreePrinter class' category: #'PortfolioTimeConsuming-Ejercicio'!
ReversePortfolioTreePrinter class
	instanceVariableNames: ''!

!ReversePortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:47'!
of: aPortfolio namingAccountsWith: aDictionary 
	
	^ self new initializeOf: aPortfolio namingAccountsWith: aDictionary 
	! !


!classDefinition: #SummarizingAccount category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

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


!SummarizingAccount methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 07:00'!
accept: aSummarizingAccountVisitor

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTimeConsuming-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

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


!Portfolio methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:35'!
accept: aSummarizingAccountVisitor

	^ aSummarizingAccountVisitor visitPortfolio: self ! !

!Portfolio methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:36'!
visitAccountsWith: aPortfolioTreePrinter 
	
	accounts do: [ :anAccount | anAccount accept: aPortfolioTreePrinter ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTimeConsuming-Ejercicio'!
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


!classDefinition: #ReceptiveAccount category: #'PortfolioTimeConsuming-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 10/18/2018 20:20:37'!
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


!ReceptiveAccount methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:36'!
accept: aSummarizingAccountVisitor

	^ aSummarizingAccountVisitor visitReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:52'!
visitTransactionsWith: aTransactionVisitor

	transactions do: [ :aTransaction | aTransaction accept: aTransactionVisitor ]! !


!classDefinition: #SummarizingAccountVisitor category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #SummarizingAccountVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!SummarizingAccountVisitor methodsFor: 'visiting' stamp: 'HAW 5/15/2018 07:29:17'!
visitPortfolio: aPortfolio
	
	self subclassResponsibility ! !

!SummarizingAccountVisitor methodsFor: 'visiting' stamp: 'HAW 5/15/2018 07:29:33'!
visitReceptiveAccount: aReceptiveAccount 
	
	self subclassResponsibility ! !


!classDefinition: #PortfolioTreePrinter category: #'PortfolioTimeConsuming-Ejercicio'!
SummarizingAccountVisitor subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio accountNames lines spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!PortfolioTreePrinter methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:37'!
visitPortfolio: aPortfolio
	
	lines add: (self lineFor: aPortfolio).
	spaces := spaces + 1.
	aPortfolio visitAccountsWith: self.
	spaces := spaces - 1! !

!PortfolioTreePrinter methodsFor: 'visiting' stamp: 'HernanWilkinson 7/14/2011 06:38'!
visitReceptiveAccount: aReceptiveAccount 
	
	lines add: (self lineFor: aReceptiveAccount)! !


!PortfolioTreePrinter methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:33'!
lines
	
	lines := OrderedCollection new.
	spaces := 0.
	
	portfolio accept: self.
	
	^ lines ! !


!PortfolioTreePrinter methodsFor: 'evaluating - private' stamp: 'HernanWilkinson 7/14/2011 06:39'!
lineFor: aSummarizingAccount

	| stream |
	
	stream := WriteStream on: String new.
	spaces timesRepeat: [ stream nextPut: $ .].
	stream nextPutAll: (accountNames at: aSummarizingAccount).
	
	^ stream contents! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'HernanWilkinson 7/14/2011 06:32'!
initializeOf: aPortfolio namingAccountsWith: aDictionary 
	
	portfolio := aPortfolio.
	accountNames := aDictionary ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: #'PortfolioTimeConsuming-Ejercicio'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 06:31'!
of: aPortfolio namingAccountsWith: aDictionary 
	
	^ self new initializeOf: aPortfolio namingAccountsWith: aDictionary 
	! !


!classDefinition: #Transfer category: #'PortfolioTimeConsuming-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 21:00:46'!
accountSummaryLinesOf: anAccount! !

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


!Transfer methodsFor: 'initialization' stamp: 'HAW 10/18/2018 21:08:52'!
initializeOf: anAmount 
	
	value := anAmount.
	depositLeg := TransferDeposit relatedTo: self .
	withdrawLeg := TransferWithdraw relatedTo: self 
	
	! !


!Transfer methodsFor: 'legs' stamp: 'HAW 10/18/2018 20:53:34'!
depositLeg
	
	^depositLeg! !

!Transfer methodsFor: 'legs' stamp: 'HAW 10/18/2018 20:53:26'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 21:08:33'!
value

	^value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTimeConsuming-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 10/18/2018 19:28:56'!
with: aValue  from: fromAccount to: toAccount
^self new initialize:  aValue  from: fromAccount to: toAccount! !


!Transfer class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:07:39'!
of: anAmount 

	^self new initializeOf: anAmount ! !


!Transfer class methodsFor: 'registering' stamp: 'HAW 10/18/2018 20:50:53'!
register: anAmount from: fromAccount to: toAccount 

	|transfer |
	
	transfer := self of: anAmount.
	fromAccount register: transfer withdrawLeg.
	toAccount register: transfer depositLeg.
	
	^transfer! !
