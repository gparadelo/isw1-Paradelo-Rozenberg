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

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 22:03:11'!
- unNumeroDePeano

	self error: 'No se puede restar un numero menor a un numero mayor o igual'! !

!I class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:35'!
/ unNumeroDePeano
	
	unNumeroDePeano = I ifTrue: [^ I].
	self error: 'No se puede dividir'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:40'!
> unNumeroDePeano

	^ false.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:43:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	 ^'No se puede dividir un numero menor a un numero mayor o igual'! !

!I class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:33:40'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar un numero menor a un numero mayor o igual'! !

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

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:27'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].

	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 21:14:04'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/15/2018 23:43:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!II class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 09:28:20'!
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

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
* unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano)! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
- unNumeroDePeano

"	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous"
	^unNumeroDePeano restar: self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].

	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 09:28:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
previous

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
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

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
* unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
- unNumeroDePeano

"	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous"
	^unNumeroDePeano restar: self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].

	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
> unNumeroDePeano

	self previous = unNumeroDePeano ifTrue:[^true]. 
	^self previous > unNumeroDePeano.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero menor a un numero mayor o igual'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 09:28:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
previous

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 9/16/2018 08:52:39'!
restar: unNumerodePeano
	^ (unNumerodePeano previous) - (self previous)! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!