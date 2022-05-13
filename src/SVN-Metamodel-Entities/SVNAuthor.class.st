Class {
	#name : #SVNAuthor,
	#superclass : #SVNEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#commits => FMMany type: #SVNCommit opposite: #author'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNAuthor class >> annotation [

	<FMClass: #Author super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #adding }
SVNAuthor >> addCommit: anObject [
	<generated>
	^ self commits add: anObject
]

{ #category : #accessing }
SVNAuthor >> commits [
	"Relation named: #commits type: #SVNCommit opposite: #author"

	<generated>
	<derived>
	^ commits
]

{ #category : #accessing }
SVNAuthor >> commits: anObject [

	<generated>
	commits value: anObject
]
