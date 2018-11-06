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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:48:27'!
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
	instanceVariableNames: 'availableX availableO board turn X O state'
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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:53:34'!
checkForValidTurnWithPlayer: aPlayerNumber
	turn\\2 =aPlayerNumber ifTrue: [self  error: self signalInvalidTurn ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:29:14'!
checkGameOver

	self  hasWonX ifTrue: [self  error: self signalGameOver ].
	self  hasWonO ifTrue: [self  error: self signalGameOver ].! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 17:57:44'!
initialize
	availableX:=3.
	availableO:=3.
	board:=Array with:( Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '').
	turn:=0.
	X:= Set new.
	O:= Set new.
	state := 'ongoing'! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:28:09'!
putO: aPoint
	self checkValidPutOf: 0 on: aPoint.
	self putPiece:'O' onPosition: aPoint.
	self increaseTurn
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:24:21'!
putPiece:aPiece onPosition: aPoint
	(board at: aPoint x) at: aPoint y put: aPiece.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:27:46'!
putX: aPoint
	self checkValidPutOf: 1 on: aPoint.
	self putPiece:'X' onPosition: aPoint.
	self increaseTurn
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


!classDefinition: #GameOver category: #TerniLapilli!
TerniLapilliState subclass: #GameOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #WinerO category: #TerniLapilli!
GameOver subclass: #WinerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #WinerX category: #TerniLapilli!
GameOver subclass: #WinerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #PlayingO category: #TerniLapilli!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #PlayingX category: #TerniLapilli!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #SlidingO category: #TerniLapilli!
TerniLapilliState subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #SlidingX category: #TerniLapilli!
TerniLapilliState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!
