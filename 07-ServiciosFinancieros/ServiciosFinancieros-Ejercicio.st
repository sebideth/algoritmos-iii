!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:32:20'!
test01PortfolioHasZeroAsBalanceWhenCreated
	
	| portfolio |

	portfolio := Portfolio new.
		
	self assert: portfolio balance equals: (0 * peso). ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:35:13'!
test02BalanceOfAddedAccountEqualsToPortfolioBalance
	
	| account portfolio |
	account := ReceptiveAccount new. 
	
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	
	portfolio addAccount: account. 
	
	self assert: portfolio balance equals: account balance. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:37:30'!
test03SumOfAddedAccountsBalancesEqualsToPortfolioBalance
	
	| accountA portfolio accountB |
	accountA := ReceptiveAccount new. 
	accountB := ReceptiveAccount new.  
	
	Deposit register: 100 * peso on: accountA.
	Deposit register: 200 * peso on: accountB.
	
	portfolio := Portfolio new.
	
	portfolio addAccount: accountA. 
	portfolio addAccount: accountB.
	
	self assert: portfolio balance equals: (accountA balance + accountB balance). ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:40:17'!
test04PortfolioKnowsRegisteredTransactionsOfAddedAccount
	
	| account portfolio  deposit |
	account := ReceptiveAccount new. 
 
	portfolio := Portfolio new.
	
	portfolio addAccount: account. 
	
	deposit := Deposit register: 100 * peso on: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:41:09'!
test05PortfolioDoesNotKnowUnregisteredTransactions
	
	| account portfolio  deposit |
	account := ReceptiveAccount new. 
 
	portfolio := Portfolio new.
	
	portfolio addAccount: account. 
	
	deposit :=  Deposit for: 100 * peso.
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:42:16'!
test06PortfolioKnowsAddedAccountTransactions
	
	| account portfolio  |
	account := ReceptiveAccount new. 
 
	portfolio := Portfolio new.
	
	portfolio addAccount: account. 
	
	Deposit register: 100 * peso on: account.
	
	self assert: (portfolio transactions) equals: account transactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:44:00'!
test07PortfolioKnowsTransactionsOfMultipleAddedAccounts
	
	| accountA accountB portfolio  totalTransactions transactionA transactionB |
	accountA := ReceptiveAccount new. 
	accountB := ReceptiveAccount new. 
 
	portfolio := Portfolio new.
	
	portfolio addAccount: accountA. 
	portfolio addAccount: accountB. 
	
	transactionA := Deposit register: 100 * peso on: accountA.
	transactionB := Withdraw register: 100 * peso on: accountB.
	
	totalTransactions := OrderedCollection new.
	
	totalTransactions add: transactionA.
	totalTransactions add: transactionB.

	self assert: portfolio transactions equals: totalTransactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:46:30'!
test08PortfolioBalanceEqualsToAddedPortfolioBalance
	
	| account portfolioA portfolioB |
	account := ReceptiveAccount new. 
 
	portfolioA := Portfolio new.
	
	portfolioB := Portfolio new.
	
	portfolioB addAccount: account.
	
	Deposit register: 100 * peso on: account. 
	
	portfolioA addAccount: portfolioB. 
	
	self assert: portfolioA balance equals: account balance. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:48:29'!
test09PortfolioKnowsAddedPortfolioTransactions
	
	| accountA accountB portfolioA portfolioB |
	accountA := ReceptiveAccount new. 
	accountB := ReceptiveAccount new. 
 
	portfolioA := Portfolio new.
	
	portfolioB := Portfolio new.
	
	portfolioA addAccount: portfolioB.
	
	portfolioB addAccount: accountA. 
	portfolioB addAccount: accountB. 
	
	Deposit register: 100 * peso on: accountA.
	Withdraw register: 100 * peso on: accountB.

	self assert: portfolioA transactions equals: portfolioB transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:49:08'!
test10PortfolioKnowsRegisteredTransactionsOfAddedPortfolio
	
	| account  portfolioA portfolioB  deposit |
	account := ReceptiveAccount new. 

 
	portfolioA := Portfolio new.
	
	portfolioB := Portfolio new.
	
	portfolioA addAccount: portfolioB.
	
	portfolioB addAccount: account. 
	
	deposit := Deposit register: 100 * peso on: account.

	self assert: (portfolioA hasRegistered: deposit).! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 18:52:19'!
