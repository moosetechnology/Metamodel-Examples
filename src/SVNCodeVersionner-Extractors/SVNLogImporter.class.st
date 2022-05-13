"
Importer for SVN log stream
Creates MooseEntities in a MooseModel
"
Class {
	#name : #SVNLogImporter,
	#superclass : #SVNLogParser,
	#category : #'SVNCodeVersionner-Extractors'
}

{ #category : #rules }
SVNLogImporter >> changedPathsEntry [
	^ super changedPathsEntry
		==> [ :ast | ast second ]
]

{ #category : #rules }
SVNLogImporter >> filePathLine [
	"'   ' asParser, action , ' ' asParser, newLine negate star flatten , newLine"
	^ super filePathLine
		==> [ :ast | ast fourth -> ast second ]
]

{ #category : #rules }
SVNLogImporter >> messageLine [
	"dashLine not , newLine negate star flatten , newLine"
	^ super messageLine
		==> [ :ast | ast second ]
]

{ #category : #rules }
SVNLogImporter >> revisionNumber [
	"$r asParser, #digit asParser plus flatten"
	^ super revisionNumber
		==> [ :ast | ast second ]
]

{ #category : #'as yet unclassified' }
SVNLogImporter >> svnLogEntry [
	^ super svnLogEntry ==> [ :ast | { ast second . ast third . ast fifth } ]
]
