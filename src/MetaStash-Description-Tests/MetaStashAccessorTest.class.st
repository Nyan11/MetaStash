Class {
	#name : 'MetaStashAccessorTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'tests' }
MetaStashAccessorTest >> testAccessor [

	| accessor |
	accessor := MetaStashAccessor accessor: #test.
	self assert: accessor get equals: #test.
	self assert: accessor set equals: #test:
]

{ #category : 'tests' }
MetaStashAccessorTest >> testGetSet [

	| accessor |
	accessor := MetaStashAccessor get: #getter set: #setter:.
	self assert: accessor get equals: #getter.
	self assert: accessor set equals: #setter:
]
