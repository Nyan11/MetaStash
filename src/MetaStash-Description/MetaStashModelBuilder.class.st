Class {
	#name : 'MetaStashModelBuilder',
	#superclass : 'MetaStashVisitor',
	#instVars : [
		'model',
		'hasRootElement'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'initialization' }
MetaStashModelBuilder >> initialize [

	model := MetaStashModel new.
	hasRootElement := false.
]
