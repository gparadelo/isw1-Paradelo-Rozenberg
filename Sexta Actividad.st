!classDefinition: #BooleanTest category: #'Sexta Actividad'!
DenotativeObject subclass: #BooleanTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BooleanTest class' category: #'Sexta Actividad'!
BooleanTest class
	instanceVariableNames: ''!

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:26:32'!
test01LaNegacionDeVerdaderoEsFalso
	
		Assert that: Verdadero no isEqualTo: Falso! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:28:59'!
test02LaNegacionDeFalsoEsVerdadero

	Assert that: Falso no isEqualTo: Verdadero! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:37:13'!
test03VerdaderoYVerdaderoEsVerdadero

	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:44:31'!
test04VerdaderoYFalsoEsFalso

	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:48:11'!
test05FalsoYUnBooleanoEsFalso

	Assert that: (Falso y: Falso) isEqualTo: Falso.
	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:57:46'!
test06VerdaderoOUnBooleanoEsVerdadero

	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero.
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 20:55:31'!
test07FalsoOUnBooleanoeEsEseBooleano

	Assert that: (Falso o: Falso) isEqualTo: Falso.
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 21:13:32'!
test08VerdaderoSiVerdaderoEvaluaElClosure

	| indicadorQueSeEvaluo |
	indicadorQueSeEvaluo _ #NoEvaluo.
	
	Verdadero siVerdadero: [indicadorQueSeEvaluo _ #Evaluo].
				
	Assert that: (indicadorQueSeEvaluo) isEqualTo: #Evaluo.! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 21:17:46'!
test09FalsoSiVerdaderoNoEvaluaElClosure

	| indicadorQueSeEvaluo |
	indicadorQueSeEvaluo _ #NoEvaluo.
	
	Falso siVerdadero: [indicadorQueSeEvaluo _ #Evaluo].
				
	Assert that: (indicadorQueSeEvaluo) isEqualTo: #NoEvaluo.! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 21:20:05'!
test10FalsoSiFalsoEvaluaElClosure

	| indicadorQueSeEvaluo |
	indicadorQueSeEvaluo _ #NoEvaluo.
	
	Falso siFalso: [indicadorQueSeEvaluo _ #Evaluo].
				
	Assert that: (indicadorQueSeEvaluo) isEqualTo: #Evaluo.! !

!BooleanTest class methodsFor: 'as yet unclassified' stamp: 'GP 9/10/2018 21:22:07'!
test11VerdaderoSiFalsoNoEvaluaElClosure

	| indicadorQueSeEvaluo |
	indicadorQueSeEvaluo _ #NoEvaluo.
	
	Verdadero siFalso: [indicadorQueSeEvaluo _ #Evaluo].
				
	Assert that: (indicadorQueSeEvaluo) isEqualTo: #NoEvaluo.! !


!classDefinition: #Falso category: #'Sexta Actividad'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Sexta Actividad'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:31:18'!
no
	
	^Verdadero.! !

!Falso class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:54:32'!
o: unBooleano 
	
	^unBooleano! !

!Falso class methodsFor: 'operadores' stamp: 'GP 9/10/2018 21:21:15'!
siFalso: unClosure
 
	unClosure value.! !

!Falso class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:50:19'!
y: unBooleano 
	
	^self! !


!Falso class methodsFor: 'condicionales' stamp: 'GP 9/10/2018 21:19:07'!
siVerdadero: unClosure! !


!classDefinition: #Verdadero category: #'Sexta Actividad'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Sexta Actividad'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:31:42'!
no
	
	^Falso.! !

!Verdadero class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:52:44'!
o: unBooleano 
	
	^self! !

!Verdadero class methodsFor: 'operadores' stamp: 'GP 9/10/2018 20:45:32'!
y: unBooleano 
	
	^unBooleano! !


!Verdadero class methodsFor: 'condicionales' stamp: 'GP 9/10/2018 21:22:35'!
siFalso: unClosure! !

!Verdadero class methodsFor: 'condicionales' stamp: 'GP 9/10/2018 21:15:41'!
siVerdadero: unClosure 
	unClosure value.! !
