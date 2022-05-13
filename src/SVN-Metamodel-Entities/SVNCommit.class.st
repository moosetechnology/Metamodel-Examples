Class {
	#name : #SVNCommit,
	#superclass : #SVNEntity,
	#instVars : [
		'#author => FMOne type: #SVNAuthor opposite: #commits',
		'#date => FMProperty',
		'#files => FMMany type: #SVNFile opposite: #commits',
		'#message => FMProperty',
		'#revision => FMProperty'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNCommit class >> annotation [

	<FMClass: #Commit super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #adding }
SVNCommit >> addFile: anObject [
	<generated>
	^ self files add: anObject
]

{ #category : #accessing }
SVNCommit >> author [
	"Relation named: #author type: #SVNAuthor opposite: #commits"

	<generated>
	^ author
]

{ #category : #accessing }
SVNCommit >> author: anObject [

	<generated>
	author := anObject
]

{ #category : #accessing }
SVNCommit >> date [

	<FMProperty: #date type: #Object>
	<generated>
	^ date
]

{ #category : #accessing }
SVNCommit >> date: anObject [
	<generated>
	date := anObject
]

{ #category : #accessing }
SVNCommit >> files [
	"Relation named: #files type: #SVNFile opposite: #commits"

	<generated>
	^ files
]

{ #category : #accessing }
SVNCommit >> files: anObject [

	<generated>
	files value: anObject
]

{ #category : #accessing }
SVNCommit >> message [

	<FMProperty: #message type: #String>
	<generated>
	^ message
]

{ #category : #accessing }
SVNCommit >> message: anObject [
	<generated>
	message := anObject
]

{ #category : #accessing }
SVNCommit >> revision [

	<FMProperty: #revision type: #Number>
	<generated>
	^ revision
]

{ #category : #accessing }
SVNCommit >> revision: anObject [
	<generated>
	revision := anObject
]
