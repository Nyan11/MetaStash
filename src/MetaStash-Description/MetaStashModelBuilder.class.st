Class {
	#name : 'MetaStashModelBuilder',
	#superclass : 'MetaStashVisitor',
	#instVars : [
		'model',
		'hasRootElement',
		'modelSymbol'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'testing' }
MetaStashModelBuilder >> addElementToModel: aMetaStashElement [

	self model elements add: aMetaStashElement.
	aMetaStashElement accessors do: [ :accessor |
		| relation |
		relation := MetaStashRelation new
			            from: aMetaStashElement;
			            accessor: accessor;
			            to: (accessor getValueWithElement: aMetaStashElement).
		relation acceptMetaStashVisitor: self ]
]

{ #category : 'accessing' }
MetaStashModelBuilder >> hasRootElement [

	^ hasRootElement
]

{ #category : 'accessing' }
MetaStashModelBuilder >> hasRootElement: anObject [

	hasRootElement := anObject
]

{ #category : 'initialization' }
MetaStashModelBuilder >> initialize [

	model := MetaStashModel new.
	hasRootElement := false
]

{ #category : 'testing' }
MetaStashModelBuilder >> isElementInModel: aMetaStashElement [

	^ self model elements anySatisfy: [ :element |
		  element object metaStashEqual: aMetaStashElement object ]
]

{ #category : 'accessing' }
MetaStashModelBuilder >> model [

	^ model
]

{ #category : 'accessing' }
MetaStashModelBuilder >> model: anObject [

	model := anObject
]

{ #category : 'testing' }
MetaStashModelBuilder >> modelSymbol [

	^ modelSymbol
]

{ #category : 'testing' }
MetaStashModelBuilder >> modelSymbol: aSymbol [

	modelSymbol := aSymbol
]

{ #category : 'visiting' }
MetaStashModelBuilder >> visitMetaStashElement: aMetaStashElement [

	self hasRootElement ifFalse: [
		self model rootElement: aMetaStashElement.
		self hasRootElement: true ].
	(self isElementInModel: aMetaStashElement) ifTrue: [ ^ self ].
	self addElementToModel: aMetaStashElement
]

{ #category : 'visiting' }
MetaStashModelBuilder >> visitMetaStashRelation: aMetaStashRelation [

	self model relations add: aMetaStashRelation.
	aMetaStashRelation to acceptMetaStashVisitor: self

]
