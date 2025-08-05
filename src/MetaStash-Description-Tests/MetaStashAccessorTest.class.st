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

{ #category : 'tests' }
MetaStashAccessorTest >> testGetValueWithElement [

	| element testValues |
	element := MetaStashMockObject new
		           testSlot1: #a;
		           testSlot2: #b;
		           testSlot3: #c;
		           asMetaStashElement.
	testValues := {
		              (#testSlot1 -> #a).
		              (#testSlot2 -> #b).
		              (#testSlot3 -> #c) }.
	testValues do: [ :asso |
		| accessor |
		accessor := MetaStashAccessor accessor: asso key.
		self
			assert: (accessor getValueWithElement: element) object
			equals: asso value ]
]
