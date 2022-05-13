Class {
	#name : #SVNFile,
	#superclass : #SVNEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#commits => FMMany type: #SVNCommit opposite: #files'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNFile class >> annotation [

	<FMClass: #File super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #adding }
SVNFile >> addCommit: anObject [
	<generated>
	^ self commits add: anObject
]

{ #category : #accessing }
SVNFile >> commits [
	"Relation named: #commits type: #SVNCommit opposite: #files"

	<generated>
	<derived>
	^ commits
]

{ #category : #accessing }
SVNFile >> commits: anObject [

	<generated>
	commits value: anObject
]
