!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:01:00'!
initialize

	topNode := NullNode new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:06:35'!
isEmpty

	^topNode isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:50:33'!
pop

	| poppedNode |
	poppedNode := topNode.
	topNode := poppedNode previousNode.
	^poppedNode top. 
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:16:52'!
push: anObject
	
	| newNode |	
	newNode := StackableNode new initializeWith: anObject onTopOf: topNode.
	topNode := newNode.
	^anObject.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:03:26'!
size

	^topNode size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:08:56'!
top
	
	^topNode top.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'container'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'MS 6/9/2021 22:43:42'!
find: prefix in: stack
	| auxStack list res|
	auxStack := OOStack new.
	list := OrderedCollection new.
	stack isEmpty whileFalse: [
		list add: stack pop.
	].
	
	res := list collect: [self beginsWith: prefix].
	
	list do: [auxStack push: self.].
	
	stack isEmpty whileFalse: [
		stack push: auxStack pop.
	].
	
	^res.
	! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: 'previousNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:52:07'!
previousNode
	
	^previousNode.! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
StackNode subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:50:05'!
initialize 

	previousNode := self.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:12:11'!
isEmpty 

	^true.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:20:05'!
pop

	^self top.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 20:58:16'!
size
	
	^0.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:32:32'!
top

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #StackableNode category: 'Stack-Exercise'!
StackNode subclass: #StackableNode
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 20:57:08'!
initializeWith: anElement onTopOf: aNode

	element := anElement. 
	previousNode := aNode.
	! !

!StackableNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:33:42'!
isEmpty 

	^false.! !

!StackableNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 20:57:55'!
size

	^ previousNode size + 1! !

!StackableNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 20:48:14'!
top

	^element.! !
