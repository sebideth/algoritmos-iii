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


!classDefinition: #TestMarsRoverObservers category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverObservers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:49:55'!
test01LogIsEmptyWhenMarsRoverDidNotMove
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	self assert: (OrderedCollection new) equals: positionLogger display.   ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:50:51'!
test02APositionLogDisplaysANewPositionAfterMarsRoverMovement
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	marsRover processCommands: 'f'.
		
	self assert: (OrderedCollection with: '0@1') equals: positionLogger display.   ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:51:40'!
test03APositionLogDisplaysMultiplePositionsAfterMarsRoverMovement
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: positionLogger.
	
	marsRover processCommands: 'ff'.
		
	self assert: (OrderedCollection with: '0@1' with: '0@2') equals: positionLogger display.   ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:52:45'!
test04AHeadingDirectionLogDisplaysANewDirectionAfterMarsRoverRotation
	
	| marsRover headingDirectionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	headingDirectionLogger := MarsRoverLogger new.
	
	marsRover addHeadingObserver: headingDirectionLogger.
	
	marsRover processCommands: 'r'.
		
	self assert: (OrderedCollection with: 'East') equals: headingDirectionLogger display.   ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:53:57'!
test05ALogCanDisplayMultipleCollaborators
	
	| marsRover mixedLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: mixedLogger.
	marsRover addHeadingObserver: mixedLogger.
	
	marsRover processCommands: 'fr'.

	self assert: (OrderedCollection with: '0@1'  with: 'East') equals: mixedLogger display.! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:55:43'!
test06APositionWindowDisplaysANewPositionAfterMarsRoverMovement
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionObserver: positionWindow.

	marsRover processCommands: 'f'.
		
	self assert: '0@1' equals: positionWindow display.  ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:56:38'!
test07APositionWindowDisplaysMultiplePositionsAfterMarsRoverMovement
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionObserver: positionWindow.

	marsRover processCommands: 'ff'.
		
	self assert: '0@2' equals: positionWindow display.  ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:58:04'!
test08AHeadingDirectionWindowDisplaysANewDirectionAfterMarsRoverRotation

	| marsRover headingDirectionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	headingDirectionWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingObserver: headingDirectionWindow.

	marsRover processCommands: 'l'.
		
	self assert: 'West' equals: headingDirectionWindow display. ! !

!TestMarsRoverObservers methodsFor: 'tests' stamp: 'SIA 7/22/2021 14:59:03'!
test09ALogAndAStatusWindowWorkCorrectlyAtTheSameTime
	
	| marsRover mixedLogger mixedWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedWindow := MarsRoverStatusWindow new.
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
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'observers' stamp: 'SIA 7/21/2021 20:23:53'!
addHeadingObserver: aHeadingObserver
	
	head attachObserver: aHeadingObserver.! !

!MarsRover methodsFor: 'observers' stamp: 'SIA 7/21/2021 20:24:17'!
addPositionObserver: aPositionObserver
	
	position attachObserver: aPositionObserver.! !


!MarsRover methodsFor: 'initialization' stamp: 'SIA 7/21/2021 21:14:08'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	"position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint."
	
	position := MarsRoverCollaboratorProxy with: aPosition.
	
	head := MarsRoverCollaboratorProxy with: (MarsRoverHead of: self facing: aCardinalPoint).
	
	"headingObservers := OrderedCollection new.
	positionObservers := OrderedCollection new."! !


!MarsRover methodsFor: 'process commands' stamp: 'MS 7/19/2021 21:36:52'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'SIA 7/21/2021 20:46:23'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ].
! !


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

!MarsRover methodsFor: 'dd - moving' stamp: 'SIA 7/22/2021 14:07:47'!
step: aMovement

	position setValue: (position + aMovement).
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

!MarsRover methodsFor: 'dd - heading' stamp: 'SIA 7/22/2021 14:07:41'!
heading: aNewHeadingDirection

	head setValue: aNewHeadingDirection.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!


!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

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

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SIA 7/22/2021 14:28:30'!
updating: anObserver
	
	self subclassResponsibility.! !

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

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SIA 7/22/2021 14:28:54'!
updating: anObserver
	
	anObserver updatingMarsRoverHeadFacingEast.! !

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

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SIA 7/22/2021 14:29:07'!
updating: anObserver
	
	anObserver updatingMarsRoverHeadFacingNorth.! !

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

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SIA 7/22/2021 14:29:16'!
updating: anObserver
	
	anObserver updatingMarsRoverHeadFacingSouth.! !

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

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SIA 7/22/2021 14:29:26'!
updating: anObserver
	
	anObserver updatingMarsRoverHeadFacingWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverObserver methodsFor: 'main protocol' stamp: 'SIA 7/21/2021 23:30:16'!
display
	
	self subclassResponsibility.! !

!MarsRoverObserver methodsFor: 'main protocol' stamp: 'SIA 7/21/2021 23:30:51'!
update: aValue
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'MS 7/19/2021 21:25:37'!
initialize
	
	log := OrderedCollection new.! !


