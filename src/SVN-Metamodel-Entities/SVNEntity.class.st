Class {
	#name : #SVNEntity,
	#superclass : #MooseEntity,
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #meta }
SVNEntity class >> metamodel [

	<generated>
	^ SVNModel metamodel
]
