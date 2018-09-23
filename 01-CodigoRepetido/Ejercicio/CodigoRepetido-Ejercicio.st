!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:24:13'!
evaluate: aClosureToEvaluate OnFail: errorType Assert: aClosureToAssert
	aClosureToEvaluate 
		on: errorType 
		do: [ :anError |self assert: aClosureToAssert value]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 20:54:24'!
measureMiliSeconds: aClosure
	 | millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning - millisecondsBeforeRunning ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 20:58:58'!
measureMilliSeconds: aClosure
	 | millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning - millisecondsBeforeRunning ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:02:03'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook elapsedMiliSeconds |
	
	customerBook := CustomerBook  new.
	
	elapsedMiliSeconds := self measureMilliSeconds: [customerBook addCustomerNamed: 'John Lennon'.].
	
	self assert: (elapsedMiliSeconds ) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:05:50'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney elapsedMilliseconds |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	
	elapsedMilliseconds := self measureMilliSeconds: [customerBook removeCustomerNamed: paulMcCartney.].
	
	
	self assert: (elapsedMilliseconds )< (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:26:41'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
 self evaluate:	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: NotFound 
		Assert: [customerBook numberOfCustomers = 1 &  (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 9/20/2018 09:21:59'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 9/20/2018 09:23:02'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:25:01'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
self evaluate:	[ customerBook suspendCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: CantSuspend 
		Assert: [customerBook numberOfCustomers = 1 & (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:23:48'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self evaluate:[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		OnFail: CantSuspend 
		Assert: [ customerBook numberOfCustomers = 1 & (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:45:30'!
numberOfCustomers
	
	^self numberOfActiveCustomers +  self numberOfSuspendedCustomers .! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
removeCustomerNamed: aName 
aName = (self removeCustomer: active CustomerName: aName) ifTrue: [^aName].
aName = (self removeCustomer: suspended CustomerName: aName) ifTrue: [^aName].

	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 17:17:10'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/23/2018 11:25:02'!
removeCustomer: aCollection CustomerName:aName
	|posIndex|
	posIndex:= aCollection  findFirst: [:a|a == aName].
	(posIndex=0) ifFalse: [aCollection removeAt: posIndex .
		^aName. ].
	^''! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
