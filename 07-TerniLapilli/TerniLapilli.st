!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:24:21'!
test00
	| game |
	game:= TerniLapilli new.
	self assert: 3 equals: game availableX.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:27:03'!
test01
	| game |
	game:= TerniLapilli new.
	self assert: 3 equals: game availableO.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:23:41'!
test02
	| game position |
	game:= TerniLapilli new.
	position:=1@2.
	game putX: position.
	self assert: 'X' equals: (game getAtPosition: position).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:05:45'!
test03
	| game position |
	game:= TerniLapilli new.
	position:=1@2.
	self assert: 0 equals: (game turn).
	game putX: position.
	self assert: 1 equals: (game turn).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:31:34'!
test04
	| game |
	game:= TerniLapilli new.
	game putX: 1@2.
	
	self should:[	game putO: 1@2.]  raise:  Error.

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:32:27'!
test05
	| game |
	game:= TerniLapilli new.
	game putX: 1@2.
	self assert: 1 equals: (game turn).
	game putO: 2@2.
	self assert: 2 equals: (game turn).
	game putX: 3@2.
	self assert: 3 equals: (game turn).	



	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:26:38'!
test06
	| game |
	game:= TerniLapilli new.
	game putX: 1@2.
	
	self should:[	game putO: 1@2.]  raise:  Error.

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:31:05'!
test07
	| game |
	game:= TerniLapilli new.
	game putX: 1@2.

	self should:[	game putX: 2@2.]  raise:  Error.

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:56:05'!
test08
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 2@3.
	game putO: 3@2.	
	self should:[	game putX: 3@3.]  raise:  Error.

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:07:39'!
test09
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 1@3.
		
	self assert: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:44:18'!
test10
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 1@3.
		
	self deny: (game hasWonO)
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:27:14'!
test11
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 2@2.
	game putX: 2@1.
	game putO: 1@2.
	game putX: 3@1.
		
	self assert: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:42:53'!
test12
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 3@3.
		
	self assert: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:40:43'!
test13
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 1@3.
		
	self assert: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:49:14'!
test14
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 1@3.
	self should:[	game putO: 3@3.]  raise:  Error.

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:08:17'!
test15
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX:  2@2 to:1@3.
	self assert: 'X' equals: (game getAtPosition: 1@3).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:29:54'!
test16
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX:  2@3 to:1@3.
	self assert: 'X' equals: (game getAtPosition: 1@3).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:24:39'!
test17
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	

	self should:[game slideX:  2@2 to:3@3.]  raise:  Error.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:30:51'!
test18
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	

	self should:[game slideO:  1@2 to:1@3.]  raise:  Error.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:32:35'!
test19
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	

	self should:[game slideX:  1@2 to:1@3.]  raise:  Error.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:36:56'!
test20
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	

	self should:[game slideX:  3@1 to:1@1.]  raise:  Error.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:47:25'!
test21
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX: 2@3 to: 1@3.	

	self should:[game slideO:  1@2 to:1@1.]  raise:  Error.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:54:11'!
test22
	| game |
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 2@1.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	self should:[game slideX:  2@3 to:1@2.]  raise:  Error.! !


!classDefinition: #Player category: #TerniLapilli!
Object subclass: #Player
	instanceVariableNames: 'piece'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!Player methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:38:42'!
put: aPoint
	self checkValidPutOf: 1 on: aPoint.
	self putPiece:'X' onPosition: aPoint.
	self increaseTurn
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'availableX availableO board turn X O'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:26:52'!
availableO
^availableO! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:26:44'!
availableX
^availableX! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:11:25'!
board
	^board! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:55:10'!
