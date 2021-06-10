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

!OOStackTest methodsFor: 'test' stamp: 'MS 6/10/2021 01:17:27'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MS 6/10/2021 01:17:27'!
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

!OOStackTest methodsFor: 'test' stamp: 'MS 6/10/2021 01:17:27'!
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
	instanceVariableNames: 'str1 str2 str3 str4 str5 str6'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 00:34:15'!
setUp
	
	str1 := 'winter is coming'.
	str2 := 'winning is everything'.
	str3 := 'The winds of Winter'.
	str4 := 'Winter is here'.
	str5 := 'Ola'.
	str6 := 'Test'.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:30:32'!
test01FindReturnsCollectionWithTheSingleRightSentence
	|stack finder expected|
	stack := OOStack new.
	stack push: str4.
	expected := OrderedCollection new.
	expected add: str4.
	finder := SentenceFinderByPrefix new initializeWith: 'Wint' On: stack.
	self assert: finder find equals: expected.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:27:28'!
test02FindDoesNotFindTheSentence
	|stack finder expected|
	stack := OOStack new.
	stack push: str1.
	expected := OrderedCollection new.
	finder := SentenceFinderByPrefix new initializeWith: 'hol' On: stack.
	self assert: finder find equals: expected.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:27:39'!
test03FindDoesNotChangeTheStack
	|stack finder|
	stack := OOStack new.
	stack push: str1.
	stack push: str2.
	stack push: str3.
	finder := SentenceFinderByPrefix new initializeWith: 'win' On: stack.
	finder find.
	self assert: stack pop equals: str3.
	self assert: stack pop equals: str2.
	self assert: stack pop equals: str1.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:28:33'!
test04InitializeWithEmptyPrefixShouldRaiseError
	|stack |
	stack := OOStack new.
	self should: [SentenceFinderByPrefix new initializeWith: '' On: stack.]
	raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixEmptyErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:28:45'!
test05InitializeWithPrefixWithASpaceShouldRaiseError
	|stack |
	stack := OOStack new.
	self should: [SentenceFinderByPrefix new initializeWith: 'ho s' On: stack.]
	raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixHasSpaceErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:28:56'!
test06FindIsCaseSensitive
	|stack finder expected|
	stack := OOStack new.
	stack push: str1.
	stack push: str2.
	stack push: str3.
	stack push: str4.
	finder := SentenceFinderByPrefix new initializeWith: 'winter' On: stack.
	expected := OrderedCollection new.
	expected add: str1.
	self assert: finder find equals: expected.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:29:37'!
test07FindReturnsCollectionWithMultipleSentences
	|stack finder expected|
	stack := OOStack new.
	stack push: str1.
	stack push: str2.
	stack push: str3.
	stack push: str4.
	finder := SentenceFinderByPrefix new initializeWith: 'win' On: stack.
	expected := OrderedCollection new.
	expected add: str2.
	expected add: str1.
	self assert: finder find equals: expected.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:31:53'!
test08FindWhenStackIsEmptyReturnsEmptyCollection
	|stack finder expected|
	stack := OOStack new.
	finder := SentenceFinderByPrefix new initializeWith: 'win' On: stack.
	expected := OrderedCollection new.
	self assert: finder find equals: expected.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:08:51'!
test09FindWithStackWithEmptyStringsAsElements
	|stack finder expected|
	stack := OOStack new.
	stack push: ''.
	stack push: ''.
	finder := SentenceFinderByPrefix new initializeWith: 'sas' On: stack.
	expected := OrderedCollection new.
	self assert: finder find equals: expected.
	! !


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

!OOStack methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:22:02'!
pop

	| poppedNode |
	poppedNode := topNode.
	topNode := poppedNode previousNode.
	^poppedNode containedElement. 
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

!OOStack methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:22:23'!
top
	
	^topNode containedElement.
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
	instanceVariableNames: 'prefix stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:13:45'!
find
	|collectionFromStackElements collectionWithFoundSentences|
	collectionFromStackElements := OrderedCollection new.
	[stack isEmpty] whileFalse: [
		collectionFromStackElements addLast: stack pop.
	].
	
	collectionWithFoundSentences := collectionFromStackElements select: [:element | element beginsWith: prefix.].

	[collectionFromStackElements isEmpty] whileFalse: [
		stack push: collectionFromStackElements removeLast.
	].
	
	^collectionWithFoundSentences.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 00:56:12'!
initializeWith: aPrefix On: aStack
	(aPrefix = '') ifTrue: [self error: self class prefixEmptyErrorDescription].
	((aPrefix findString: ' ') > 0) ifTrue: [self error: self class prefixHasSpaceErrorDescription].
	prefix := aPrefix.
	stack := aStack.
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 00:40:17'!
prefixEmptyErrorDescription
	^'prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 00:44:59'!
prefixHasSpaceErrorDescription
	^'prefix has a space'! !


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

!NullNode methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:17:56'!
containedElement

	^self error: OOStack stackEmptyErrorDescription.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:50:05'!
initialize 

	previousNode := self.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 21:12:11'!
isEmpty 

	^true.! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'SIA 6/9/2021 20:58:16'!
size
	
	^0.! !


!classDefinition: #StackableNode category: 'Stack-Exercise'!
StackNode subclass: #StackableNode
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableNode methodsFor: 'as yet unclassified' stamp: 'MS 6/10/2021 01:21:01'!
containedElement

	^element.! !

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
