!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverTracking category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverTracking
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:07:53'!
test01
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	self assert: (OrderedCollection new) equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:08:00'!
test02
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	marsRover processCommands: 'f'.
		
	self assert: (OrderedCollection with: '0@1') equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:08:06'!
test03
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	marsRover processCommands: 'ff'.
		
	self assert: (OrderedCollection with: '0@1' with: '0@2') equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:11:00'!
test04
	
	| marsRover headingDirectionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	headingDirectionLogger := MarsRoverLogger new.
	
	marsRover addHeadingObserver: headingDirectionLogger.
	
	marsRover processCommands: 'r'.
		
	self assert: (OrderedCollection with: 'East') equals: headingDirectionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:08:30'!
test05
	
	| marsRover mixedLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: mixedLogger.
	marsRover addHeadingObserver: mixedLogger.
	
	marsRover processCommands: 'fr'.

	self assert: (OrderedCollection with: '0@1'  with: 'East') equals: mixedLogger display.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:10:15'!
test06
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverWindow new.
	
	marsRover addPositionObserver: positionWindow.

	marsRover processCommands: 'f'.
		
	self assert: '0@1' equals: positionWindow display.  ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:10:26'!
test07
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverWindow new.
	
	marsRover addPositionObserver: positionWindow.

	marsRover processCommands: 'ff'.
		
	self assert: '0@2' equals: positionWindow display.  ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:09:44'!
test08
	
	| marsRover mixedLogger mixedWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedWindow := MarsRoverWindow new.
	mixedLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: mixedLogger.
	marsRover addHeadingObserver: mixedLogger.
	
	marsRover addPositionObserver: mixedWindow.
	marsRover addHeadingObserver: mixedWindow.
	
	marsRover processCommands: 'fr'.
		
	self assert: 'East' equals: mixedWindow display. 
	
	self assert: (OrderedCollection with: '0@1' with: 'East') equals: mixedLogger display. 
	 ! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head headingObservers observers positionObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:06:16'!
addHeadingObserver: aHeadingOberver
	
	headingObservers add: aHeadingOberver.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:13:49'!
attatchObserver: anObserver
	
	observers add: anObserver.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:13:38'!
headingChanged

	headingObservers do: [:aHeadingObserver | aHeadingObserver headChangedTo: head].
	"headingLog ifNotNil: [headingLog logHeadChangedTo: head].
	headingWindow ifNotNil: [headingWindow updateHeadingTextFieldFor: head]."! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:22:29'!
notify: aState

	observers do: [:anObserver | anObserver update: aState].
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:21:24'!
positionChanged

	positionObservers do: [:aPositionObserver | aPositionObserver positionChangedTo: position].
! !


!MarsRover methodsFor: 'initialization' stamp: 'MS 7/21/2021 16:05:44'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	headingObservers := OrderedCollection new.
	positionObservers := OrderedCollection new.! !


!MarsRover methodsFor: 'process commands' stamp: 'MS 7/19/2021 21:36:52'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'MS 7/19/2021 21:14:22'!
moveDown
	
	self step: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'MS 7/19/2021 21:14:10'!
moveLeft

	self step: (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'MS 7/19/2021 21:14:03'!
moveRight

	self step: (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'MS 7/19/2021 21:13:56'!
moveUp

	self step: (0@1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'MS 7/21/2021 17:02:36'!
step: aMovement

	position := position + aMovement.
	self positionChanged.
	! !


!MarsRover methodsFor: 'dd - heading' stamp: 'MS 7/19/2021 21:18:30'!
headEast

	self heading: (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'MS 7/19/2021 21:18:19'!
headNorth

	self heading: (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'MS 7/19/2021 21:18:08'!
headSouth

	self heading: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'MS 7/19/2021 21:17:51'!
headWest

	self heading: (MarsRoverHeadFacingWest of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'MS 7/19/2021 21:17:12'!
heading: aNewHeadingDirection

	head := aNewHeadingDirection.
	self headingChanged.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'SIA 6/30/2021 21:44:35'!
atCoordinates: aPoint pointing: aDirection

	^self new initializeAtCoordinates: aPoint andPointing: aDirection.! !


!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:31:23'!
asString
	
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:31:42'!
asString
	
	^'East'! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:33:39'!
asString
	
	^'North'! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:33:46'!
asString
	
	^'South'! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:33:53'!
asString
	
	^'West'! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: 'subjectState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:24:53'!
getSubjectState

	^subjectState! !

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:23:46'!
initializeWith: aSubjectState

	subjectState := aSubjectState.! !

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:24:28'!
update: aSubjectState
	
	subjectState := aSubjectState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverObserver class' category: 'MarsRover-Solucion'!
MarsRoverObserver class
	instanceVariableNames: ''!

!MarsRoverObserver class methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 17:00:36'!
with: aValue

	^self new initializeWith: aValue.
	
	! !


!classDefinition: #HeadingObserver category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #HeadingObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!


!classDefinition: #PositionObserver category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #PositionObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!


!classDefinition: #MarsRoverService category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!


!classDefinition: #MarsRoverLogger category: 'MarsRover-Solucion'!
MarsRoverService subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'MS 7/19/2021 21:25:37'!
initialize
	
	log := OrderedCollection new.! !


!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'MS 7/19/2021 21:24:50'!
display

	^log! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:14:57'!
headChangedTo: aHead
	
	(aHead isKindOf: MarsRoverHeadFacingEast)	 ifTrue: [log add: 'East'].
	(aHead isKindOf: MarsRoverHeadFacingWest)	 ifTrue: [log add: 'West'].
	(aHead isKindOf: MarsRoverHeadFacingNorth)	 ifTrue: [log add: 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth)	 ifTrue: [log add: 'South'].
	! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:15:50'!
positionChangedTo: aPosition
	
	log add: aPosition asString.
	! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
MarsRoverService subclass: #MarsRoverWindow
	instanceVariableNames: 'displayableWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'MS 7/19/2021 21:30:10'!
display
	
	^displayableWindow! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:16:35'!
headChangedTo: aHead
		
	(aHead isKindOf: MarsRoverHeadFacingEast)	 ifTrue: [displayableWindow := 'East'].
	(aHead isKindOf: MarsRoverHeadFacingWest)	 ifTrue: [displayableWindow := 'West'].
	(aHead isKindOf: MarsRoverHeadFacingNorth)	 ifTrue: [displayableWindow := 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth)	 ifTrue: [displayableWindow := 'South'].
	! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'MS 7/21/2021 16:16:56'!
positionChangedTo: aPosition
	
	displayableWindow := aPosition asString.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: 'MarsRover-Solucion'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'as yet unclassified' stamp: 'MS 7/19/2021 20:56:04'!
of: aMarsRover
	
	^self new initializeWith: aMarsRover.! !
