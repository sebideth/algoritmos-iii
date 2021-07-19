!classDefinition: #MarsRoverTests category: 'TDD-MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:38:12'!
eliminadoPorRepeticiontest04
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingSouth new. 
	
	marsRover processCommands: 'l'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingEast).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:39:28'!
eliminadoPorRepeticiontest05
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingSouth new. 
	
	marsRover processCommands: 'r'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading:  MarsRoverHeadingWest).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:39:35'!
eliminadoPorRepeticiontest06
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingEast new.
	
	marsRover processCommands: 'l'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:39:42'!
eliminadoPorRepeticiontest07
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingEast new.
	
	marsRover processCommands: 'r'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingSouth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:39:57'!
eliminadoPorRepeticiontest08
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingWest new.
	
	marsRover processCommands: 'l'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingSouth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:40:08'!
eliminadoPorRepeticiontest09
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingWest new.
	
	marsRover processCommands: 'r'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:40:47'!
eliminadoPorRepeticiontest11
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@1 pointing: MarsRoverHeadingNorth new.
	
	marsRover processCommands: 'f'.
	
	self assert: (marsRover isAtCoordinates: 0@2 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:41:35'!
eliminadoPorRepeticiontest13
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingSouth new.
	
	marsRover processCommands: 'f'.
	
	self assert: (marsRover isAtCoordinates: 0@-1 andHeading: MarsRoverHeadingSouth ).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:41:43'!
eliminadoPorRepeticiontest14
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingSouth new.
	
	marsRover processCommands: 'b'.
	
	self assert: (marsRover isAtCoordinates: 0@1 andHeading: MarsRoverHeadingSouth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:31:17'!
test01NoMovementWithEmptyCommandString 
	
	| marsRover |
	
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new. 
	
	marsRover processCommands: ''.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:31:53'!
test02MarsRoverRotatesLeftCorrectly 
	
	| marsRover |
	
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new. 
	
	marsRover processCommands: 'l'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingWest).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:32:34'!
test03MarsRoverRotatesRightCorrectly 
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new. 
	
	marsRover processCommands: 'r'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading: MarsRoverHeadingEast).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:40:28'!
