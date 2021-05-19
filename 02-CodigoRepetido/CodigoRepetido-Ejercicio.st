!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 17:50:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertThat: [customerBook addCustomerNamed: 'John Lennon'.] takesLessTimeThan: (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 17:55:45'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.

	self assertThat: [customerBook removeCustomerNamed: paulMcCartney.] takesLessTimeThan: (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:15:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self assertThat: [ customerBook addCustomerNamed: ''.] 
	launchesAnException: Error 
	andDo: [:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:18:08'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat: [ customerBook removeCustomerNamed: 'Paul McCartney'.] 
	launchesAnException:  NotFound  
	andDo: [	
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)  ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:42:17'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkNumbersOfCustomersFrom: customerBook activeCustomers: 0 suspendedCustomers: 1 totalCustomers: 1 andCheck:  [
		self assert: (customerBook includesCustomerNamed: paulMcCartney).
		] 
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:44:36'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self checkNumbersOfCustomersFrom: customerBook activeCustomers: 0 suspendedCustomers: 0 totalCustomers: 0 andCheck: [
		self deny: (customerBook includesCustomerNamed: paulMcCartney).
	]


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:46:37'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat: [customerBook suspendCustomerNamed: 'Ringo Starr'.] 
	launchesAnException: CantSuspend andDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MS 5/19/2021 18:48:32'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self assertThat: [customerBook suspendCustomerNamed: johnLennon.]
	launchesAnException: CantSuspend andDo: [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon) 
	]
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'MS 5/19/2021 18:13:58'!
assertThat: codeBlock launchesAnException: anException andDo: assertion
	
	[ codeBlock value.
	self fail ]
		on: anException 
		do: [ assertion ]! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'MS 5/19/2021 17:47:25'!
assertThat: aCodeBlock takesLessTimeThan: timeInMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aCodeBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < timeInMilliseconds
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'MS 5/19/2021 18:37:43'!
checkNumbersOfCustomersFrom: aCustomerBook activeCustomers: expectedNumberOfActiveCustomers suspendedCustomers: expectedNumberOfSuspendedCustomers totalCustomers: expectedNumberOfTotalCustomers andCheck: aCodeBlock

	self assert: expectedNumberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: expectedNumberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: expectedNumberOfTotalCustomers equals: aCustomerBook numberOfCustomers.
	aCodeBlock value.
	

	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MS 5/19/2021 19:13:24'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 5/19/2021 19:16:22'!
removeCustomerNamed: aName 
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^NotFound signal]
	]! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 5/19/2021 19:28:29'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'MS 5/19/2021 19:21:20'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
