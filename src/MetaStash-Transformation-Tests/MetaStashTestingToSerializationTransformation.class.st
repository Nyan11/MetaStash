Class {
	#name : 'MetaStashTestingToSerializationTransformation',
	#superclass : 'Object',
	#category : 'MetaStash-Transformation-Tests',
	#package : 'MetaStash-Transformation-Tests'
}

{ #category : 'accessing' }
MetaStashTestingToSerializationTransformation >> transformation: aModel [

	<MetaStash: #Testing TransformTo: #Serialization>
	| result elementReceiverDict messages |
	result := MetaStashSerializationForMethod new.
	result name: #test.

	elementReceiverDict := Dictionary newFrom:
		                       (aModel elements collectWithIndex: [
			                        :each
			                        :index |
			                        each
			                        -> (MetaStashSerializationReceiver new
					                         variableName:
						                         each serializationVariableName
						                         , index printString;
					                         constructor:
						                         each serializationConstructor;
					                         yourself) ]).

	result receivers addAll: elementReceiverDict values.
	result returnReceiver: (elementReceiverDict at: aModel rootElement).
	
	messages := aModel relations collect: [ :each | 
		MetaStashSerializationMessage new
		            receiver: (elementReceiverDict at: each from) ;
		            message: each accessor set;
		            arguments: { (elementReceiverDict at: each to) }
		 ].
	result messages addAll: messages.
	^ result
]
