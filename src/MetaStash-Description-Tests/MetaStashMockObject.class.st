Class {
	#name : 'MetaStashMockObject',
	#superclass : 'Object',
	#instVars : [
		'testSlot1',
		'testSlot2',
		'testSlot3'
	],
	#category : 'MetaStash-Description-Tests',
	#package : 'MetaStash-Description-Tests'
}

{ #category : 'as yet unclassified' }
MetaStashMockObject >> stashRelation1 [

	<msAccessor>
	^ MetaStashAccessor new
		  get: #testSlot1;
		  set: #testSlot1:;
		  yourself
]

{ #category : 'as yet unclassified' }
MetaStashMockObject >> stashRelation2 [

	<msAccessor>
	^ MetaStashAccessor get: #testSlot2 set: #testSlot2:
]

{ #category : 'as yet unclassified' }
MetaStashMockObject >> stashRelation3 [

	<msAccessor>
	^ MetaStashAccessor accessor: #testSlot3
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot1 [

	^ testSlot1
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot1: anObject [

	testSlot1 := anObject
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot2 [

	^ testSlot2
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot2: anObject [

	testSlot2 := anObject
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot3 [

	^ testSlot3
]

{ #category : 'accessing' }
MetaStashMockObject >> testSlot3: anObject [

	testSlot3 := anObject
]
