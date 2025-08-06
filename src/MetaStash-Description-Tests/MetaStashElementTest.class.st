Class {
	#name : 'MetaStashElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'objectToTest'
	],
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'running' }
MetaStashElementTest >> objectToTest [

	^ objectToTest
]

{ #category : 'running' }
MetaStashElementTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	objectToTest := MetaStashMockObject new
]

{ #category : 'tests' }
MetaStashElementTest >> testAsMetaStashElementForModel [

	| element |
	element := self objectToTest asMetaStashElementForModel: #Testing.
	self assert: element object equals: self objectToTest.
	self assert: element accessors size equals: 3.
	self assert: (element includeGetter: #testSlot1).
	self assert: (element includeGetter: #testSlot2).
	self assert: (element includeGetter: #testSlot3).
	self assert: (element includeSetter: #testSlot1:).
	self assert: (element includeSetter: #testSlot2:).
	self assert: (element includeSetter: #testSlot3:)
]

{ #category : 'tests' }
MetaStashElementTest >> testAsMetaStashModel [

	| model |
	model := self objectToTest asMetaStashModel: #Testing.
	self assert: model elements size equals: 2.
	self assert: model relations size equals: 3
]

{ #category : 'tests' }
MetaStashElementTest >> testIncludeGetter [

	| element |
	element := MetaStashElement newForObject: self objectToTest forModel: #Testing.
	self assert: (element includeGetter: #testSlot1).
	self assert: (element includeGetter: #testSlot2).
	self assert: (element includeGetter: #testSlot3).
	self deny: (element includeGetter: #notAnAccessor)
]

{ #category : 'tests' }
MetaStashElementTest >> testIncludeSetter [

	| element |
	element := MetaStashElement newForObject: self objectToTest forModel: #Testing.
	self assert: (element includeSetter: #testSlot1:).
	self assert: (element includeSetter: #testSlot2:).
	self assert: (element includeSetter: #testSlot3:).
	self deny: (element includeSetter: #notAnAccessor:)
]

{ #category : 'tests' }
MetaStashElementTest >> testNewForObjectForModel [

	| element |
	element := MetaStashElement
		           newForObject: self objectToTest
		           forModel: #Testing.
	self assert: element object equals: self objectToTest.
	self assert: element accessors size equals: 3.
	self assert: (element includeGetter: #testSlot1).
	self assert: (element includeGetter: #testSlot2).
	self assert: (element includeGetter: #testSlot3).
	self assert: (element includeSetter: #testSlot1:).
	self assert: (element includeSetter: #testSlot2:).
	self assert: (element includeSetter: #testSlot3:)
]
