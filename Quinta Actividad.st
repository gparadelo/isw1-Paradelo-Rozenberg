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

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !


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

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 11:18:53'!
* unNumeroDePeano

	^unNumeroDePeano + (self prev * unNumeroDePeano)! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 11:19:19'!
+ unNumeroDePeano

	^self prev + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 22:01:57'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self prev].

	^self prev - unNumeroDePeano prev! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:27'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].

	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:22'!
> unNumeroDePeano

	self prev = unNumeroDePeano ifTrue:[^true]. 
	^self prev > unNumeroDePeano.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:59'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:26:42'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


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

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
* unNumeroDePeano

	^unNumeroDePeano + (self prev * unNumeroDePeano)! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
+ unNumeroDePeano

	^self prev + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self prev].

	^self prev - unNumeroDePeano prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].
	"unNumeroDePeano > self ifTrue:[self error: 'No se puede dividir por un numero mayor']."
	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
> unNumeroDePeano

	self prev = unNumeroDePeano ifTrue:[^true]. 
	^self prev > unNumeroDePeano.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
prev

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:51'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


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

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
* unNumeroDePeano

	^unNumeroDePeano + (self prev * unNumeroDePeano)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
+ unNumeroDePeano

	^self prev + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self prev].

	^self prev - unNumeroDePeano prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue:[^I].
	"unNumeroDePeano > self ifTrue:[self error: 'No se puede dividir por un numero mayor']."
	^ I + ((self - unNumeroDePeano) / unNumeroDePeano)
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
> unNumeroDePeano

	self prev = unNumeroDePeano ifTrue:[^true]. 
	^self prev > unNumeroDePeano.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:38:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
prev

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 15:33:52'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!