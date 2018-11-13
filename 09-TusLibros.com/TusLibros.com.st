!classDefinition: #CarritoTest category: #'TusLibros.com'!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:21:18'!
test00
	| carrito |
	carrito:= Carrito new.
	self assert: carrito contents isEmpty! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:19:05'!
test01
	| carrito catalogo |
	catalogo:=Set with:'ISBN1'.
	carrito:= Carrito with: catalogo.
	carrito addBooks: 'ISBN1' withQuantity:1.

	self assert: (carrito hasBook:'ISBN1').
	self assert:1 equals: (carrito quantityOf: 'ISBN1'). ! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:26:21'!
test02
	| carrito catalogo |
	catalogo:=Set new.
	carrito:= Carrito with: catalogo.
	

	self 
		should: [ carrito addBooks: 'ISBN1' withQuantity:1.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: Carrito bookNotInCatalog equals: anError messageText.
			self assert: carrito isEmpty ].! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:31:31'!
test03
	| carrito catalogo list |
	catalogo:=Set with: 'ISBN1' with: 'ISBN2'.
	carrito:= Carrito with: catalogo.
	
	carrito addBooks: 'ISBN1' withQuantity: 1.
	carrito addBooks: 'ISBN2' withQuantity: 3.
	list := carrito list.
	
	self assert: list nextLine equals: '1 ISBN1'.
	self assert: list nextLine equals: '3 ISBN2'.
	self assert: list atEnd.! !


!classDefinition: #Carrito category: #'TusLibros.com'!
Object subclass: #Carrito
	instanceVariableNames: 'contents catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Carrito methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:27:36'!
addBooks: aBook withQuantity: aQuantity

	( aQuantity <1 ) ifTrue: [self error: self class invalidQuiantity].
	( catalogo includes: aBook ) ifFalse: [self error: self class bookNotInCatalog ].
	contents add: aBook->aQuantity .! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:09:07'!
contents
	^contents! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:55:22'!
hasBook: aBook
	^ contents includesKey: aBook .! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:53:33'!
initialize
contents := Dictionary new.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:53:23'!
initializeWith: aCatalog
catalogo:=aCatalog.
contents := Dictionary new.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:48:12'!
isEmpty
^ contents isEmpty .! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:56:10'!
quantityOf: aBook
	^ contents at: aBook .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #'TusLibros.com'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'as yet unclassified' stamp: 'GP 11/13/2018 18:26:14'!
bookNotInCatalog
	^'No se puede agregar un libro que no esta en el catalogo'.! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 21:00:19'!
invalidQuiantity
	^'El valor tiene que ser mayor a cero'.! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:47:26'!
with: aCatalog
	^self new initializeWith: aCatalog .! !


!classDefinition: #Editorial category: #'TusLibros.com'!
Object subclass: #Editorial
	instanceVariableNames: 'carritos catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Editorial methodsFor: 'as yet unclassified' stamp: 'Uriel Jonathan Rozenberg 11/12/2018 20:21:20'!
initialize
catalogo := Bag new.
carritos := Bag new.! !
