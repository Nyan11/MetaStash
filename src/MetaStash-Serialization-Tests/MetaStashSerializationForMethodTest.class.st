Class {
	#name : 'MetaStashSerializationForMethodTest',
	#superclass : 'TestCase',
	#category : 'MetaStash-Serialization-Tests',
	#package : 'MetaStash-Serialization-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethodTest >> emptyMethod [

	^ MetaStashSerializationForMethod new
		  name: #empty;
		  yourself
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethodTest >> simpleCyclingMethod [

	| returnObject message1 message2 message3 |
	returnObject := MetaStashSerializationReceiver new
		                variableName: 'obj';
		                constructor:
			                'MetaStashMockObject new' asMetaStashConstructor;
		                yourself.
	message1 := MetaStashSerializationMessage new receiver: returnObject; message: #testSlot1:; arguments: { returnObject }.
	message2 := MetaStashSerializationMessage new receiver: returnObject; message: #testSlot2:; arguments: { returnObject }.
	message3 := MetaStashSerializationMessage new receiver: returnObject; message: #testSlot3:; arguments: { returnObject }.

	^ MetaStashSerializationForMethod new
		  name: #simpleCyclingModel;
		  returnReceiver: returnObject;
		  messages: { message1 . message2 . message3 }
		  yourself
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethodTest >> simpleMethod [

	| returnObject |
	returnObject := MetaStashSerializationReceiver new
		                constructor:
			                'MetaStashMockObject new' asMetaStashConstructor;
		                yourself.
	^ MetaStashSerializationForMethod new
		  name: #simpleModel;
		  returnReceiver: returnObject;
		  yourself
]

{ #category : 'tests' }
MetaStashSerializationForMethodTest >> testArray1 [

	| model sourceCode |
	model := model := {  } asMetaStashModel: #Description.
	sourceCode := (model transformTo: #Serialization) asBlockClosureString.
	self
		assert: (OpalCompiler new
				 source: sourceCode;
				 evaluate) value
		equals: {  }
]

{ #category : 'tests' }
MetaStashSerializationForMethodTest >> testArray2 [

	| model sourceCode |
	model := model := { Object new } asMetaStashModel: #Description.
	sourceCode := (model transformTo: #Serialization) asBlockClosureString.
	self
		assert: (OpalCompiler new
				 source: sourceCode;
				 evaluate) value size
		equals: 1
]

{ #category : 'tests' }
MetaStashSerializationForMethodTest >> testSourceCode1 [

	self assert: self emptyMethod sourceCode equals: 'empty'
]

{ #category : 'tests' }
MetaStashSerializationForMethodTest >> testSourceCode2 [

	self assert: self simpleMethod sourceCode equals: 'simpleModel

	^ MetaStashMockObject new'
]

{ #category : 'tests' }
MetaStashSerializationForMethodTest >> testSourceCode3 [

	self
		assert: self simpleCyclingMethod sourceCode
		equals: 'simpleCyclingModel

	| obj |
	obj := MetaStashMockObject new.
	obj testSlot1: obj.
	obj testSlot2: obj.
	obj testSlot3: obj.
	^ obj'
]
