!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 00:57:56'!
* aMultiplier 
	
	^ aMultiplier multiplicarEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/26/2018 22:23:18'!
+ anAdder 
	^anAdder sumarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 9/28/2018 15:20:06'!
- aSubtrahend 
	
	^ aSubtrahend restarAEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:04:37'!
/ aDivisor 
	
	^aDivisor dividirEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:24:24'!
// aDivisor 
	
	^ Entero with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:55:18'!
assertIsAValidDivisor
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:12:40'!
dividirEntero: aDividend
	
	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:03:08'!
dividirFraccion: aDividend
	
	^( aDividend numerator) / (self * aDividend denominator )! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 9/29/2018 16:33:47'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:24:43'!
greatestCommonDivisorWith: anEntero 
	
	^ Entero with: (self integerValue gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 9/29/2018 20:56:41'!
initializeFractionOverSelf: aDividend

	^ Fraccion new initializeWith: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:24:53'!
multiplicarEntero: aMultiplier 
	
	^ Entero with: self integerValue * aMultiplier integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 9/29/2018 20:56:55'!
over: aDivisor
	
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^ denominator initializeFractionOverSelf: numerator.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:25:07'!
restarAEntero: aSubtrahend
	^ Entero with: aSubtrahend integerValue - self integerValue.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 9/28/2018 15:38:50'!
restarAFraccion: aSubtrahend

	| newNumerator |
	
	newNumerator := ( aSubtrahend numerator ) - ( self * aSubtrahend denominator ).
	
	^ newNumerator / aSubtrahend denominator.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'GP 10/1/2018 15:26:07'!
sumarEntero: anAdder
	^Entero with: self integerValue + anAdder integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/26/2018 23:35:39'!
sumarFraccion: anAdder 
	
	| newNumerator  |
	
	newNumerator := (self * anAdder denominator) +  anAdder numerator.
	
	^newNumerator / anAdder denominator ! !


!Entero methodsFor: 'comparing' stamp: 'GP 10/1/2018 15:33:17'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'GP 10/1/2018 15:51:24'!
hash

	^self integerValue hash! !



!Entero methodsFor: 'value' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 00:52:10'!
multiplicarFraccion: aMultiplier 
	
	^(self * aMultiplier numerator) / ( aMultiplier denominator)
	! !


!Entero methodsFor: 'printing' stamp: 'GP 10/1/2018 15:49:44'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'testing' stamp: 'GP 10/1/2018 15:29:13'!
isNegative
	
	^ self integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'GP 10/1/2018 15:29:06'!
isOne
	
	^ self integerValue = 1! !

!Entero methodsFor: 'testing' stamp: 'GP 10/1/2018 15:28:57'!
isZero
	
	^self integerValue = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 9/23/2018 22:17:16'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para enteros negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'GP 10/1/2018 15:48:59'!
with: aValue 
	
	| enteroClass |
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].

	enteroClass _ self subclasses detect: [ :unEnteroClass | unEnteroClass isFor: aValue ].
	
	^ enteroClass crearCon: aValue.
! !


!classDefinition: #Cero category: #'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:24:36'!
/ aDividend

	^ self.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 20:25:54'!
assertIsAValidDivisor

	self error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:19:33'!
fibonacci

	^Entero with: 1.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:23:22'!
integerValue

	^ 0.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 20:32:02'!
over: aDivisor

	^ self.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:44:39'!
value

	^ 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Exercise'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:20:48'!
crear

	^ self new.! !

!Cero class methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:38:34'!
crearCon: aValue

	^ self new.! !

!Cero class methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 19:20:53'!
isFor: aValue

	^ 0 = aValue.! !


!classDefinition: #Negativo category: #'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:34:23'!
fibonacci

	^self error: Entero negativeFibonacciErrorDescription ! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:39:38'!
inicializarCon: aValue 
	
	value := aValue! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:24:06'!
integerValue

	^ value! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 20:43:43'!
over: aDivisor

	^ self negated / aDivisor negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: #'Numero-Exercise'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:39:51'!
crearCon: aValue

	^ self new inicializarCon: aValue.! !

!Negativo class methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 19:21:29'!
isFor: aValue

	^ 0 > aValue.! !


!classDefinition: #Positivo category: #'Numero-Exercise'!
Entero subclass: #Positivo
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positivo methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:28:32'!
inicializarCon: aValue

	value := aValue.! !

!Positivo methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:23:54'!
integerValue

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivo class' category: #'Numero-Exercise'!
Positivo class
	instanceVariableNames: ''!

!Positivo class methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:28:01'!
crearCon: aValue

	^self new inicializarCon: aValue.! !

!Positivo class methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:27:32'!
isFor: aValue

	^ aValue > 1.! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 16:19:21'!
fibonacci

	^self.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 20:57:06'!
initializeFractionOverSelf: aDividend

	^ aDividend! !

!Uno methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:23:35'!
integerValue

	^ 1.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:44:05'!
value

	^ 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'GP 10/1/2018 15:38:45'!
crearCon: aValue

	^ self new.! !

!Uno class methodsFor: 'as yet unclassified' stamp: 'GP 9/29/2018 19:20:36'!
isFor: aValue

	^ 1 = aValue.! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 00:58:14'!
* aMultiplier 
	
	^aMultiplier multiplicarFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/26/2018 23:24:40'!
+ anAdder 
	^ anAdder sumarFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'GP 9/28/2018 15:32:09'!
- aSubtrahend 

	^ aSubtrahend restarAFraccion: self.
	
	"^self + ((Entero with: -1)*aSubtrahend )."
	"| newNumerator newDenominator |
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator "
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:05:46'!
/ aDivisor 
	
	^aDivisor dividirFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:01:44'!
dividirEntero: aDividend 
	
	^(denominator * aDividend ) /  numerator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 01:15:18'!
dividirFraccion: aDividend 
	
	^(aDividend numerator *  denominator) / (aDividend denominator *  numerator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 00:39:52'!
multiplicarFraccion: aMultiplier 
	
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'GP 9/28/2018 15:31:07'!
restarAEntero: aSubtrahend

	| newNumerator |
	
	newNumerator := ( denominator * aSubtrahend ) - numerator.
	
	^ newNumerator / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'GP 9/28/2018 15:36:03'!
restarAFraccion: aSubtrahend

	| newNumerator newDenominator|
	
	newNumerator := ( denominator * aSubtrahend numerator ) - ( numerator * aSubtrahend denominator ).
	newDenominator := denominator * aSubtrahend denominator.
	
	^ newNumerator/ newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/26/2018 19:35:19'!
sumarEntero: anAdder
	
	| newNumerator |
	
	newNumerator := numerator  + (denominator * anAdder).
	
	^newNumerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Uriel Jonathan Rozenberg 9/26/2018 23:24:03'!
sumarFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !

!Fraccion methodsFor: 'comparing' stamp: 'Uriel Jonathan Rozenberg 9/27/2018 00:53:19'!
multiplicarEntero: aMultiplier 
	
	^(numerator * aMultiplier ) / denominator
	! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'GP 9/29/2018 20:36:15'!
with: aDividend over: aDivisor
	
	aDivisor assertIsAValidDivisor .
	
	^ aDividend over: aDivisor.
	
! !
