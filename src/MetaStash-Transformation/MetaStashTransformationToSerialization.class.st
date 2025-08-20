Class {
	#name : 'MetaStashTransformationToSerialization',
	#superclass : 'Object',
	#category : 'MetaStash-Transformation',
	#package : 'MetaStash-Transformation'
}

{ #category : 'accessing' }
MetaStashTransformationToSerialization >> transformation: aModel [

	<MetaStashTransformTo: #Serialization>
	| result elementsAndReceivers messages |
	result := MetaStashSerialization new.

	elementsAndReceivers := aModel elements collectWithIndex: [
		                        :each
		                        :index |
		                        | receiver |
		                        receiver := each object isLiteral
			                                    ifFalse: [
			                                    MetaStashSerializationReceiver
				                                    new ]
			                                    ifTrue: [
			                                    MetaStashSerializationLiteralReceiver
				                                    new ].
		                        receiver
			                        variableName:
				                        each serializationVariableName
				                        , index printString;
			                        constructor: each serializationConstructor;
			                        yourself.
		                        each -> receiver ].


	result receivers addAll: (elementsAndReceivers collect: #value).
	result returnReceiver:
		(elementsAndReceivers select: [ :a | a key = aModel rootElement ])
			first value.
	messages := aModel relations
		            reject: [ :each | each isDefaultValue ]
		            thenCollect: [ :each |
			            | toObject fromObject |
			            (elementsAndReceivers do: [ :a |
				             a key = each to ifTrue: [ toObject := a value ].
				             a key = each from ifTrue: [ fromObject := a value ] ])
				            first value.
			            toObject increaseOccurencesInMessage.
			            each from = each to ifTrue: [
				            toObject increaseOccurencesInMessage ].
			            MetaStashSerializationMessage new
				            receiver: fromObject;
				            message: each accessor;
				            arguments: { toObject } ].
	result messages addAll: messages.
	^ result
]