checkForValidPointPut: aPoint
	((board at: aPoint x) at: aPoint y) = '' ifFalse: [self  error: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:55:03'!
checkForValidPutBeforeMove
	turn>5 ifTrue: [self  error: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:21:40'!
checkForValidTurnWithPlayer: aPlayerNumber
	turn \\ 2 =aPlayerNumber ifTrue: [self  error: self signalInvalidTurn ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:29:14'!
checkGameOver

	self  hasWonX ifTrue: [self  error: self signalGameOver ].
	self  hasWonO ifTrue: [self  error: self signalGameOver ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:14:28'!
checkPositionIsEmpty: aPosition
	((board at: aPosition x) at: aPosition y) = '' ifFalse: [self  error: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 19:34:11'!
checkValidPiece: aPiece OnPosition:aPosition

		((board at: aPosition x) at: aPosition y) = aPiece ifFalse: [self  error: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:13:31'!
checkValidPutOf: aPlayer on: aPoint
	self checkGameOver.
	self checkForValidTurnWithPlayer: aPlayer.
	self checkForValidPutBeforeMove.
	self checkForValidPointPut: aPoint.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:10:51'!
checkValidSlideFrom: fromPosition to: toPosition
	
	((fromPosition x - toPosition x) abs <= 1 and: (fromPosition y - toPosition y) = 0) ifTrue: [^true].
	((fromPosition x - toPosition x) = 0 and: (fromPosition y - toPosition y) abs <= 1) ifTrue: [^true].
	(fromPosition = (2@2) or: toPosition = (2@2)) ifTrue: [^true].
	
	self error: self class signalInvalidMove ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:17:00'!
checkValidSlideOf: aPlayer From: fromPosition to: toPosition

	| piece |
	
	aPlayer = 0 ifTrue: [ piece := 'O'] ifFalse: [ piece := 'X' ].
	
	self checkGameOver.
	self checkForValidPointPut: toPosition.
	self checkForValidTurnWithPlayer: aPlayer.
	self checkValidPiece: piece OnPosition:fromPosition.
	self checkValidSlideFrom: fromPosition to: toPosition .
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:25:42'!
clearPosition: aPoint
	(board at: aPoint x) at: aPoint y put: ''.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:47:17'!
getAtPosition: point
	^(board at: point x) at: point y! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:44:41'!
hasWonO

	| diagonal |
	(board anySatisfy: [:row | ((row count: [:position| position ='O'])=3)]) ifTrue: [^true].
	1 to: 3  do: [:x|(board  allSatisfy: [:row | (row at: x )= 'X']) ifTrue: [^true]].
	diagonal:= OrderedCollection new.
	1 to: 3  do: [:pos| diagonal add:((board at: pos) at: pos)].
	(diagonal allSatisfy: [:c| c='O']) ifTrue:[^true].
	diagonal:= OrderedCollection new.
	1 to: 3  do: [:pos| diagonal add:((board at: 4-pos) at: pos)].
	(diagonal allSatisfy: [:c| c='O']) ifTrue:[^true].
	^false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:44:46'!
hasWonX
	|diagonal|
	
	(board anySatisfy: [:row | ((row count: [:position| position ='X'])=3)]) ifTrue: [^true].
	1 to: 3  do: [:x|(board  allSatisfy: [:row | (row at: x )= 'X']) ifTrue: [^true]].
	diagonal:= OrderedCollection new.
	1 to: 3  do: [:pos| diagonal add:((board at: pos) at: pos)].
	(diagonal allSatisfy: [:c| c='X']) ifTrue:[^true].
	diagonal:= OrderedCollection new.
	1 to: 3  do: [:pos| diagonal add:((board at: 4-pos) at: pos)].
	(diagonal allSatisfy: [:c| c='X']) ifTrue:[^true].
	^false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:27:17'!
increaseTurn
	turn := turn +1. ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:03:12'!
initialize
	availableX:=3.
	availableO:=3.
	board:=Array with:( Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '').
	turn:=0.
	X:= Set new.
	O:= Set new.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:16:21'!
isFull

	^ self turn > 5! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:21:27'!
isNotFull

	^ self isFull not! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:42:58'!
isTurnOf: aPlayer

	^ (self turn \\ 2) = aPlayer! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:30:26'!
putO: aPoint
	
	self state putO: aPoint! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:22:14'!
putPiece: aPiece onPosition: aPosition
	
	(board at: aPosition x) at: aPosition y put: aPiece.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:22:05'!
putX: aPoint
	
	self state putX: aPoint
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:22:17'!
safePutPiece: aPiece onPosition: aPosition
	
	(board at: aPosition x) at: aPosition y put: aPiece.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:27:32'!
slideO: fromPosition to: toPosition
	self checkValidSlideOf: 0 From: fromPosition to: toPosition.
	self clearPosition: fromPosition .
	self putPiece:'O' onPosition: toPosition.

	self increaseTurn ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:27:25'!
slideX: fromPosition to: toPosition
	
	self checkValidSlideOf: 1 From: fromPosition to: toPosition.
	self clearPosition: fromPosition .
	self putPiece:'X' onPosition: toPosition .
	
	self increaseTurn! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:05:32'!
state
	
	^ TerniLapilliState for: self! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:03:14'!
turn
	^turn! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: 'availableX availableO'!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:54:12'!
signalGameOver
^'The game is over'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:29:57'!
signalInvalidMove
^'This is not a valid move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:21:01'!
signalInvalidTurn
^'This is not a valid turn'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:23:48'!
initializeFor: aTerniLapilli

	game := aTerniLapilli ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:05:23'!
putX: aPoint

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:07:00'!
for: aTerniLapilli 
	
	^ self subclasses 
		detect: [:aStateClass | aStateClass isFor: aTerniLapilli ]
		ifFound: [:aStateClass | aStateClass newFor: aTerniLapilli ]
		ifNone: [ self error: 'No state for terni lapilli' ]! !

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:22:50'!
isFor: aTerniLapilli

	^ self subclassResponsibility ! !

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:23:15'!
newFor: aTerniLapilli

	^ self new initializeFor: aTerniLapilli! !


!classDefinition: #PlayingO category: #TerniLapilli!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:23:45'!
putO: aPosition
	
	game checkPositionIsEmpty: aPosition.
	game putPiece: 'O' onPosition: aPosition.
	game increaseTurn.! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:11:31'!
putX: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilli!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:27:21'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isNotFull and: ( aTerniLapilli isTurnOf: 1 )! !


!classDefinition: #PlayingX category: #TerniLapilli!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:25:43'!
putO: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:22:49'!
putX: aPosition
	
	game checkPositionIsEmpty: aPosition.
	game putPiece: 'X' onPosition: aPosition.
	game increaseTurn.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilli!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:27:24'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isNotFull and: ( aTerniLapilli isTurnOf: 0 )! !


!classDefinition: #SlidingO category: #TerniLapilli!
TerniLapilliState subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:25:50'!
putO: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:11:37'!
putX: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #TerniLapilli!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:27:28'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isFull and: ( aTerniLapilli isTurnOf: 1 )! !


!classDefinition: #SlidingX category: #TerniLapilli!
TerniLapilliState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:25:55'!
putO: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:11:44'!
putX: aPosition

	game error: TerniLapilli signalInvalidTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #TerniLapilli!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:27:32'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isFull and: ( aTerniLapilli isTurnOf: 0 )! !


!classDefinition: #WinerO category: #TerniLapilli!
TerniLapilliState subclass: #WinerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!WinerO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:25:59'!
putO: aPosition

	game error: TerniLapilli signalGameOver ! !

!WinerO methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:11:48'!
putX: aPosition

	game error: TerniLapilli signalGameOver ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinerO class' category: #TerniLapilli!
WinerO class
	instanceVariableNames: ''!

!WinerO class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:30:06'!
isFor: aTerniLapilli
	
	^ aTerniLapilli hasWonO! !


!classDefinition: #WinerX category: #TerniLapilli!
TerniLapilliState subclass: #WinerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!WinerX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:26:03'!
putO: aPosition

	game error: TerniLapilli signalGameOver ! !

!WinerX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 12:11:51'!
putX: aPosition

	game error: TerniLapilli signalGameOver ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinerX class' category: #TerniLapilli!
WinerX class
	instanceVariableNames: ''!

!WinerX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:30:15'!
isFor: aTerniLapilli
	
	^ aTerniLapilli hasWonX! !