!MarsRoverLogger methodsFor: 'private - update' stamp: 'MS 7/21/2021 16:14:57'!
headChangedTo: aHead
	
	(aHead isKindOf: MarsRoverHeadFacingEast)	 ifTrue: [log add: 'East'].
	(aHead isKindOf: MarsRoverHeadFacingWest)	 ifTrue: [log add: 'West'].
	(aHead isKindOf: MarsRoverHeadFacingNorth)	 ifTrue: [log add: 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth)	 ifTrue: [log add: 'South'].
	! !

!MarsRoverLogger methodsFor: 'private - update' stamp: 'MS 7/21/2021 16:15:50'!
positionChangedTo: aPosition
	
	log add: aPosition asString.
	! !

!MarsRoverLogger methodsFor: 'private - update' stamp: 'SIA 7/22/2021 14:30:50'!
updatingMarsRoverHeadFacingEast
	
	^'East'! !

!MarsRoverLogger methodsFor: 'private - update' stamp: 'SIA 7/22/2021 14:31:15'!
updatingMarsRoverHeadFacingNorth
	
	^'North'! !

!MarsRoverLogger methodsFor: 'private - update' stamp: 'SIA 7/22/2021 14:31:26'!
updatingMarsRoverHeadFacingSouth
	
	^'South'! !

!MarsRoverLogger methodsFor: 'private - update' stamp: 'SIA 7/22/2021 14:31:07'!
updatingMarsRoverHeadFacingWest
	
	^'West'! !


!MarsRoverLogger methodsFor: 'main protocol' stamp: 'MS 7/19/2021 21:24:50'!
display

	^log! !

!MarsRoverLogger methodsFor: 'main protocol' stamp: 'SIA 7/22/2021 15:08:23'!
update: aValue
	
	"log add: (aValue updating: self)."
	
	(aValue isKindOf: MarsRoverHead) ifTrue: [ self headChangedTo: aValue]
	
	ifFalse: [self positionChangedTo: aValue].	! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'displayableWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'MS 7/19/2021 21:30:10'!
display
	
	^displayableWindow! !

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'SIA 7/22/2021 15:08:39'!
update: aValue
	
	"displayableWindow := (aValue updating: self)."
	(aValue isKindOf: MarsRoverHead) ifTrue: [ self headChangedTo: aValue]
	ifFalse: [self positionChangedTo: aValue].	! !


!MarsRoverStatusWindow methodsFor: 'private - update' stamp: 'MS 7/21/2021 16:16:35'!
headChangedTo: aHead
		
	(aHead isKindOf: MarsRoverHeadFacingEast)	 ifTrue: [displayableWindow := 'East'].
	(aHead isKindOf: MarsRoverHeadFacingWest)	 ifTrue: [displayableWindow := 'West'].
	(aHead isKindOf: MarsRoverHeadFacingNorth)	 ifTrue: [displayableWindow := 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth)	 ifTrue: [displayableWindow := 'South'].
	! !

!MarsRoverStatusWindow methodsFor: 'private - update' stamp: 'MS 7/21/2021 16:16:56'!
positionChangedTo: aPosition
	
	displayableWindow := aPosition asString.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusWindow class' category: 'MarsRover-Solucion'!
MarsRoverStatusWindow class
	instanceVariableNames: ''!

!MarsRoverStatusWindow class methodsFor: 'as yet unclassified' stamp: 'MS 7/19/2021 20:56:04'!
of: aMarsRover
	
	^self new initializeWith: aMarsRover.! !


!classDefinition: #MarsRoverCollaboratorProxy category: 'MarsRover-Solucion'!
ProtoObject subclass: #MarsRoverCollaboratorProxy
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverCollaboratorProxy methodsFor: 'initialization' stamp: 'SIA 7/21/2021 20:44:21'!
initializeWith: aValue
	
	value := aValue.
	observers := OrderedCollection new.! !


!MarsRoverCollaboratorProxy methodsFor: 'observers' stamp: 'SIA 7/21/2021 20:44:06'!
attachObserver: anObserver
	
	observers add: anObserver.! !

!MarsRoverCollaboratorProxy methodsFor: 'observers' stamp: 'SIA 7/21/2021 21:05:58'!
notify
	
	observers do: [:anObserver | anObserver  update: value].! !


!MarsRoverCollaboratorProxy methodsFor: 'value' stamp: 'SIA 7/21/2021 20:44:14'!
doesNotUnderstand: aMessage
	
	^aMessage sendTo: value.! !

!MarsRoverCollaboratorProxy methodsFor: 'value' stamp: 'SIA 7/22/2021 14:06:56'!
setValue: aNewValue
	
	value := aNewValue.
	self notify.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCollaboratorProxy class' category: 'MarsRover-Solucion'!
MarsRoverCollaboratorProxy class
	instanceVariableNames: ''!

!MarsRoverCollaboratorProxy class methodsFor: 'as yet unclassified' stamp: 'SIA 7/21/2021 20:45:23'!
with: aValue
	
	^self new initializeWith: aValue.! !
