Extension { #name : 'MetaStashDescriptionModel' }

{ #category : '*MetaStash-Transformation' }
MetaStashDescriptionModel >> transformTo: aSymbol [

	| transformers pragma |
	transformers := (Pragma allNamed: #MetaStash:TransformTo:)
		                select: [ :p |
			                p arguments first = self modelSymbol and: [
				                p arguments second = aSymbol ] ].
	transformers size > 2 ifTrue: [ self error ].
	pragma := 
	transformers first .
	^ pragma method
				                receiver: pragma methodClass new
				                withArguments: { self }
				                executeMethod: pragma method
		              
]
