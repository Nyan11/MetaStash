Class {
	#name : 'MetaStashDescriptionAccessor',
	#superclass : 'Object',
	#instVars : [
		'set',
		'get'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'as yet unclassified' }
MetaStashDescriptionAccessor class >> accessor: anAccessor [

	^ self get: anAccessor asMetaStashGetter set: anAccessor asMetaStashSetter
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionAccessor class >> get: aGetter set: aSetter [

	^ self new
		  get: aGetter;
		  set: aSetter;
		  yourself
]

{ #category : 'visiting' }
MetaStashDescriptionAccessor >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashAccessor: self
]

{ #category : 'accessing' }
MetaStashDescriptionAccessor >> get [

	^ get
]

{ #category : 'accessing' }
MetaStashDescriptionAccessor >> get: anObject [

	get := anObject
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionAccessor >> getValueWithElement: aMetaStashElement [

	^ (aMetaStashElement object perform: self get)
		  asMetaStashElementForModel: aMetaStashElement modelSymbol
]

{ #category : 'accessing' }
MetaStashDescriptionAccessor >> set [

	^ set
]

{ #category : 'accessing' }
MetaStashDescriptionAccessor >> set: anObject [

	set := anObject
]
