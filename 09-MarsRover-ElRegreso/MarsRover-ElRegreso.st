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

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:16:57'!
test01
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger of: marsRover tracking: #Position.
		
	self assert: (OrderedCollection new) equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:18:44'!
test02
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger of: marsRover tracking: #Position.
	
	marsRover processCommands: 'f'.
		
	self assert: (OrderedCollection with: '0@1') equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:26:12'!
test03
	
	| marsRover positionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionLogger := MarsRoverLogger of: marsRover tracking: #Position.
	
	marsRover processCommands: 'ff'.
		
	self assert: (OrderedCollection with: '0@1' with: '0@2') equals: positionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:27:55'!
test04
	
	| marsRover headingDirectionLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	headingDirectionLogger := MarsRoverLogger of: marsRover tracking: #HeadingDirection.
	
	marsRover processCommands: 'r'.
		
	self assert: (OrderedCollection with: 'East') equals: headingDirectionLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:37:29'!
test05
	
	| marsRover mixedLogger |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedLogger := MarsRoverLogger of: marsRover tracking: #Mixed.
	
	marsRover processCommands: 'f'.
		
	self assert: (OrderedCollection with: '0@1 North') equals: mixedLogger display.   ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:44:29'!
test06
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverWindow of: marsRover tracking: #Position.
	
	marsRover processCommands: 'f'.
		
	self assert: '0@1' equals: positionWindow display.  ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:52:27'!
test07
	
	| marsRover positionWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	positionWindow := MarsRoverWindow of: marsRover tracking: #Position.
	
	marsRover processCommands: 'ff'.
		
	self assert: '0@2' equals: positionWindow display.  ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:58:23'!
test08
	
	| marsRover mixedLogger mixedWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
		
	mixedWindow := MarsRoverWindow of: marsRover tracking: #Mixed.
	
	mixedLogger := MarsRoverLogger of: marsRover tracking: #Mixed. 
	
	marsRover processCommands: 'fr'.
		
	self assert: '0@1 East' equals: mixedWindow display. 
	
	self assert: (OrderedCollection with: '0@1 North' with: '0@1 East') equals: mixedLogger display. 
	 ! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logger window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'LL 6/30/2021 19:47:14'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'SIA 7/18/2021 19:53:58'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
		logger ifNotNil: [
			(logger type = #Position) ifTrue: [logger add: position asString].
			(logger type = #HeadingDirection) ifTrue: [logger add: head asString].
			(logger type = #Mixed) ifTrue: [logger add: (position asString) ,' ', (head asString)].
		].
		window ifNotNil: [
			(window type = #Position) ifTrue: [window update: position asString].
			(window type = #HeadingDirection) ifTrue: [window update: head asString].
			(window type = #Mixed) ifTrue: [window update: (position asString) ,' ', (head asString)].].		
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


!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:33'!
moveDown

	position := position + (0@-1)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:16'!
moveLeft

	position := position + (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:09:03'!
moveRight

	position := position + (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:48'!
moveUp

	position := position + (0@1)! !


!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headEast

	head := MarsRoverHeadFacingEast of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headWest

	head := MarsRoverHeadFacingWest of: self.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:20:58'!
addLogger: aLogger
	
	logger := aLogger! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:47:11'!
addWindow: aWindow
	
	window := aWindow! !

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


!classDefinition: #MarsRoverLogger category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'marsRover typeOfLogger type log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'SIA 7/18/2021 19:24:57'!
initializeWith: aMarsRover tracking: aTypeOfLogger 
	
	marsRover := aMarsRover.
	type := aTypeOfLogger.
	log := OrderedCollection new.
	
	marsRover addLogger: self.! !


!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:25:38'!
add: aLogLine

	^log add: aLogLine.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:19:43'!
display
	^log! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:34:24'!
type
	^type! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: 'MarsRover-Solucion'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:12:19'!
of: aMarsRover tracking: aTypeOfLogger
	^self new initializeWith: aMarsRover tracking: aTypeOfLogger.! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'marsRover type displayableWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:55:23'!
display
	
	^displayableWindow ! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:49:45'!
initializeWith: aMarsRover tracking: aTypeOfWindow
	
	marsRover := aMarsRover.
	type := aTypeOfWindow. 
	aMarsRover addWindow: self.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:55:50'!
type
	
	^type ! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:55:10'!
update: aWindowLine
	
	^displayableWindow:= aWindowLine.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: 'MarsRover-Solucion'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'as yet unclassified' stamp: 'SIA 7/18/2021 19:45:26'!
of: aMarsRover tracking: aTypeOfWindow
	
	^self new initializeWith: aMarsRover tracking: aTypeOfWindow.! !
