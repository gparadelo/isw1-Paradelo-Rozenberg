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
	classVariableNames: 'CustomerBookInstance'
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:10:40'!
CustomerBookInstance

	^CustomerBookInstance! !

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

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:11:58'!
setUp

	CustomerBookInstance _ CustomerBook new! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:12:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| elapsedMiliSeconds |
	
	elapsedMiliSeconds := self measureMilliSeconds: [CustomerBookInstance addCustomerNamed: 'John Lennon'.].
	
	self assert: (elapsedMiliSeconds ) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:13:05'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney elapsedMilliseconds |
	
	CustomerBookInstance := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	CustomerBookInstance addCustomerNamed: paulMcCartney.
	  
	
	elapsedMilliseconds := self measureMilliSeconds: [CustomerBookInstance removeCustomerNamed: paulMcCartney.].
	
	
	self assert: (elapsedMilliseconds )< (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:13:26'!
test03CanNotAddACustomerWithEmptyName 

	[ CustomerBookInstance addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: CustomerBookInstance isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:13:51'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	CustomerBookInstance addCustomerNamed: johnLennon.
	
 self evaluate:	[ CustomerBookInstance removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: NotFound 
		Assert: [CustomerBookInstance numberOfCustomers = 1 &  (CustomerBookInstance includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:14:28'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney |
	
	CustomerBookInstance := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	CustomerBookInstance addCustomerNamed: paulMcCartney.
	CustomerBookInstance suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: CustomerBookInstance numberOfActiveCustomers.
	self assert: 1 equals: CustomerBookInstance numberOfSuspendedCustomers.
	self assert: 1 equals: CustomerBookInstance numberOfCustomers.
	self assert: (CustomerBookInstance includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:14:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	CustomerBookInstance addCustomerNamed: paulMcCartney.
	CustomerBookInstance suspendCustomerNamed: paulMcCartney.
	CustomerBookInstance removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: CustomerBookInstance numberOfActiveCustomers.
	self assert: 0 equals: CustomerBookInstance numberOfSuspendedCustomers.
	self assert: 0 equals: CustomerBookInstance numberOfCustomers.
	self deny: (CustomerBookInstance includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:15:01'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	CustomerBookInstance addCustomerNamed: johnLennon.
	
self evaluate:	[ CustomerBookInstance suspendCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: CantSuspend 
		Assert: [CustomerBookInstance numberOfCustomers = 1 & (CustomerBookInstance includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:15:12'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	CustomerBookInstance := CustomerBook new.
	johnLennon := 'John Lennon'.
	CustomerBookInstance addCustomerNamed: johnLennon.
	CustomerBookInstance suspendCustomerNamed: johnLennon.
	
	self evaluate:[ CustomerBookInstance suspendCustomerNamed: johnLennon.
	self fail ]
		OnFail: CantSuspend 
		Assert: [ CustomerBookInstance numberOfCustomers = 1 & (CustomerBookInstance includesCustomerNamed: johnLennon) ]
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
