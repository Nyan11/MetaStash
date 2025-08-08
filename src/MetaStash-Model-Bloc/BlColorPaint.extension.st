Extension { #name : 'BlColorPaint' }

{ #category : '*MetaStash-Model-Bloc' }
BlColorPaint >> metaStashColor [

	<MetaStash: #Bloc>
	^ (MetaStashDescriptionAccessor accessor: #color) noDefaultValue
]
