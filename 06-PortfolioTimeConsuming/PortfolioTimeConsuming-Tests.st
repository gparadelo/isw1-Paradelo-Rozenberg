!classDefinition: #PortfolioTest category: #'PortfolioTimeConsuming-Tests'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTimeConsuming-Tests'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 18:28:42'!
registerDepositFor: amount into: account
	
	^Deposit register: amount on: account.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:20:55'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:21:05'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:21:13'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:21:25'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:21:38'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert: 300 equals: complexPortfolio balance ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:21:50'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 equals: composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:32:05'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:32:05'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:32:05'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio hasRegistered: deposit1).
	self assert: (composedPortfolio hasRegistered: deposit2).
	self assert: (composedPortfolio hasRegistered: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:31:24'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	
	account1 := ReceptiveAccount new.
		
	self assert: (account1 doesManage: account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:31:24'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 doesManage: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:31:24'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio doesManage: account1).
	self assert: (complexPortfolio doesManage: account2).
	self deny: (complexPortfolio doesManage: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:31:24'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio doesManage: account1).
	self assert: (composedPortfolio doesManage: account2).
	self assert: (composedPortfolio doesManage: account3).
	self assert: (composedPortfolio doesManage: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:22:56'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:23:16'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: (composedPortfolio transactionsOf:account1) size.
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:23:26'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 equals: (composedPortfolio transactionsOf:complexPortfolio) size.
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 18:22:55'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio withAll: (Array with: account1 with: account2 with: account3).

	self 
		should: [ Portfolio withAll: (Array with: complexPortfolio with: account1) ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 18:23:08'!
test20_01CanNotCreatePortfoliosWithPortfoliosThatManagedSameAccounts

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio withAll: (Array with: account1 with: account2).
    complexPortfolio2 := Portfolio withAll: (Array with: account3 with: account1).


    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:35:21'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	self registerTransferOf: 100 from: fromAccount to: toAccount.
		
	self assert: -100 equals: fromAccount balance.
	self assert:  100 equals: toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:43:51'!
test21_01TransferShouldRegistersATransferDepositOnToAccount

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := self registerTransferOf: 100 from: fromAccount to: toAccount.
		
	self assert: (toAccount hasRegistered: transfer depositLeg).
	self assert: transfer value equals: transfer depositLeg value! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:43:34'!
test21_02TransferShouldRegistersATransferWithdrawOnFromAccount

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := self registerTransferOf: 100 from: fromAccount to: toAccount.
		
	self assert: (fromAccount hasRegistered: transfer withdrawLeg).
	self assert: transfer value equals: transfer withdrawLeg value! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:46:25'!
test21_03TransferLegsKnowTransfer

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := self registerTransferOf: 100 from: fromAccount to: toAccount.
		
	self assert: transfer depositLeg transfer equals: transfer withdrawLeg transfer.
	self assert: transfer equals: transfer depositLeg transfer.
	self assert: transfer equals: transfer withdrawLeg transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:36:20'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	self registerTransferOf: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 equals: fromAccountLines size.
	self assert: 'Deposito por 100' equals: (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' equals: (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' equals: (fromAccountLines at: 3).
	
	self assert: 1 equals: toAccountLines size.
	self assert: 'Transferencia por 100' equals: (toAccountLines at: 1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:36:40'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	self registerTransferOf: 100 from: fromAccount to: toAccount.
	self registerTransferOf: 250 from: toAccount to: fromAccount.
		
	self assert: 150 equals: (self accountTransferNetOf: fromAccount).
	self assert: -150 equals: (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:34:21'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	self registerTransferOf: 100 from: account to: toAccount.
	self registerCertificateOfDepositOf: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 equals: (self investmentNetOf:account).
	self assert: 750 equals: account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:33:28'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	
	account := ReceptiveAccount new. 
		
	self registerCertificateOfDepositOf: 100 during: 30 at: 1/10 on: account.
	self registerCertificateOfDepositOf: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings equals: (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:34:12'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	self registerTransferOf: 100 from: fromAccount to: toAccount.
	self registerCertificateOfDepositOf: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 equals: lines size.
	self assert: 'Deposito por 100' equals:  (lines at: 1).
	self assert: 'Extraccion por 50' equals:  (lines at: 2).
	self assert: 'Transferencia por -100' equals: (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' equals: (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:34:57'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	self registerTransferOf: 100 from: fromAccount to: toAccount.
	self registerTransferOf: 250 from: toAccount to: fromAccount.
	self registerCertificateOfDepositOf: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 equals: (self accountTransferNetOf: fromAccount).
	self assert: -150 equals: (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:46:56'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 equals: lines size.
	self assert: 'composedPortfolio' equals: (lines at: 1).
	self assert: ' complexPortfolio' equals: (lines at: 2).
	self assert: '  account1' equals: (lines at: 3).
	self assert: '  account2' equals: (lines at: 4).
	self assert: ' account3' equals: (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 10/18/2018 16:47:19'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 equals: lines size.
	self assert: ' account3' equals: (lines at: 1).
	self assert: '  account2' equals: (lines at: 2).
	self assert: '  account1' equals: (lines at: 3).
	self assert: ' complexPortfolio' equals: (lines at: 4).
	self assert: 'composedPortfolio' equals: (lines at: 5).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 17:52:44'!
test30AccountSummaryWithInvestmentEarningsShouldNotTakeTooLong

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 360 at: 1/10 on: fromAccount.
		
	self 
		should: [ lines := (AccountSummaryWithInvestmentEarnings for: fromAccount) lines ]
		notTakeMoreThanMilliseconds: 1100.	
		
	self assert: 5 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 360 dias a una tna de 10%' = (lines at: 4).
	self assert: 'Ganancias por 100' = (lines at: 5).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 17:52:59'!
test31AccountSummaryWithInvestmentFullInfoShouldNotTakeTooLong

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 360 at: 1/10 on: fromAccount.
		
	self 
		should: [ lines := (AccountSummaryWithAllInvestmentInformation for: fromAccount) lines ]
		notTakeMoreThanMilliseconds: 1100.
		
	self assert: 6 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 360 dias a una tna de 10%' = (lines at: 4).
	self assert: 'Ganancias por 100' = (lines at: 5).
	self assert: 'Inversiones por 1000' = (lines at: 6)! !


!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 05:40'!
accountSummaryLinesOf: aReceptiveAccount 
	
	| summary |
	
	summary := AccountSummary for: aReceptiveAccount.
	^ summary lines
! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 06:58'!
accountTransferNetOf: aReceptiveAccount 
	
	^ (AccountTransferNetVisitor for: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 06:58'!
investmentEarningsOf: aReceptiveAccount 
	
	^ (InvestmentEarningVisitor for: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 06:58'!
investmentNetOf: aReceptiveAccount 
	
	^ (InvestmentNetVisitor for: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 06:31'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	^ (PortfolioTreePrinter of: aPortfolio namingAccountsWith: aDictionary) lines! !

!PortfolioTest methodsFor: 'test support' stamp: 'HAW 10/24/2018 12:40:59'!
registerCertificateOfDepositOf: anAmount during: aNumberOfDays at: anInteresRate on: anAccount

	CertificateOfDeposit register: anAmount during: aNumberOfDays at: anInteresRate on: anAccount ! !

!PortfolioTest methodsFor: 'test support' stamp: 'HAW 10/24/2018 12:38:33'!
registerTransferOf: anAmount from: fromAccount to: toAccount

	^Transfer register: anAmount from: fromAccount to: toAccount! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 7/14/2011 06:42'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	^ (ReversePortfolioTreePrinter of: aPortfolio namingAccountsWith: aDictionary ) lines! !


!PortfolioTest methodsFor: 'asserting' stamp: 'HAW 8/13/2017 17:58:44'!
should: aBlock notTakeMoreThanMilliseconds: aTimeInMillis

	self assert: aBlock timeToRun <= aTimeInMillis ! !
