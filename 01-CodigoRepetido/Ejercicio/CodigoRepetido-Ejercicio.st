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
	classVariableNames: 'CustomerBookEmpty CustomerBookInstance CustomerBookWithLennon CustomerBookWithMcCartney JohnLennon PaulMcCartney'
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:19:53'!
CustomerBookEmpty

	^CustomerBookEmpty! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:20:38'!
CustomerBookWithLennon

	^CustomerBookWithLennon! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:20:28'!
CustomerBookWithMcCartney

	^CustomerBookWithMcCartney! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:35:17'!
JohnLennon

	^JohnLennon! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:35:31'!
PaulMcCartney

	^PaulMcCartney! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 21:24:13'!
evaluate: aClosureToEvaluate OnFail: errorType Assert: aClosureToAssert
	aClosureToEvaluate 
		on: errorType 
		do: [ :anError |self assert: aClosureToAssert value]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 9/20/2018 20:58:58'!
measureMilliSeconds: aClosure
	 | millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning - millisecondsBeforeRunning ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:37:02'!
setUp

	CustomerBookEmpty _ CustomerBook new.
	
	CustomerBookWithMcCartney _ CustomerBook new.
	PaulMcCartney _ 'Paul McCartney'.
	CustomerBookWithMcCartney  addCustomerNamed: PaulMcCartney .
	
	CustomerBookWithLennon _ CustomerBook new.
	JohnLennon _ 'John Lennon'.
	CustomerBookWithLennon addCustomerNamed: JohnLennon .! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:28:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| elapsedMiliSeconds |
	
	elapsedMiliSeconds := self measureMilliSeconds: [CustomerBookEmpty addCustomerNamed: 'John Lennon'.].
	
	self assert: (elapsedMiliSeconds ) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:37:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| elapsedMilliseconds |
	
	elapsedMilliseconds := self measureMilliSeconds: [CustomerBookWithMcCartney removeCustomerNamed: PaulMcCartney.].
	
	
	self assert: (elapsedMilliseconds )< (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:30:17'!
test03CanNotAddACustomerWithEmptyName 

	[ CustomerBookEmpty addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: CustomerBookEmpty isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:37:39'!
test04CanNotRemoveAnInvalidCustomer
	

 self evaluate:	[ CustomerBookWithLennon removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: NotFound 
		Assert: [CustomerBookWithLennon numberOfCustomers = 1 &  (CustomerBookWithLennon includesCustomerNamed: JohnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:37:56'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	CustomerBookWithMcCartney suspendCustomerNamed: PaulMcCartney.
	
	self assert: 0 equals: CustomerBookWithMcCartney numberOfActiveCustomers.
	self assert: 1 equals: CustomerBookWithMcCartney numberOfSuspendedCustomers.
	self assert: 1 equals: CustomerBookWithMcCartney numberOfCustomers.
	self assert: (CustomerBookWithMcCartney includesCustomerNamed: PaulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:38:16'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	
	CustomerBookWithMcCartney suspendCustomerNamed: PaulMcCartney.
	CustomerBookWithMcCartney removeCustomerNamed: PaulMcCartney.
	
	self assert: 0 equals: CustomerBookWithMcCartney numberOfActiveCustomers.
	self assert: 0 equals: CustomerBookWithMcCartney numberOfSuspendedCustomers.
	self assert: 0 equals: CustomerBookWithMcCartney numberOfCustomers.
	self deny: (CustomerBookWithMcCartney includesCustomerNamed: PaulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:38:32'!
test07CanNotSuspendAnInvalidCustomer
	
self evaluate:	[ CustomerBookWithLennon suspendCustomerNamed: 'Paul McCartney'.
	self fail ]
		OnFail: CantSuspend 
		Assert: [CustomerBookWithLennon numberOfCustomers = 1 & (CustomerBookWithLennon includesCustomerNamed: JohnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GP 9/23/2018 19:38:52'!
test08CanNotSuspendAnAlreadySuspendedCustomer
			
	CustomerBookWithLennon suspendCustomerNamed: JohnLennon.
	
	self evaluate:[ CustomerBookWithLennon suspendCustomerNamed: JohnLennon.
	self fail ]
		OnFail: CantSuspend 
		Assert: [ CustomerBookWithLennon numberOfCustomers = 1 & (CustomerBookWithLennon includesCustomerNamed: JohnLennon) ]
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
