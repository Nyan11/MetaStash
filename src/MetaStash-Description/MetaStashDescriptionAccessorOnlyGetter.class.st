Class {
	#name : 'MetaStashDescriptionAccessorOnlyGetter',
	#superclass : 'MetaStashDescriptionAbstractAccessor',
	#instVars : [
		'objectOfColletion'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'accessing' }
MetaStashDescriptionAccessorOnlyGetter >> getObject [

	^ objectOfColletion
]

{ #category : 'accessing' }
MetaStashDescriptionAccessorOnlyGetter >> getObject: anObject [

	objectOfColletion := anObject
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionAccessorOnlyGetter >> getValueWithElement: aMetaStashElement [

	^ self getObject asMetaStashElementForModel:
		  aMetaStashElement modelSymbol
]

{ #category : 'testing' }
MetaStashDescriptionAccessorOnlyGetter >> isOnlyGetter [

	^ true
]

{ #category : 'initialization' }
MetaStashDescriptionAccessorOnlyGetter >> set [
	^ nil
]
