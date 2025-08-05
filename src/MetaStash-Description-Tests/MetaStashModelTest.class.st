Class {
	#name : 'MetaStashModelTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashModelTest >> graphModel [

	| obj obj1 obj11 obj12 obj2 obj3 obj33 obj331 |
	obj := MetaStashMockObject new.
	obj1 := MetaStashMockObject new.
	obj2 := MetaStashMockObject new.
	obj3 := MetaStashMockObject new.
	obj11 := MetaStashMockObject new.
	obj12 := MetaStashMockObject new.
	obj33 := MetaStashMockObject new.
	obj331 := MetaStashMockObject new.

	obj testSlot1: obj1.
	obj testSlot2: obj2.
	obj testSlot3: obj3.

	obj1 testSlot1: obj11.
	obj1 testSlot2: obj12.
	obj1 testSlot3: obj2.
	
	obj11 testSlot1: obj11.
	obj11 testSlot2: obj12.
	obj11 testSlot3: obj1.
	
	obj12 testSlot1: obj11.
	obj12 testSlot2: obj11.
	obj12 testSlot3: obj11.

	obj2 testSlot1: obj331.
	obj2 testSlot2: obj.
	obj2 testSlot3: obj1.

	obj3 testSlot1: obj.
	obj3 testSlot2: obj2.
	obj3 testSlot3: obj33.

	obj33 testSlot1: obj331.
	obj33 testSlot2: obj331.
	obj33 testSlot3: obj331.

	obj331 testSlot1: obj.
	obj331 testSlot2: obj11.
	obj331 testSlot3: obj3.

	^ obj
]

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
MetaStashModelTest >> testGraphModel [

	| model |
	model := self graphModel asMetaStashModel.
	self assert: model elements size equals: 8.
	self assert: model relations size equals: 24
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

{ #category : 'tests' }
MetaStashModelTest >> testTreeModel [

	| model |
	model := self treeModel asMetaStashModel.
	self assert: model elements size equals: 9.
	self assert: model relations size equals: 24
]

{ #category : 'as yet unclassified' }
MetaStashModelTest >> treeModel [

	| obj obj1 obj2 obj3 obj11 obj12 obj33 obj331 |
	obj := MetaStashMockObject new.
	obj1 := MetaStashMockObject new.
	obj2 := MetaStashMockObject new.
	obj3 := MetaStashMockObject new.
	obj11 := MetaStashMockObject new.
	obj12 := MetaStashMockObject new.
	obj33 := MetaStashMockObject new.
	obj331 := MetaStashMockObject new.
	
	obj testSlot1: obj1.
	obj testSlot2: obj2.
	obj testSlot3: obj3.
	
	obj1 testSlot1: obj11.
	obj1 testSlot2: obj12.
	
	obj3 testSlot3: obj33.
	
	obj33 testSlot1: obj331.
	
	^ obj
	
]
