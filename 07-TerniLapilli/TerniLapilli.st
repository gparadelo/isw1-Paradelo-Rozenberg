!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:58:28'!
test01TurnIsZeroWhenGameIsStarted

	| game |
	
	game:= TerniLapilli new.
	
	self assert: 0 equals: game turn! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:16:02'!
test02BoardIsEmptyWhenGameIsStarted

	| game |
	
	game := TerniLapilli new.
	
	self assert: ( game board allSatisfy: [ :row | row allSatisfy: [ :slot | slot = '' ] ] )! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:19:56'!
test03PutXPlacesXAtTheCorrectPosition

	| game |
	
	game := TerniLapilli new.
	
	game putX: 1@2.
	
	self assert: 'X' equals: (game getAtPosition: 1@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:19:54'!
test03_01PutOPlacesOAtTheCorrectPosition

	| game |
	
	game := TerniLapilli new.
	
	game putX: 1@2.
	game putO: 2@2.
	
	self assert: 'O' equals: (game getAtPosition: 2@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:19:49'!
test04TurnIsIncreasedWhenPieceIsPlaced

	| game |
	
	game := TerniLapilli new.

	self assert: 0 equals: (game turn).
	game putX: 1@2.
	
	self assert: 1 equals: (game turn).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:19:46'!
test04_01TurnIsIncreasedProperlyAfterSeveralPlays

	| game |
	
	game := TerniLapilli new.
	
	game putX: 1@2.
	self assert: 1 equals: (game turn).
	game putO: 2@2.
	self assert: 2 equals: (game turn).
	game putX: 3@2.
	self assert: 3 equals: (game turn).	



	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:19:42'!
test05CanNotPlaceToPiecesOnTheSamePosition

	| game |
	
	game := TerniLapilli new.
	game putX: 1@2.
	
	self 
		should: [ game putO: 1@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalPositionIsOccupied = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:51:11'!
test06PlayerXCanOnlyPutOnTheirTurn

	| game |
	
	game := TerniLapilli new.
	game putX: 1@2.

	self 
		should: [ game putX: 2@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidTurn = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:51:45'!
test06_01PlayerOCanNotStartFirst

	| game |
	
	game := TerniLapilli new.

	self 
		should: [ game putO: 1@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidTurn = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:34:11'!
test07CanNotPlaceMoreThan6Pieces

	| game |
	
	game := TerniLapilli new.
	
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 2@3.
	game putO: 3@2.	
	
	self 
		should: [ game putX: 3@3]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalBoardIsFull = invalidMove messageText ]

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:34:18'!
test08HorizontalLineOfThreeWinsTheGame

	| game |
	
	game := TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 1@3.
		
	self assert: game hasWonX.
	self deny: game hasWonO
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:34:22'!
test08_01VerticalLineOfThreeWinsTheGame

	| game |
	
	game := TerniLapilli new.
	game putX: 1@1.
	game putO: 2@2.
	game putX: 2@1.
	game putO: 1@2.
	game putX: 3@1.
		
	self assert: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:34:27'!
test08_02DiagonalLineOfThreeWinsTheGame

	| game |
	
	game:= TerniLapilli new.
	
	game putX: 2@1.
	game putO: 1@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 1@3.
	game putO: 3@3.
			
	self assert: game hasWonO
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:16:53'!
test09GameIsNotWonIfConditionsAreNotMet

	| game |
	
	game := TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 2@3.
	game putO: 3@3.
		
	self deny: game hasWonO.
	self deny: game hasWonX
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:48:14'!
test10CanNotPutPieceAfterGameIsWon

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 1@3.
	
	self 
		should: [ game putO: 3@3 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalGameOver = invalidMove messageText ]

! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:09:39'!
test11SlideMovesPieceVertically

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX:  2@3 to:1@3.
	self assert: 'X' equals: (game getAtPosition: 1@3).
	self assert: '' equals: ( game getAtPosition: 2@3 ).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:09:32'!
test11_01SlideMovesPieceHorizontally

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX:  2@2 to:2@1.
	self assert: 'X' equals: ( game getAtPosition: 2@1 ).
	self assert: '' equals: ( game getAtPosition: 2@2 ).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:09:47'!
test11_02SlideMovesPieceDiagonallyFromCenter

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX:  2@2 to:1@3.
	self assert: 'X' equals: ( game getAtPosition: 1@3 ).
	self assert: '' equals: ( game getAtPosition: 2@2 ).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:48:09'!
test12CanOnlySlideToAdyacentPosition

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.	

	self 
		should: [ game slideX:  3@1 to:1@1 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidMove = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:48:06'!
test13CanNotSlideToOccupiedPosition

	| game |
	
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	self 
		should: [ game slideX:  2@2 to:3@3 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalPositionIsOccupied = invalidMove messageText ]



! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:53:05'!
test13PlayerCanOnlySlideInTheirOwnTurn

	| game |
	
	game:= TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	self 
		should: [ game slideO:  1@2 to:1@3 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidTurn = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:10:31'!
test14PlayerCanNotSlideOpponentPiece

	| game |
	 
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.	

	self 
		should: [ game slideX: 1@2 to: 1@3 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidMove = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:10:59'!
test15PlayerCanNotSlideFromEmptySlot

	| game |
	 
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.	

	self 
		should: [ game slideX: 1@1 to: 2@1 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidMove = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:14:07'!
test16CanNotSlideAfterGameIsWon

	| game |
	
	game := TerniLapilli new.
	
	game putX: 3@1.
	game putO: 1@2.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	game slideX: 2@3 to: 1@3.	

	self 
		should: [ game slideO: 1@2 to: 1@1 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalGameOver = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:16:15'!
test17CanOnlySlideDiagonallyFromOrToTheCenter

	| game |
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 2@1.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	self 
		should: [ game slideX:  2@3 to:1@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidMove = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:44:01'!
test18CanOnlySlideAfterBoardIsFull

	| game |
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 2@1.

	
	self 
		should: [ game slideX:  3@1 to:3@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidTurn = invalidMove messageText ]
! !


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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:45:31'!
checkBoardIsFull

	self isFull ifFalse: [self  error: self class signalInvalidTurn ].
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:49:10'!
checkForValidPointPut: aPoint
	((board at: aPoint x) at: aPoint y) = '' ifFalse: [self  error: self class signalPositionIsOccupied ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:23:56'!
checkForValidPutBeforeMove

	turn > 5 ifTrue: [self  error: self signalBoardIsFull ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:52:12'!
checkForValidTurnWithPlayer: aPlayerNumber
	turn \\ 2 =aPlayerNumber ifTrue: [self  error: self class signalInvalidTurn ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:22:38'!
checkGameOver

	self isOver ifTrue: [self  error: self class signalGameOver ].
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:09:14'!
checkPositionIsEmpty: aPosition

	((board at: aPosition x) at: aPosition y) = '' ifFalse: [self  error: self class signalPositionIsOccupied ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 15:15:48'!
checkValidPiece: aPiece OnPosition:aPosition

		((board at: aPosition x) at: aPosition y) = aPiece ifFalse: [self error: self class signalInvalidMove ].! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:43:37'!
checkValidSlideOf: aPlayer From: fromPosition to: toPosition

	| piece |
	
	aPlayer = 0 ifTrue: [ piece := 'O'] ifFalse: [ piece := 'X' ].
	
	self checkGameOver.
	self checkForValidPointPut: toPosition.
	self checkForValidTurnWithPlayer: aPlayer.
	self checkValidPiece: piece OnPosition:fromPosition.
	self checkValidSlideFrom: fromPosition to: toPosition .
	self checkBoardIsFull.! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:18'!
isNotOver

	^ self isOver not! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:04'!
isOver

	^ self hasWonX or: self hasWonO! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:46:23'!
slideO: fromPosition to: toPosition

	self state slideO: fromPosition to:toPosition! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:48:50'!
slideX: fromPosition to: toPosition
	
	self state slideX: fromPosition to: toPosition ! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:23:24'!
signalBoardIsFull

	^ 'The board is full'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:22:31'!
signalGameOver
	^ 'The game is over'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:29:57'!
signalInvalidMove
^'This is not a valid move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:21:01'!
signalInvalidTurn
^'This is not a valid turn'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:06:33'!
signalPositionIsOccupied

	^ 'This position is already occupied'! !


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

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:46:50'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalInvalidTurn ! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:49:19'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalInvalidTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilli!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:39'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isNotFull and: ( aTerniLapilli isTurnOf: 1 ) and: aTerniLapilli isNotOver! !


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

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:46:55'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalInvalidTurn ! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:49:25'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalInvalidTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilli!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:49'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isNotFull and: ( aTerniLapilli isTurnOf: 0 ) and: aTerniLapilli isNotOver! !


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

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:48:07'!
slideO: fromPosition to: toPosition

	game checkValidSlideOf: 0 From: fromPosition to: toPosition.
	
	game clearPosition: fromPosition .
	game putPiece:'O' onPosition: toPosition.
	game increaseTurn ! !

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:49:33'!
slideX: fromPosition to: toPosition

	game checkValidSlideOf: 0 From: fromPosition to: toPosition.
	
	game clearPosition: fromPosition .
	game putPiece:'O' onPosition: toPosition.
	game increaseTurn ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #TerniLapilli!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:52'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isFull and: ( aTerniLapilli isTurnOf: 1 ) and: aTerniLapilli isNotOver! !


!classDefinition: #SlidingX category: #TerniLapilli!
TerniLapilliState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:24:42'!
putO: aPosition

	game error: TerniLapilli signalBoardIsFull ! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:24:36'!
putX: aPosition

	game error: TerniLapilli signalBoardIsFull! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:46:59'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalInvalidTurn ! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:50:20'!
slideX: fromPosition to: toPosition

	game checkValidSlideOf: 1 From: fromPosition to: toPosition.
	
	game clearPosition: fromPosition .
	game putPiece: 'X' onPosition: toPosition .	
	game increaseTurn! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #TerniLapilli!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 13:56:55'!
isFor: aTerniLapilli
	
	^ aTerniLapilli isFull and: ( aTerniLapilli isTurnOf: 0 ) and: aTerniLapilli isNotOver! !


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

!WinerO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:47:08'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalGameOver ! !

!WinerO methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:49:37'!
slideX: fromPosition to: toPosition

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

!WinerX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:47:14'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalGameOver ! !

!WinerX methodsFor: 'as yet unclassified' stamp: 'GP 11/7/2018 14:49:42'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalGameOver ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinerX class' category: #TerniLapilli!
WinerX class
	instanceVariableNames: ''!

!WinerX class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 10:30:15'!
isFor: aTerniLapilli
	
	^ aTerniLapilli hasWonX! !