test04MarsRoverMovesForwardCorrectly
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new.
	
	marsRover processCommands: 'f'.
	
	self assert: (marsRover isAtCoordinates: 0@1 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:41:15'!
test05MarsRoverMovesBackwardsCorrectly
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new.
	
	marsRover processCommands: 'b'.
	
	self assert: (marsRover isAtCoordinates: 0@-1 andHeading: MarsRoverHeadingNorth).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:42:38'!
test06MarsRoverMovesCorrectlyWithMultipleCommandString
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new.
	
	marsRover processCommands: 'frfrflb'.
	
	self assert: (marsRover isAtCoordinates: 0@0 andHeading:  MarsRoverHeadingEast).
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:43:15'!
test07WrongCommandRaisesAnError
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new. 
	
	self
		should: [ marsRover processCommands: 'x'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRoverCommand unknownCommandError ].
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:43:59'!
test08MarsRoverStopsMovingAfterWrongCommand
	
	| marsRover |
	marsRover := MarsRover atCoordinates: 0@0 pointing: MarsRoverHeadingNorth new. 
	
	self
		should: [ marsRover processCommands: 'fffxfff'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRoverCommand unknownCommandError ].
		
	self assert: (marsRover isAtCoordinates: 0@3 andHeading: MarsRoverHeadingNorth).
	
	
	! !


!classDefinition: #MarsRover category: 'TDD-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'direction position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 21:44:20'!
initializeAtCoordinates: aPoint andPointing: aDirection
	
	position := aPoint.
	direction := aDirection.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:38:43'!
isAtCoordinates: aPoint andHeading: aDirection
	
	^aPoint = position and: [direction class = aDirection].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
moveBackwards

		position:= position - (direction increasementPositionOf: self). ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
moveForward

	position:= position + (direction increasementPositionOf: self). 

	"direction class = MarsRoverHeadingNorth ifTrue:[ position := position + (0@1)].
	
	direction class = MarsRoverHeadingSouth ifTrue:[ position := position + (0@-1)].
	
	direction class = MarsRoverHeadingEast ifTrue:[ position := position + (1@0)].
	
	direction class = MarsRoverHeadingWest ifTrue:[ position := position + (-1@0)]."
	
		"Norte moverseadelante: marsRover
			
			marsRover nuevaposicionhaciaadelanteapuntadoalnorte
						(0@1)
						
				position := position + "
				
			
		
		! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:22:05'!
movementOnEastDirection
 
	^(1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:22:22'!
movementOnNorthDirection
 
	^(0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:22:29'!
movementOnSouthDirection
 
	^(0@-1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:22:14'!
movementOnWestDirection
 
	^(-1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:08:34'!
processCommands: aString
	
	 | commands | 
	
	commands := aString asArray.
	
	commands do: [:aCommand |  (MarsRoverCommand with: aCommand) executeOn: self].

				! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:57:24'!
rotateLeft

	direction := direction directionAfterLeftRotation! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:57:35'!
rotateRight

	direction := direction directionAfterRightRotation! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'TDD-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 21:44:35'!
atCoordinates: aPoint pointing: aDirection

	^self new initializeAtCoordinates: aPoint andPointing: aDirection.! !


!classDefinition: #MarsRoverCommand category: 'TDD-MarsRover'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: 'direction position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverCommand methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:06:03'!
executeOn: aMarsRover 
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'TDD-MarsRover'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:05:37'!
unknownCommandError

	^'Unkown command'! !

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:04:30'!
with: aCharacter

	aCharacter = $f ifTrue: [^Forward new].
	aCharacter = $b ifTrue: [^Backward new].
	aCharacter = $r ifTrue: [^Right new].
	aCharacter = $l ifTrue: [^Left new].
	^self error: self unknownCommandError.! !


!classDefinition: #Backward category: 'TDD-MarsRover'!
MarsRoverCommand subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:06:24'!
executeOn: aMarsRover 
	
	aMarsRover moveBackwards. ! !


!classDefinition: #Forward category: 'TDD-MarsRover'!
MarsRoverCommand subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:06:36'!
executeOn: aMarsRover 
	
	aMarsRover moveForward. ! !


!classDefinition: #Left category: 'TDD-MarsRover'!
MarsRoverCommand subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Left methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:06:47'!
executeOn: aMarsRover 
	
	aMarsRover rotateLeft. ! !


!classDefinition: #Right category: 'TDD-MarsRover'!
MarsRoverCommand subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Right methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:06:59'!
executeOn: aMarsRover 
	
	aMarsRover rotateRight. ! !


!classDefinition: #MarsRoverDirection category: 'TDD-MarsRover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:49:34'!
directionAfterLeftRotation
	
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:49:40'!
directionAfterRightRotation
	
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
increasementPositionOf: aMarsRover
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverHeadingEast category: 'TDD-MarsRover'!
MarsRoverDirection subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:51:16'!
directionAfterLeftRotation
	
	^MarsRoverHeadingNorth new.! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:51:39'!
directionAfterRightRotation
	
	^MarsRoverHeadingSouth new.! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
increasementPositionOf: aMarsRover
	
	^aMarsRover movementOnEastDirection.! !


!classDefinition: #MarsRoverHeadingNorth category: 'TDD-MarsRover'!
MarsRoverDirection subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:52:26'!
directionAfterLeftRotation
	
	^MarsRoverHeadingWest new.! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:52:15'!
directionAfterRightRotation
	
	^MarsRoverHeadingEast new.! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
increasementPositionOf: aMarsRover
	
	^aMarsRover movementOnNorthDirection.! !


!classDefinition: #MarsRoverHeadingSouth category: 'TDD-MarsRover'!
MarsRoverDirection subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:52:46'!
directionAfterLeftRotation
	
	^MarsRoverHeadingEast new.! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:52:37'!
directionAfterRightRotation
	
	^MarsRoverHeadingWest new.! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
increasementPositionOf: aMarsRover
	
	^aMarsRover movementOnSouthDirection.! !


!classDefinition: #MarsRoverHeadingWest category: 'TDD-MarsRover'!
MarsRoverDirection subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:51:51'!
directionAfterLeftRotation
	
	^MarsRoverHeadingSouth new.! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 22:51:59'!
directionAfterRightRotation
	
	^MarsRoverHeadingNorth new.! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 23:28:45'!
increasementPositionOf: aMarsRover
	
	^aMarsRover movementOnWestDirection.! !
