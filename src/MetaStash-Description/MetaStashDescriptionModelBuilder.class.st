Class {
	#name : 'MetaStashDescriptionModelBuilder',
	#superclass : 'MetaStashDescriptionVisitor',
	#instVars : [
		'model',
		'hasRootElement',
		'modelSymbol'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'testing' }
MetaStashDescriptionModelBuilder >> addElementToModel: aMetaStashElement [

	self model elements add: aMetaStashElement.
	aMetaStashElement accessors do: [ :accessor |
		| relation |
		relation := MetaStashDescriptionRelation new
			            from: aMetaStashElement;
			            accessor: accessor;
			            to: (accessor getValueWithElement: aMetaStashElement).
		relation acceptMetaStashVisitor: self ]
]

{ #category : 'accessing' }
MetaStashDescriptionModelBuilder >> hasRootElement [

	^ hasRootElement
]

{ #category : 'accessing' }
MetaStashDescriptionModelBuilder >> hasRootElement: anObject [

	hasRootElement := anObject
]

{ #category : 'initialization' }
MetaStashDescriptionModelBuilder >> initialize [

	model := MetaStashDescriptionModel new.
	hasRootElement := false
]

{ #category : 'testing' }
MetaStashDescriptionModelBuilder >> isElementInModel: aMetaStashElement [

	^ self model elements anySatisfy: [ :element |
		  element object metaStashEqual: aMetaStashElement object ]
]

{ #category : 'accessing' }
MetaStashDescriptionModelBuilder >> model [

	^ model
]

{ #category : 'accessing' }
MetaStashDescriptionModelBuilder >> model: anObject [

	model := anObject
]

{ #category : 'testing' }
MetaStashDescriptionModelBuilder >> modelSymbol [

	^ modelSymbol
]

{ #category : 'testing' }
MetaStashDescriptionModelBuilder >> modelSymbol: aSymbol [

	modelSymbol := aSymbol
]

{ #category : 'visiting' }
MetaStashDescriptionModelBuilder >> visitMetaStashElement: aMetaStashElement [

	self hasRootElement ifFalse: [
		self model rootElement: aMetaStashElement.
		self hasRootElement: true ].
	(self isElementInModel: aMetaStashElement) ifTrue: [ ^ self ].
	self addElementToModel: aMetaStashElement
]

{ #category : 'visiting' }
MetaStashDescriptionModelBuilder >> visitMetaStashRelation: aMetaStashRelation [

	self model relations add: aMetaStashRelation.
	aMetaStashRelation to acceptMetaStashVisitor: self

]
