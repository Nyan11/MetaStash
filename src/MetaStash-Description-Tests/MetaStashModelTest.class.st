Class {
	#name : 'MetaStashModelTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashModelTest >> simpleModel [

	^ MetaStashMockObject new.
]

{ #category : 'tests' }
MetaStashModelTest >> testNewForRootElement [

	MetaStashModel newForRootElement: self simpleModel.
	self halt.
]
