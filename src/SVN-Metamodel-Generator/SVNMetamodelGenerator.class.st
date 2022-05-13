Class {
	#name : #SVNMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'entity',
		'file',
		'commit',
		'author'
	],
	#category : #'SVN-Metamodel-Generator'
}

{ #category : #accessing }
SVNMetamodelGenerator class >> packageName [

	^ 'SVN-Metamodel-Entities'
]

{ #category : #accessing }
SVNMetamodelGenerator class >> prefix [

	^ 'SVN'
]

{ #category : #accessing }
SVNMetamodelGenerator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : #generation }
SVNMetamodelGenerator >> define [

	entity := builder newClassNamed: 'Entity'.
	file := builder newClassNamed: 'File'.
	commit := builder newClassNamed: 'Commit'.
	author := builder newClassNamed: 'Author'.


	"inheritance"
	entity --|> #TEntityMetaLevelDependency.
	file
		--|> entity;
		--|> #TNamedEntity.
	commit --|> entity.
	author
		--|> entity;
		--|> #TNamedEntity.

	"properties"
"	file property: 'name' type: #String."
	commit property: 'revision' type: #Number.
	commit property: 'date' type: #Object.
	commit property: 'message' type: #String.
"	author property: 'name' type: #String."

	"associations"
	file *-* commit.
	commit *- author
]
