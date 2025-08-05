Class {
	#name : 'MetaStashModelTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashModelTest >> simpleCyclingModel [

	| obj |
	obj := MetaStashMockObject new.
	obj testSlot1: obj.
	obj testSlot2: obj.
	obj testSlot3: obj.
	^ obj
]

{ #category : 'as yet unclassified' }
MetaStashModelTest >> simpleModel [

	^ MetaStashMockObject new
]

{ #category : 'tests' }
MetaStashModelTest >> testNewForRootElement [

	| model |
	model := MetaStashModel newForRootElement: self simpleModel asMetaStashElement.
	self assert: model elements size equals: 2.
	self assert: model relations size equals: 3
]

{ #category : 'tests' }
MetaStashModelTest >> testSimpleCyclingModel [

	| model |
	model := self simpleCyclingModel asMetaStashModel.
	self assert: model elements size equals: 1.
	self assert: model relations size equals: 3
]

{ #category : 'tests' }
MetaStashModelTest >> testSimpleModel [

	| model |
	model := self simpleModel asMetaStashModel.
	self assert: model elements size equals: 2.
	self assert: model relations size equals: 3
]
