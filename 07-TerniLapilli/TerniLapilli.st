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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:37:02'!
test08
	| game |
	game:= TerniLapilli new.
	game putX: 1@1.
	game putO: 2@1.
	game putX: 1@2.
	game putO: 2@2.
	game putX: 1@3.
	game putO: 2@3.	
	self should:[	game putX: 3@3.]  raise:  Error.

! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'availableX availableO board turn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:26:52'!
availableO
^availableO! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:26:44'!
availableX
^availableX! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:49:43'!
checkForValidPointPut: aPoint
	((board at: aPoint x) at: aPoint y) = '' ifFalse: [self  error Error new: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:52:13'!
checkForValidPutBeforeMove
	turn>5 ifTrue: [self  error Error new: self signalInvalidMove ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:46:36'!
checkForValidTurnWithPlayer: aPlayerNumber
	turn\\2 =aPlayerNumber ifTrue: [self  error Error new: self signalInvalidTurn ].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:47:17'!
getAtPosition: point
	^(board at: point x) at: point y! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 19:52:24'!
initialize
availableX:=3.
availableO:=3.
board:=Array with:( Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '').
turn:=0! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:52:47'!
putO: aPoint
	self checkForValidTurnWithPlayer: 0.
	self checkForValidPutBeforeMove.
	self checkForValidPointPut: aPoint.
	(board at: aPoint x) at: aPoint y put: 'O'.
	turn:=turn +1.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:52:37'!
putX: aPoint
	self checkForValidTurnWithPlayer: 1.
	self checkForValidPutBeforeMove.
	self checkForValidPointPut: aPoint.
	(board at: aPoint x) at: aPoint y put: 'X'.
	turn:=turn +1.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:03:14'!
turn
	^turn! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: 'availableX availableO'!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:29:57'!
signalInvalidMove
^'This is not a valid move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/1/2018 20:21:01'!
signalInvalidTurn
^'This is not a valid turn'! !
