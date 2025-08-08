Extension { #name : 'MetaStashDescriptionModel' }

{ #category : '*MetaStash-Transformation' }
MetaStashDescriptionModel >> transformTo: aSymbol [

	| transformers pragma |
	transformers := (Pragma allNamed: #MetaStashTransformTo:) select: [
		                :p | p arguments first = aSymbol ].
	transformers size > 2 ifTrue: [ self error ].
	pragma := transformers first.
	^ pragma method
		  receiver: pragma methodClass new
		  withArguments: { self }
		  executeMethod: pragma method
]
