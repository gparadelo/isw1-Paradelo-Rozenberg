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

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:12:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
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


!classDefinition: #III category: #'Quinta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta Actividad'!
III class
	instanceVariableNames: 'next prev'!

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:53'!
* unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano)! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:53'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:53'!
- unNumeroDePeano

"	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous"
	^unNumeroDePeano restar: self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
/ unNumeroDePeano
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^ unNumeroDePeano divideA: self.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
divideA: unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].
	
	^ I + (self divideA: (unNumeroDePeano - self)).! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:12:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
prev

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
previous

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
restar: unNumerodePeano
	^ (unNumerodePeano previous) - (self previous)! !


!classDefinition: #IIII category: #'Quinta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta Actividad'!
IIII class
	instanceVariableNames: 'next prev'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
* unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
- unNumeroDePeano

"	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous"
	^unNumeroDePeano restar: self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
/ unNumeroDePeano
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^ unNumeroDePeano divideA: self.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
divideA: unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].
	
	^ I + (self divideA: (unNumeroDePeano - self)).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:12:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
prev

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
previous

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/17/2018 15:11:54'!
restar: unNumerodePeano
	^ (unNumerodePeano previous) - (self previous)! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!