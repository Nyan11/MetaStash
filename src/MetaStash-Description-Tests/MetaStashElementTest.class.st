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
MetaStashElementTest >> testAsMetaStashElement [

	| element |
	element := self objectToTest asMetaStashElement.
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
MetaStashElementTest >> testIncludeGetter [

	| element |
	element := MetaStashElement newForObject: self objectToTest.
	self assert: (element includeGetter: #testSlot1).
	self assert: (element includeGetter: #testSlot2).
	self assert: (element includeGetter: #testSlot3).
	self deny: (element includeGetter: #notAnAccessor)
	
]

{ #category : 'tests' }
MetaStashElementTest >> testIncludeSetter [

	| element |
	element := MetaStashElement newForObject: self objectToTest.
	self assert: (element includeSetter: #testSlot1:).
	self assert: (element includeSetter: #testSlot2:).
	self assert: (element includeSetter: #testSlot3:).
	self deny: (element includeSetter: #notAnAccessor:)
	
]

{ #category : 'tests' }
MetaStashElementTest >> testNewForObject [

	| element |
	element := MetaStashElement newForObject: self objectToTest.
	self assert: element object equals: self objectToTest.
	self assert: element accessors size equals: 3.
	self assert: (element includeGetter: #testSlot1).
	self assert: (element includeGetter: #testSlot2).
	self assert: (element includeGetter: #testSlot3).
	self assert: (element includeSetter: #testSlot1:).
	self assert: (element includeSetter: #testSlot2:).
	self assert: (element includeSetter: #testSlot3:)
]
