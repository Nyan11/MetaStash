Class {
	#name : 'MetaStashSerializationBlockClosureConstructor',
	#superclass : 'MetaStashSerializationConstructor',
	#instVars : [
		'newInstanceBlock',
		'constructorStringBlock'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'accessing' }
MetaStashSerializationBlockClosureConstructor >> constructorStringBlock [

	^ constructorStringBlock
]

{ #category : 'accessing' }
MetaStashSerializationBlockClosureConstructor >> constructorStringBlock: anObject [

	constructorStringBlock := anObject
]

{ #category : 'as yet unclassified' }
MetaStashSerializationBlockClosureConstructor >> constructorStringFor: aMetaStashSerialization withReceiver: aMetaStashSerializationReceiver withMessages: aCollection [

	constructorStringBlock ifNil: [ ^ super constructorStringFor: aMetaStashSerialization withReceiver: aMetaStashSerializationReceiver withMessages: aCollection ].
	^ constructorStringBlock
		  value: aMetaStashSerialization
		  value: aMetaStashSerializationReceiver
		  value: aCollection
]

{ #category : 'instance creation' }
MetaStashSerializationBlockClosureConstructor >> newInstance [

	newInstanceBlock ifNil: [ ^ super newInstance ].
	^ newInstanceBlock value
]

{ #category : 'accessing' }
MetaStashSerializationBlockClosureConstructor >> newInstanceBlock [

	^ newInstanceBlock
]

{ #category : 'accessing' }
MetaStashSerializationBlockClosureConstructor >> newInstanceBlock: anObject [

	newInstanceBlock := anObject
]
