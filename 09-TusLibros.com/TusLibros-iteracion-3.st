!classDefinition: #CartSessionTest category: #TusLibros!
TestCase subclass: #CartSessionTest
	instanceVariableNames: 'testObjectsFactory cartSession'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSessionTest methodsFor: 'setup' stamp: 'Rozen 12/3/2018 13:06:10'!
setUp 
	testObjectsFactory := StoreTestObjectsFactory new.
	cartSession:=CartSession withCatalog: testObjectsFactory defaultCatalog withOwner:testObjectsFactory userInDatabase  withClock:testObjectsFactory clock .! !


!CartSessionTest methodsFor: 'testing' stamp: 'Rozen 12/3/2018 13:06:36'!
test00NewCartSessionStoresOwner
	
	|owner|
	owner:=testObjectsFactory userInDatabase .
	
	self assert: cartSession owner equals: owner.! !

!CartSessionTest methodsFor: 'testing' stamp: 'Rozen 12/3/2018 13:31:28'!
test01NewCartIsEmpty
	self assert: (cartSession do: [:cart | cart isEmpty]).! !

!CartSessionTest methodsFor: 'testing' stamp: 'Rozen 12/3/2018 12:52:29'!
test02CanNotAddItemsThatDoNotBelongToStore
	
	self 
		should: [cartSession do: [:cart| cart add: testObjectsFactory itemNotSellByTheStore ]]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: (cartSession do: [:cart|cart invalidItemErrorMessage]).
			self assert: (cartSession do: [:cart |cart isEmpty ])].

	
! !

!CartSessionTest methodsFor: 'testing' stamp: 'Rozen 12/3/2018 13:34:33'!
test03CanNotOperateAfter30Minutes

	| clock |
	clock:= testObjectsFactory clock.
	clock elapseMinutes: 31.
	self 
		should: [cartSession do: [:cart| cart add: testObjectsFactory itemSellByTheStore ]]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: (cartSession class sessionExpiredErrorMessage).].

	
! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InternalAccessInterfaceTest category: #TusLibros!
TestCase subclass: #InternalAccessInterfaceTest
	instanceVariableNames: 'testObjectsFactory debitBehavior interface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:50:20'!
setUp

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ].
	interface := self defaultInterface.! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:51:02'!
