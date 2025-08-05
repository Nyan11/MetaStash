Class {
	#name : 'BaselineOfMetaStash',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMetaStash',
	#package : 'BaselineOfMetaStash'
}

{ #category : 'baselines' }
BaselineOfMetaStash >> baseline: spec [
	"Common baseline for all Pharo versions"

	<baseline>
	spec for: #common do: [ self baselineForCommon: spec ]
]

{ #category : 'baselines' }
BaselineOfMetaStash >> baselineForCommon: spec [

	<baseline>
	spec package: 'MetaStash-Description'.
	spec
		package: 'MetaStash-Description-Tests'
		with: [ spec requires: #( 'MetaStash-Description' ) ].

	"Groups"
	spec
		group: 'default'
		with: #( 'MetaStash-Description' 'MetaStash-Description-Tests' )
]
