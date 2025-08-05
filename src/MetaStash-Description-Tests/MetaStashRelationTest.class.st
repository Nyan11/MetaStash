Class {
	#name : 'MetaStashRelationTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'tests' }
MetaStashRelationTest >> testAccessor [

	| relation |
	relation := MetaStashRelation accessor: #test.
	self assert: relation get equals: #test.
	self assert: relation set equals: #test:
]

{ #category : 'tests' }
MetaStashRelationTest >> testGetSet [

	| relation |
	relation := MetaStashRelation get: #getter set: #setter:.
	self assert: relation get equals: #getter.
	self assert: relation set equals: #setter:
]
