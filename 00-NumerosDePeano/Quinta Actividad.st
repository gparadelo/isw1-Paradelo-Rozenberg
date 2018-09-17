!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 11:17:40'!
* unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:44:20'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 12:13:47'!
- unNumeroDePeano
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados 
	"self error: 'No se puede restar un numero menor a un numero mayor o igual'"! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 12:15:25'!
/ unNumeroDePeano
	
	unNumeroDePeano = I ifTrue: [^ I].
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor .! !

!I class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:40'!
> unNumeroDePeano

	^ false.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:43:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	 ^'No se puede dividir un numero menor a un numero mayor o igual'! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:33:40'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar un numero menor a un numero mayor o igual'! !

!I class methodsFor: 'as yet unclassified' stamp: 'GP 9/16/2018 17:15:25'!
divideA: unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:45:06'!
restar: unNumeroDePeano
	^unNumeroDePeano previous! !


!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 21:14:04'!
* unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano)! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 21:14:04'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:50:38'!
- unNumeroDePeano

"	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous"
	^unNumeroDePeano restar: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/16/2018 17:00:53'!
/ unNumeroDePeano
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^ unNumeroDePeano divideA: self.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 21:14:04'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:43:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/16/2018 17:11:07'!
divideA: unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].
	
	^ I + (self divideA: (unNumeroDePeano - self)).! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/16/2018 17:17:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:48:10'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:49:14'!
prev

	^prev! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:48:32'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 21:14:04'!
previous

	^prev! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:26:42'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:44:12'!
restar: unNumerodePeano
	^ (unNumerodePeano previous) - (self previous)! !

II initializeAfterFileIn!