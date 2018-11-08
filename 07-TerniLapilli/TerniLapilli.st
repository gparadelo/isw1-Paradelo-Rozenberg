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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:56:12'!
test05CanNotPlaceToPiecesOnTheSamePosition

	| game |
	
	game := TerniLapilli new.
	game putX: 1@2.
	
	self 
		should: [ game putO: 1@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidPut = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:02:30'!
test06PlayerXCanOnlyPutOnTheirTurn

	| game |
	
	game := TerniLapilli new.
	game putX: 1@2.

	self 
		should: [ game putX: 2@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalOtherPlayersTurn = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:02:35'!
test06_01PlayerOCanNotStartFirst

	| game |
	
	game := TerniLapilli new.

	self 
		should: [ game putO: 1@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalOtherPlayersTurn = invalidMove messageText ]


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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:04:51'!
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
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:56:20'!
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
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]



! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:03:11'!
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
			self assert: TerniLapilli signalOtherPlayersTurn = invalidMove messageText ]


! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:04:54'!
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
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:05:01'!
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
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:05:04'!
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
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:03:21'!
test18CanOnlySlideAfterBoardIsFull

	| game |
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 2@1.

	
	self 
		should: [ game slideX:  3@1 to:3@2 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalBoardIsNotFull = invalidMove messageText ]
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:05:12'!
test19CanNotSlideToTheSameLocation

	| game |
	game := TerniLapilli new.
	game putX: 3@1.
	game putO: 2@1.
	game putX: 2@2.
	game putO: 3@2.
	game putX: 2@3.
	game putO: 3@3.
	
	self 
		should: [ game slideX:  2@3 to:2@3 ]
		raise: Error
		withExceptionDo: [ :invalidMove |
			self assert: TerniLapilli signalInvalidSlide = invalidMove messageText ]
! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board turn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 18:11:25'!
board
	^board! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:22:46'!
checkPositionIsEmptyForPut: aPosition

	( self isEmptyAt: aPosition ) = '' ifFalse: [self  error: self class signalInvalidPut ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:04:38'!
checkValidPiece: aPiece OnPosition:aPosition

		((board at: aPosition x) at: aPosition y) = aPiece ifFalse: [self error: self class signalInvalidSlide ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:23:02'!
checkValidSlideFrom: fromPosition to: toPosition
	
	( self isEmptyAt: toPosition ) ifFalse: [ self error: self class signalInvalidSlide ].
		
	((fromPosition x - toPosition x) abs = 1 and: (fromPosition y - toPosition y) = 0) ifTrue: [^true].
	((fromPosition x - toPosition x) = 0 and: (fromPosition y - toPosition y) abs = 1) ifTrue: [^true].
	(fromPosition = (2@2) xor: toPosition = (2@2)) ifTrue: [^true].
	
	self error: self class signalInvalidSlide ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:17:51'!
checkValidSlideOf: aPlayer From: fromPosition to: toPosition

	| piece |
	
	aPlayer = 0 ifTrue: [ piece := 'O'] ifFalse: [ piece := 'X' ].
	
	self checkValidPiece: piece OnPosition:fromPosition.
	self checkValidSlideFrom: fromPosition to: toPosition .! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/5/2018 20:25:42'!
clearPosition: aPoint
	(board at: aPoint x) at: aPoint y put: ''.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:47:17'!
getAtPosition: point
	^(board at: point x) at: point y! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:52:08'!
hasWonO

	(board anySatisfy: [:row | ((row count: [:position| position ='O'])=3)]) ifTrue: [^true].
	
	1 to: 3  do: [:x|(board  allSatisfy: [:row | (row at: x )= 'O']) ifTrue: [^true]].
	
	(((self getAtPosition: 1@1) = 'O') and: ((self getAtPosition: 2@2) = 'O') and: ((self getAtPosition: 3@3) = 'O') ) ifTrue: [ ^true ].
	
	(((self getAtPosition: 1@3) = 'O') and: ((self getAtPosition: 2@2) = 'O') and: ((self getAtPosition: 3@1) = 'O') ) ifTrue: [ ^true ].
	
	^ false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:52:41'!
hasWonX
	
	(board anySatisfy: [:row | ((row count: [:position| position ='X'])=3)]) ifTrue: [^true].
	
	1 to: 3  do: [:x|(board  allSatisfy: [:row | (row at: x )= 'X']) ifTrue: [^true]].
	
	(((self getAtPosition: 1@1) = 'X') and: ((self getAtPosition: 2@2) = 'X') and: ((self getAtPosition: 3@3) = 'X') ) ifTrue: [ ^true ].
	
	(((self getAtPosition: 1@3) = 'X') and: ((self getAtPosition: 2@2) = 'X') and: ((self getAtPosition: 3@1) = 'X') ) ifTrue: [ ^true ].
	
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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:21:56'!
isEmptyAt: aPosition
	
	^ (self getAtPosition: aPosition) = '' ! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:53:48'!
signalBoardIsFull

	^ 'Can not place more pieces'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:57:11'!
signalBoardIsNotFull

	^ 'Can not slide until all pieces are placed.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:22:31'!
signalGameOver
	^ 'The game is over'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:54:11'!
signalInvalidPut

	^'This is not a valid put'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:56:30'!
signalInvalidSlide

	^'This is not a valid slide'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:55:47'!
signalOtherPlayersTurn

	^' It is not this players turn. '! !


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

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:14:56'!
putO: aPosition
	
	game checkPositionIsEmptyForPut: aPosition.
	game putPiece: 'O' onPosition: aPosition.
	game increaseTurn.! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:57:42'!
putX: aPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:59:09'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalBoardIsNotFull ! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:59:35'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

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

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:59:41'!
putO: aPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:15:09'!
putX: aPosition
	
	game checkPositionIsEmptyForPut: aPosition.
	game putPiece: 'X' onPosition: aPosition.
	game increaseTurn.! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:59:46'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 09:59:58'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalBoardIsNotFull ! !

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

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:00:17'!
putO: aPosition

	game error: TerniLapilli signalBoardIsFull ! !

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:00:24'!
putX: aPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:16:03'!
slideO: fromPosition to: toPosition

	game checkValidSlideOf: 0 From: fromPosition to: toPosition.
	
	game clearPosition: fromPosition .
	game putPiece: 'O' onPosition: toPosition.
	game increaseTurn ! !

!SlidingO methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:00:57'!
slideX: fromPosition to: toPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

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

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:03:52'!
putO: aPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/6/2018 14:24:36'!
putX: aPosition

	game error: TerniLapilli signalBoardIsFull! !

!SlidingX methodsFor: 'as yet unclassified' stamp: 'GP 11/8/2018 10:01:02'!
slideO: fromPosition to: toPosition

	game error: TerniLapilli signalOtherPlayersTurn ! !

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
