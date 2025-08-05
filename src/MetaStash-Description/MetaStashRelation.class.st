Class {
	#name : 'MetaStashRelation',
	#superclass : 'Object',
	#instVars : [
		'set',
		'get'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'as yet unclassified' }
MetaStashRelation class >> accessor: anAccessor [

	^ self get: anAccessor asMetaStashGetter set: anAccessor asMetaStashSetter
]

{ #category : 'as yet unclassified' }
MetaStashRelation class >> get: aGetter set: aSetter [

	^ self new
		  get: aGetter;
		  set: aSetter;
		  yourself
]

{ #category : 'accessing' }
MetaStashRelation >> get [

	^ get
]

{ #category : 'accessing' }
MetaStashRelation >> get: anObject [

	get := anObject
]

{ #category : 'accessing' }
MetaStashRelation >> set [

	^ set
]

{ #category : 'accessing' }
MetaStashRelation >> set: anObject [

	set := anObject
]
