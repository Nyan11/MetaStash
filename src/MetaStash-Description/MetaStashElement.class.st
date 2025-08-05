Class {
	#name : 'MetaStashElement',
	#superclass : 'Object',
	#instVars : [
		'object',
		'relations'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'instance creation' }
MetaStashElement class >> new [

	self error: 'MetaStashElement must only be created with newForObject:'
]

{ #category : 'instance creation' }
MetaStashElement class >> newForObject: anObject [

	^ self basicNew
		  initialize;
		  object: anObject;
		  relations: anObject stashRelations;
		  yourself
]

{ #category : 'accessing' }
MetaStashElement >> object [

	^ object
]

{ #category : 'accessing' }
MetaStashElement >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
MetaStashElement >> relations [

	^ relations
]

{ #category : 'accessing' }
MetaStashElement >> relations: anObject [

	relations := anObject
]
