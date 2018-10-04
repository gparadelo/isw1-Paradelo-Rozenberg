!classDefinition: #QueueTest category: #'Queue-Exercise'!
TestCase subclass: #QueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test01QueueShouldBeEmptyWhenCreated

	| queue |

	queue _ Queue new.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test02EnqueueAddElementsToTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.

	self deny: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test03DequeueRemovesElementsFromTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test04DequeueReturnsFirstEnqueuedObject

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'Something1'.
	secondQueued _ 'Something2'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.
	
	self assert: queue dequeue equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'CGCM 9/27/2018 16:34:58'!
test05QueueBehavesFIFO

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'First'.
	secondQueued _ 'Second'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.

	self assert: queue dequeue equals: firstQueued.
	self assert: queue dequeue equals: secondQueued.
	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test06NextReturnsFirstEnqueuedObject

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	self assert: queue next equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test07NextDoesNotRemoveObjectFromQueue

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	queue next.
	self assert: queue size equals: 1.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test08CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.
	
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test09CanNotDequeueWhenThereAreNoObjectsInTheQueueAndTheQueueHadObjects

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test10CanNotNextWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.

	self
		should: [ queue next ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !


!classDefinition: #Queue category: #'Queue-Exercise'!
Object subclass: #Queue
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Queue methodsFor: 'enqueueing' stamp: 'Uriel Jonathan Rozenberg 10/1/2018 21:55:24'!
enqueue: aNewElementToEnqueue
contents addFirst: aNewElementToEnqueue! !


!Queue methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/1/2018 21:39:34'!
createEmptyQueue
contents _ OrderedCollection new.! !

!Queue methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/1/2018 21:50:05'!
initialize
contents _ OrderedCollection new.! !


!Queue methodsFor: 'accessing' stamp: 'GP 10/4/2018 15:16:32'!
next
	
	^ (QueueAccesor initializeWith: self) next! !

!Queue methodsFor: 'accessing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 18:29:27'!
safeNext
	
	^ contents last.! !

!Queue methodsFor: 'accessing' stamp: 'Uriel Jonathan Rozenberg 10/1/2018 22:00:31'!
size
^contents size! !


!Queue methodsFor: 'dequeueing' stamp: 'GP 10/4/2018 15:15:47'!
dequeue

	^(QueueAccesor initializeWith: self) dequeue
! !

!Queue methodsFor: 'dequeueing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 17:55:45'!
safeDequeue

	| lastElement |
	
	lastElement _ self next.
	contents removeLast.
 	^lastElement ! !


!Queue methodsFor: 'testing' stamp: 'Uriel Jonathan Rozenberg 10/1/2018 21:40:20'!
isEmpty
^contents isEmpty ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: ''!

!Queue class methodsFor: 'error descriptions'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !


!classDefinition: #QueueAccesor category: #'Queue-Exercise'!
Object subclass: #QueueAccesor
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueAccesor methodsFor: 'initialization' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 21:02:06'!
inicializarPara: aQueue

	queue := aQueue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'QueueAccesor class' category: #'Queue-Exercise'!
QueueAccesor class
	instanceVariableNames: ''!

!QueueAccesor class methodsFor: 'instance creator' stamp: 'GP 10/4/2018 15:15:23'!
initializeWith: aQueue

	| accessorClass |

	accessorClass _ self subclasses detect: [ :anAccessorClass | anAccessorClass isFor: aQueue ].
	
	^ accessorClass new inicializarPara: aQueue.! !


!classDefinition: #EmptyQueueAccessor category: #'Queue-Exercise'!
QueueAccesor subclass: #EmptyQueueAccessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!EmptyQueueAccessor methodsFor: 'dequeueing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 18:28:08'!
dequeue

	self error: Queue  queueEmptyErrorDescription ! !


!EmptyQueueAccessor methodsFor: 'accessing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 18:30:20'!
next

	self error: Queue  queueEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyQueueAccessor class' category: #'Queue-Exercise'!
EmptyQueueAccessor class
	instanceVariableNames: ''!

!EmptyQueueAccessor class methodsFor: 'queue accessor search' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 18:12:14'!
isFor: aQueue

	^ aQueue isEmpty ! !


!classDefinition: #NonEmptyQueueAccessor category: #'Queue-Exercise'!
QueueAccesor subclass: #NonEmptyQueueAccessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!NonEmptyQueueAccessor methodsFor: 'dequeueing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 21:02:22'!
dequeue

	^queue safeDequeue! !


!NonEmptyQueueAccessor methodsFor: 'accessing' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 21:02:18'!
next

	^queue safeNext! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyQueueAccessor class' category: #'Queue-Exercise'!
NonEmptyQueueAccessor class
	instanceVariableNames: ''!

!NonEmptyQueueAccessor class methodsFor: 'queue accessor search' stamp: 'Uriel Jonathan Rozenberg 10/3/2018 18:12:04'!
isFor: aQueue

	^ aQueue isEmpty not.! !