test01ATransferChangesBothAccountBalances

	| senderAccount receiverAccount  |
	
	senderAccount := ReceptiveAccount new.
	
	receiverAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	
	Transfer of: 50 * peso from: senderAccount to: receiverAccount.
	
	self assert: 0 equals: senderAccount balance.
	self assert: 50 * peso equals: receiverAccount balance.
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:06:17'!
test02ATransferRegistersCorrectlyOnSendersAndReceiverAccounts

	| senderAccount receiverAccount  transfer |
	
	senderAccount := ReceptiveAccount new.
	
	receiverAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	
	transfer := Transfer of: 50 * peso from: senderAccount to: receiverAccount.
	
	self assert: (senderAccount hasRegistered: transfer transferWithdrawPart).
	self assert: (receiverAccount hasRegistered: transfer transferDepositPart).
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:28:19'!
test03ATransferPartKnowsItsValue

	| senderAccount receiverAccount  transfer |
	
	senderAccount := ReceptiveAccount new.
	
	receiverAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	
	transfer := Transfer of: 50 * peso from: senderAccount to: receiverAccount.
	
	self assert: ((transfer transferWithdrawPart) value) equals:  50 * peso.
	self assert: ((transfer transferDepositPart) value) equals:  50 * peso.
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:46:58'!
test04ATransferWithdrawPartKnowsItsCounterpart

	| senderAccount receiverAccount  transfer |
	
	senderAccount := ReceptiveAccount new.
	
	receiverAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	
	transfer := Transfer of: 50 * peso from: senderAccount to: receiverAccount.
	
	self assert: ((transfer transferWithdrawPart) counterpart) equals: transfer transferDepositPart.
	self assert: ((transfer transferDepositPart) counterpart) equals: transfer transferWithdrawPart.
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'SIA 7/5/2021 20:45:36'!
effectOnBalance: aBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'SIA 7/5/2021 20:45:23'!
effectOnBalance: aBalance

	^ (aBalance + self value)! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'SIA 7/4/2021 19:38:29'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'SIA 7/5/2021 20:45:01'!
effectOnBalance: aBalance

	^ (aBalance - self value)! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'SIA 7/5/2021 21:03:14'!
addAccount: anAccount
	
	accounts add: anAccount.
! !

!Portfolio methodsFor: 'main protocol' stamp: 'SIA 7/5/2021 21:31:24'!
balance
	
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 18:22:20'!
hasRegistered: aTransaction
	
	^(accounts select: [:anAccount | anAccount hasRegistered: aTransaction]) size > 0
		
	
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 18:09:30'!
transactions
	
	| Totaltransactions |
	
	Totaltransactions := OrderedCollection new.
	
	accounts do: [:anAccount | Totaltransactions addAllLast: (anAccount transactions) ].
	
	^Totaltransactions ! !


!Portfolio methodsFor: 'initialization' stamp: 'SIA 7/5/2021 21:02:51'!
initialize
	
	accounts := OrderedCollection new.
! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 17:02:27'!
balance

	^transactions inject: 0  into: [ : currentBalance :aTransaction | aTransaction effectOnBalance: currentBalance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferWithdraw transferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'SIA 7/7/2021 19:40:10'!
initializeWith: aValue from: aSenderAccount to: aReceiverAccount.

	transferWithdraw := TransferWithdraw register: aValue on: aSenderAccount from: self.
	
	transferDeposit := TransferDeposit register: aValue on: aReceiverAccount from: self.
! !


!Transfer methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 19:11:06'!
transferDepositPart
	
	^transferDeposit.! !

!Transfer methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 19:10:57'!
transferWithdrawPart
	
	^transferWithdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:47:28'!
of: aValue from: aSenderAccount to: aReceiverAccount
	
	^self new initializeWith: aValue from: aSenderAccount to: aReceiverAccount.

	! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 19:51:25'!
counterpart
	
	self subclassResponsibility. ! !


!TransferTransaction methodsFor: 'value' stamp: 'SIA 7/7/2021 19:51:51'!
effectOnBalance: aBalance

	self subclassResponsibility.! !

!TransferTransaction methodsFor: 'value' stamp: 'SIA 7/7/2021 19:51:40'!
value
	
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:43:02'!
for: aValue from: aTransfer

	^ self new initializeFor: aValue from: aTransfer
	
	! !

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'SIA 7/7/2021 19:42:19'!
register: aValue on: anAccount from: aTransfer


	| transaction |
	
	transaction := self for: aValue from: aTransfer.
	anAccount register: transaction.
		
	^ transaction
	
	! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 19:37:19'!
counterpart
	
	^transfer transferWithdrawPart.! !


!TransferDeposit methodsFor: 'value' stamp: 'SIA 7/7/2021 19:25:02'!
effectOnBalance: aBalance

	^ (aBalance + self value)! !

!TransferDeposit methodsFor: 'value' stamp: 'SIA 7/7/2021 19:27:02'!
value

	^ value! !


!TransferDeposit methodsFor: 'initialization' stamp: 'SIA 7/7/2021 19:45:06'!
initializeFor: aValue from: aTransfer
	
	value := aValue.
	transfer := aTransfer.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'value' stamp: 'SIA 7/7/2021 19:25:14'!
effectOnBalance: aBalance

	^ (aBalance - self value)! !

!TransferWithdraw methodsFor: 'value' stamp: 'SIA 7/7/2021 19:26:57'!
value

	^ value! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'SIA 7/7/2021 19:44:58'!
initializeFor: aValue from: aTransfer
	
	value := aValue.
	transfer := aTransfer.! !


!TransferWithdraw methodsFor: 'main protocol' stamp: 'SIA 7/7/2021 19:37:06'!
counterpart
	
	^transfer transferDepositPart.! !