test00CanNotCreateCartForUserNotInDatabase

	self 
		should: [ interface createCartFor: testObjectsFactory userNotInDatabase withPassword: testObjectsFactory passwordForUser ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface userNotRegisteredErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:49:03'!
test01CanNotCreateCartWithWrongPassword

	| interface |

	interface := self defaultInterface.
	
	self 
		should: [ interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory wrongPasswordForUser ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface wrongPasswordErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:51:21'!
test02CartCreatedIsEmpty

	|  cartId |

	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	self assert: ( interface cartIsEmpty: cartId )! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:51:28'!
test03CanNotCheckCartEmptyWithWrongId

	
	self 
		should: [ interface cartIsEmpty: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidCartIdErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:51:40'!
test04CartWithOneItemIsNotEmpty

	|  cartId |

	
	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId.
 	
	self assert: ( interface cartIsNotEmpty: cartId )! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'GP 12/3/2018 14:19:59'!
test05CanNotAddItemNotSoldByTheStoreToACart

	|  cartId |

	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId.
 	
	self 
		should: [ interface add: 1 of: testObjectsFactory itemNotSellByTheStore to: cartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidItemInCartErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:52:06'!
test06CanNotAddItemToNonExistentCartId

	|  cartId |


	cartId := 0.
	
	self 
		should: [ interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidCartIdErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'GP 12/3/2018 14:21:36'!
test07CanNotAddNegativeQuantityOfItemsToCart

	|  cartId |


	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	self 
		should: [ interface add: -1 of: testObjectsFactory itemSellByTheStore to: cartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidQuantityInCartErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:52:26'!
test08CartListContainsAddedItem

	|  cartId |

	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId.
 	
	self assert: ( interface listCart: cartId ) = ( Bag with: testObjectsFactory itemSellByTheStore )! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:52:40'!
test09CanNotListCartWithNonExistentCartId

	|  cartId |

	cartId := 0.
	
	self 
		should: [ interface listCart: cartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidCartIdErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'GP 12/3/2018 14:24:10'!
test10CanNotCheckoutEmptyCart

	|  cartId |

	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	self 
		should: [ interface 
			checkout: cartId 
			of: testObjectsFactory userInDatabase 
			charging: testObjectsFactory notExpiredCreditCard 
			on: testObjectsFactory today. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface checkoutEmptyCartErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:53:03'!
test11CanCheckoutACartAndTheTotalCostIsReturned

	|  cartId cost |


	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	interface add: 2 of: testObjectsFactory itemSellByTheStore to: cartId.

	cost := interface 
		checkout: cartId 
		of: testObjectsFactory userInDatabase 
		charging: testObjectsFactory notExpiredCreditCard 
		on: testObjectsFactory today.

	self assert: cost = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:53:13'!
test12CanNotCheckoutWithInvalidCartId

	
	self 
		should: [ interface 
			checkout: 0 
			of: testObjectsFactory userInDatabase 
			charging: testObjectsFactory notExpiredCreditCard 
			on: testObjectsFactory today. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface invalidCartIdErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'GP 12/3/2018 14:24:43'!
test13CanNotCheckoutWithExpiredCard

	| cartId |


	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId.
	
	self 
		should: [ interface 
			checkout: cartId 
			of: testObjectsFactory userInDatabase 
			charging: testObjectsFactory expiredCreditCard 
			on: testObjectsFactory today. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface canNotChargeAnExpiredCreditCardErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:53:38'!
test14CanNotListPurchasesOfUserNotInDatabase

	
	self 
		should: [ interface listPurchasesOf: testObjectsFactory userNotInDatabase withPassword: testObjectsFactory passwordForUser ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface userNotRegisteredErrorMessage. ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:53:48'!
test15CanNotListPurchasesWithWrongPassword


	self 
		should: [ interface listPurchasesOf: testObjectsFactory userInDatabase withPassword: testObjectsFactory wrongPasswordForUser ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = InternalAccessInterface wrongPasswordErrorMessage . ]! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:54:05'!
test16ListOfPurchasesForUserStartsEmpty

	|  purchases |


	purchases := interface listPurchasesOf: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	self assert: Bag new equals: purchases! !

!InternalAccessInterfaceTest methodsFor: 'testing' stamp: 'Rozen 12/2/2018 11:54:18'!
test17ListOfPurchasesOfUserHasBoughtItem

	| cartId purchases |


	
	cartId := interface createCartFor: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId.
 	interface 
		checkout: cartId 
		of: testObjectsFactory userInDatabase 
		charging: testObjectsFactory notExpiredCreditCard 
		on: testObjectsFactory today.
	purchases := interface listPurchasesOf: testObjectsFactory userInDatabase withPassword: testObjectsFactory passwordForUser.
	
	self assert: (  Bag with: testObjectsFactory itemSellByTheStore ) equals: purchases.! !


!InternalAccessInterfaceTest methodsFor: 'merchant processor protocol' stamp: 'GP 11/29/2018 13:49:44'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!InternalAccessInterfaceTest methodsFor: 'setUp' stamp: 'Rozen 12/3/2018 13:45:07'!
defaultInterface
	^ InternalAccessInterface withUsers: testObjectsFactory defaultUsers withCatalog: testObjectsFactory defaultCatalog withMerchant: self withClock: testObjectsFactory  clock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InternalAccessInterfaceTest class' category: #TusLibros!
InternalAccessInterfaceTest class
	instanceVariableNames: 'testObjectsFactory'!


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'GP 11/26/2018 15:21:30'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'GP 11/26/2018 15:22:32'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items add: anItem withOccurrences: aQuantity.
! !


!Cart methodsFor: 'observation' stamp: 'GP 11/26/2018 15:26:01'!
list
	
	^ items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'cart owner lastUsed clock now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'initialization' stamp: 'Rozen 12/3/2018 12:49:01'!
initializeWithCatalog: aCatalog withOwner: anOwner withClock:aClock
	owner:=anOwner .
	cart:= Cart acceptingItemsOf: aCatalog .
	clock:= aClock.
	now:= aClock now.! !

!CartSession methodsFor: 'initialization' stamp: 'Rozen 12/3/2018 00:24:03'!
owner
	^owner! !


!CartSession methodsFor: 'accessing' stamp: 'Rozen 12/3/2018 13:58:33'!
checkoutThrought: aMerchant charging: aCard on: aDate registeringOn: aRegister
	| cashier total |
	cashier := Cashier
		toCheckout: cart
		charging: aCard 
		throught: aMerchant
		on: aDate 
		registeringOn: aRegister.
	total := cashier checkOut.	
	^ total.! !

!CartSession methodsFor: 'accessing' stamp: 'Rozen 12/3/2018 13:38:08'!
do: aBlockClosure 
	| expired |
	expired := (clock now) > (now + 30 minutes) .
	now := clock now.
	(expired) ifTrue: [self error: self class sessionExpiredErrorMessage].
	 ^aBlockClosure value: cart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'initialization' stamp: 'Rozen 12/3/2018 12:40:56'!
withCatalog: aCatalog withOwner: anOwner withClock:aClock
	^self new initializeWithCatalog: aCatalog withOwner: anOwner withClock:aClock! !


!CartSession class methodsFor: 'error handling' stamp: 'Rozen 12/3/2018 12:43:57'!
sessionExpiredErrorMessage
	^'You session has expired'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #Clock category: #TusLibros!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'as yet unclassified' stamp: 'Rozen 12/3/2018 08:28:17'!
now
^DateAndTime today! !


!classDefinition: #ManualClock category: #TusLibros!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'as yet unclassified' stamp: 'Rozen 12/3/2018 13:34:20'!
elapseMinutes: aNumber
now := now + aNumber minutes.! !

!ManualClock methodsFor: 'as yet unclassified' stamp: 'Rozen 12/3/2018 13:18:53'!
initialize
	now:= DateAndTime today! !

!ManualClock methodsFor: 'as yet unclassified' stamp: 'Rozen 12/3/2018 13:13:44'!
now
	^now.
	! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #InternalAccessInterface category: #TusLibros!
Object subclass: #InternalAccessInterface
	instanceVariableNames: 'carts users nextCartId catalog merchant purchases clock salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalAccessInterface methodsFor: 'initialization' stamp: 'GP 12/1/2018 20:05:45'!
initializePurchasesForUsers: aUserDatabase.

	aUserDatabase keys do: [ :aUser | purchases at: aUser put: Bag new ]! !

!InternalAccessInterface methodsFor: 'initialization' stamp: 'GP 12/3/2018 14:16:17'!
initializeWithUsers: aUserDatabase withCatalog: aCatalog withMerchant: aMerchant withClock: aClock
	
	users := aUserDatabase.
	catalog := aCatalog.
	merchant := aMerchant.
	nextCartId := 0.
	carts := Dictionary new.
	purchases := Dictionary new.
	clock := aClock.
	salesBook := OrderedCollection new.
	self initializePurchasesForUsers: aUserDatabase.! !


!InternalAccessInterface methodsFor: 'cart' stamp: 'Rozen 12/3/2018 13:46:38'!
add: anAmount of: anItem to: aCartId
	
	( self cartAt: aCartId ) do: [:cart| cart add: anAmount of: anItem].! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'GP 11/29/2018 14:22:53'!
cartAt: aCartId

	^ carts at: aCartId ifAbsent: [ self error: self class invalidCartIdErrorMessage ]! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'Rozen 12/3/2018 13:46:10'!
cartIsEmpty: aCartId

	^ ( self cartAt: aCartId )  do: [:cart| cart isEmpty].! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'GP 11/25/2018 11:51:52'!
cartIsNotEmpty: aCartId

	^ ( self cartIsEmpty: aCartId ) not! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'GP 12/3/2018 14:14:49'!
checkout: aCartId of: aUser charging: aCard on: aDate
	
	| total cartSession |
	
	cartSession := self cartAt: aCartId.
	total := cartSession checkoutThrought: merchant  charging: aCard  on: aDate registeringOn: salesBook.
	( purchases at: aUser ) addAll: ( ( self cartAt: aCartId ) do: [ :cart | cart  list ] ).	
	^ total.! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'GP 12/3/2018 14:16:31'!
createCartFor: aUser withPassword: aPassword 
	
	| res |
	
	self assertUserIsInDatabase: aUser.
	self assertPasswordFor: aUser is: aPassword.
	
	carts at: nextCartId put: ( CartSession withCatalog: catalog withOwner: aUser withClock: clock).
	
	res := nextCartId.
	nextCartId := nextCartId + 1.
	^ res! !

!InternalAccessInterface methodsFor: 'cart' stamp: 'GP 12/3/2018 14:16:00'!
listCart: aCartId
	
	^ ( self cartAt: aCartId ) do: [ :cart | cart list ].! !


!InternalAccessInterface methodsFor: 'asserting' stamp: 'GP 11/29/2018 13:22:08'!
assertIsNotEmpty: aCartId

	( self cartIsNotEmpty: aCartId ) ifFalse: [ self error: self class emptyCartErrorMessage ]! !

!InternalAccessInterface methodsFor: 'asserting' stamp: 'GP 11/24/2018 12:35:15'!
assertPasswordFor: aUser is: aPassword
 
	( users at: aUser ) = aPassword ifFalse: [ self error: self class wrongPasswordErrorMessage ]! !

!InternalAccessInterface methodsFor: 'asserting' stamp: 'GP 11/24/2018 12:11:39'!
assertUserIsInDatabase: aUser

	( users includesKey: aUser ) ifFalse: [ self error: self class userNotRegisteredErrorMessage]! !


!InternalAccessInterface methodsFor: 'purchases list' stamp: 'GP 12/1/2018 20:06:11'!
listPurchasesOf: aUser withPassword: aPassword 
	
	self assertUserIsInDatabase: aUser.
	self assertPasswordFor: aUser is: aPassword .
	
	^ purchases at: aUser! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InternalAccessInterface class' category: #TusLibros!
InternalAccessInterface class
	instanceVariableNames: ''!

!InternalAccessInterface class methodsFor: 'instance creation' stamp: 'Rozen 12/3/2018 13:45:44'!
withUsers: aUserDatabase withCatalog: aCatalog withMerchant: aMerchant  withClock: aClock
	
	^ self new initializeWithUsers: aUserDatabase withCatalog: aCatalog withMerchant: aMerchant  withClock: aClock.! !


!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:25:04'!
canNotChargeAnExpiredCreditCardErrorMessage
		
	^ Cashier canNotChargeAnExpiredCreditCardErrorMessage ! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:23:42'!
checkoutEmptyCartErrorMessage
	
	^ Cashier cartCanNotBeEmptyErrorMessage .! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:25:57'!
creditCardHasNoCreditErrorMessage
		
	^ Cashier creditCardHasNoCreditErrorMessage ! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 11/29/2018 13:20:13'!
emptyCartErrorMessage
	
	^ 'The cart can not be empty'.! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 11/25/2018 11:38:27'!
invalidCartIdErrorMessage
	^ 'Invalid cart id'! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:20:06'!
invalidItemInCartErrorMessage
	^ Cart new invalidItemErrorMessage ! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:21:18'!
invalidQuantityInCartErrorMessage
	^ Cart new invalidQuantityErrorMessage ! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 12/3/2018 14:12:03'!
sessionExpiredErrorMessage
	
	^ CartSession sessionExpiredErrorMessage ! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 11/24/2018 12:13:56'!
userNotRegisteredErrorMessage
	
	^ 'The user is not registered'! !

!InternalAccessInterface class methodsFor: 'error messages' stamp: 'GP 11/24/2018 12:18:46'!
wrongPasswordErrorMessage
	
	^ 'The password is incorrect'! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'Rozen 12/3/2018 13:01:05'!
clock
	^clock.! !

!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'Rozen 12/3/2018 13:00:37'!
initialize

	today := DateAndTime now.
	clock:= ManualClock new.! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'users' stamp: 'GP 11/24/2018 12:13:03'!
defaultUsers
	
	^ Dictionary new
		at: self userInDatabase put: self passwordForUser;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'GP 11/24/2018 11:58:08'!
passwordForUser

	^ 'valid password'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'GP 11/24/2018 11:57:46'!
userInDatabase

	^ 'valid user'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'GP 11/24/2018 11:58:19'!
userNotInDatabase

	^ 'invalid user'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'GP 11/24/2018 12:15:33'!
wrongPasswordForUser

	^ 'invalid password'! !
