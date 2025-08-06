Class {
	#name : 'MetaStashTransformationTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Transformation-Tests',
	#package : 'MetaStash-Transformation-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashTransformationTest >> simpleCyclingModel [

	| obj |
	obj := MetaStashMockObject new.
	obj testSlot1: obj.
	obj testSlot2: obj.
	obj testSlot3: obj.
	^ obj
]

{ #category : 'tests' }
MetaStashTransformationTest >> testTestingToSerialization [

	| modelSource modelResult |
	modelSource := self simpleCyclingModel asMetaStashModel: #Testing.
	modelResult := modelSource transformTo: #Serialization.
	self halt.
]
