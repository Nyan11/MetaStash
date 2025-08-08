Extension { #name : 'BlLinearGradientPaint' }

{ #category : '*MetaStash-Model-Bloc' }
BlLinearGradientPaint >> metaStashEnd [

	<MetaStash: #Bloc>
	^ MetaStashDescriptionAccessor accessor: #end
]

{ #category : '*MetaStash-Model-Bloc' }
BlLinearGradientPaint >> metaStashStart [

	<MetaStash: #Bloc>
	^ MetaStashDescriptionAccessor accessor: #start
]
