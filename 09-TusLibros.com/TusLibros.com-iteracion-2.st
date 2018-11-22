!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 13:31:43'!
test09CartKnowsSumPrice

	| cart |
	
	cart := self createCart.
	
	cart add: 3 of: self itemSellByTheStore.
	self assert: (cart price) = 3! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'Uriel Jonathan Rozenberg 11/21/2018 19:52:24'!
defaultCatalog
	^ Dictionary with: self itemSellByTheStore->1! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/21/2018 20:27:49'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:22'!
createErrorMerchantProcessor
	
	^MerchantProcessorMocker onDebit: [ :anAmount :aCreditCard | self fail. ] withBalance: 0.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:22'!
createMockMerchantProcessor
	^ MerchantProcessorMocker onDebit: [ :anAmount :aCreditCard ] withBalance:3.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 13:16:34'!
defaultCatalog
	
	^ Dictionary with: self itemSellByTheStore->1! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:48:11'!
expiredCreditCard
	| today |
	today:= DateAndTime now.
	^CreditCard withExpiration: (Month month:  today monthIndex year: today yearNumber - 1)! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:00:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:48:11'!
notExpiredCreditCard
	|today|
	today:=DateAndTime now.
	^CreditCard withExpiration: (Month month: today monthIndex year: today yearNumber + 1)! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:17:56'!
test01CashierCanNotGetAnEmptyCart

	| cart cashier |

	cart := self createCart.
	self should: [ 
			cashier:= Cashier with: cart  withProcessor: self createErrorMerchantProcessor.
		]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage. ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:14'!
test02CalculatedTotalIsCorrect

	| cart cashier creditCard |
	
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	creditCard:=self notExpiredCreditCard.
	cashier :=  Cashier with: cart withProcessor: self createMockMerchantProcessor.
	self assert:2 equals: (cashier checkOut: creditCard).! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:17:56'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart cashier creditCard |

	cart := self createCart.
	cart add: self itemSellByTheStore.
	creditCard:=self expiredCreditCard.
	cashier:= Cashier with: cart withProcessor: self createErrorMerchantProcessor .
	self
		should: [ cashier checkOut: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier creditCardExpired. ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:14'!
test04CheckoutRegistersASale
	| cart cashier total creditCard |
	cart _ self createCart.
	cart add: self itemSellByTheStore.
	creditCard:=self notExpiredCreditCard.
	cashier _ Cashier with: cart withProcessor: self createMockMerchantProcessor.
	total _ cashier checkOut:creditCard.
! !


!classDefinition: #MerchantProcessorTest category: #TusLibros!
TestCase subclass: #MerchantProcessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorTest methodsFor: 'setup' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 15:55:11'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!MerchantProcessorTest methodsFor: 'setup' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 15:55:28'!
defaultCatalog
	
	^ Dictionary with: self itemSellByTheStore->1! !

!MerchantProcessorTest methodsFor: 'setup' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:00:13'!
itemSellByTheStore
	
	^ 'validBook'! !


!MerchantProcessorTest methodsFor: 'tests' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 15:03:48'!
notExpiredCreditCard
	|today|
	today:=DateAndTime now.
	^CreditCard withExpiration: (Month month: today monthIndex year: today yearNumber + 1)! !

!MerchantProcessorTest methodsFor: 'tests' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:22'!
test01cashierDebitsFromMerchantProcessor
	| cart cashier total debited creditCard merchantProcessor |
	debited :=0.
	merchantProcessor := MerchantProcessorMocker onDebit: [ :anAmount :aCreditCard | debited _ debited + anAmount ] withBalance: 3.
	
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	creditCard:=self notExpiredCreditCard.
	cashier :=  Cashier with: cart withProcessor: merchantProcessor.
	total := cashier checkOut: creditCard.
	
	
	self assert: debited equals: total.! !

!MerchantProcessorTest methodsFor: 'tests' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:19:05'!
test02processorReceivesCorrectCreditCard
	| cart cashier creditCard merchantProcessor |


	
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	creditCard:=self notExpiredCreditCard.
	merchantProcessor := MerchantProcessorMocker onDebit: [ :anAmount :aCreditCard | self assert: aCreditCard equals: creditCard ] withBalance: 3.
	cashier :=  Cashier with: cart withProcessor: merchantProcessor.
	cashier checkOut: creditCard.! !

!MerchantProcessorTest methodsFor: 'tests' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 16:18:22'!
test03cannotCheckoutIfProcessorSignalsError
	| cart cashier creditCard merchantProcessor |
	merchantProcessor := MerchantProcessorMocker onDebit: [ :anAmount :aCreditCard | self error: 'checkout invalid'] withBalance:3.


	
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	creditCard:=self notExpiredCreditCard.

	cashier :=  Cashier with: cart withProcessor: merchantProcessor.	
	self
		should: [ cashier checkOut:creditCard ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals:  'checkout invalid'.
		]! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'Uriel Jonathan Rozenberg 11/21/2018 19:53:40'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 13:22:56'!
catalog
	
	^ catalog! !

!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 13:31:01'!
price
	^items inject: 0 into:[:sum :item|  sum + (catalog at: item)]! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCart salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:41:17'!
checkOut: aCreditCard
	
	| total |
	self class assertIsNotExpired: aCreditCard on: DateAndTime now.
	total := cart price.
	merchantProcessor debit: total from: aCreditCard.
	^total! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:33:32'!
initializeWith: aCart withProcessor: aMerchantProcessor 
	
	cart := aCart.
	merchantProcessor := aMerchantProcessor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:36:15'!
with: aCart withProcessor: aMerchantProcessor 
	self assertIsNotEmpty: aCart.
	^self new initializeWith: aCart  withProcessor: aMerchantProcessor! !


!Cashier class methodsFor: 'assertions' stamp: 'Uriel Jonathan Rozenberg 11/21/2018 20:25:03'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:15:20'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard expiring: aDate) ifTrue: [ self error: self creditCardExpired]! !


!Cashier class methodsFor: 'error messages' stamp: 'Uriel Jonathan Rozenberg 11/21/2018 20:25:03'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:15:20'!
creditCardExpired
	
	^'Can not charge an expired credit card'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 12:27:51'!
expiring: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 11:53:13'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:48:11'!
withExpiration: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessorMocker category: #TusLibros!
Object subclass: #MerchantProcessorMocker
	instanceVariableNames: 'debitAction balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorMocker methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 15:13:54'!
initializeOnDebit: aBlockClosure withBalance:aBalance
	debitAction := aBlockClosure.
	balance=aBalance.! !


!MerchantProcessorMocker methodsFor: 'processor interface' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 14:24:56'!
debit: anAmount from: aCreditCard 
	debitAction value: anAmount value: aCreditCard.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorMocker class' category: #TusLibros!
MerchantProcessorMocker class
	instanceVariableNames: ''!

!MerchantProcessorMocker class methodsFor: 'instance creation' stamp: 'Uriel Jonathan Rozenberg 11/22/2018 15:50:03'!
onDebit: aBlockClosure withBalance: aBalance
	^self new initializeOnDebit: aBlockClosure withBalance: aBalance! !
