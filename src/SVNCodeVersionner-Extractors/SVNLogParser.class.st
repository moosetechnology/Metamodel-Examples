Class {
	#name : #SVNLogParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'revisionNumber',
		'authorname',
		'messageLength',
		'pipe',
		'commitDate',
		'svnLog',
		'svnLogEntry',
		'newLine',
		'dashLine',
		'logEntryHeaderLine',
		'messageLine',
		'changedPaths',
		'changedPathsEntry',
		'filePathLine',
		'action'
	],
	#category : #'SVNCodeVersionner-Extractors'
}

{ #category : #'as yet unclassified' }
SVNLogParser class >> logCommand [
	^ 'svn log'
]

{ #category : #rules }
SVNLogParser >> action [
	^ 'M' asParser / 'A' asParser / 'D' asParser
]

{ #category : #rules }
SVNLogParser >> authorname [
	^ ' ' asParser negate plus flatten
]

{ #category : #rules }
SVNLogParser >> changedPaths [
	^ 'Changed paths:' asParser, newLine
]

{ #category : #rules }
SVNLogParser >> changedPathsEntry [
	^ changedPaths , filePathLine plus
]

{ #category : #rules }
SVNLogParser >> commitDate [
	^ pipe negate plus flatten
]

{ #category : #rules }
SVNLogParser >> dashLine [
	^ ($- asParser times: 72) , newLine
]

{ #category : #rules }
SVNLogParser >> filePathLine [ 
	^'   ' asParser, action , ' ' asParser, newLine negate star flatten , newLine
]

{ #category : #rules }
SVNLogParser >> logEntryHeaderLine [
	^ revisionNumber , pipe, authorname, pipe, commitDate, pipe , messageLength, newLine
]

{ #category : #rules }
SVNLogParser >> messageLength [
	^ #digit asParser plus, ' line' asParser, 's' asParser optional
]

{ #category : #rules }
SVNLogParser >> messageLine [
	^ dashLine not , newLine negate star flatten , newLine
]

{ #category : #rules }
SVNLogParser >> newLine [
	 ^ #newline asParser
]

{ #category : #rules }
SVNLogParser >> pipe [
	^ ' | ' asParser
]

{ #category : #rules }
SVNLogParser >> revisionNumber [
	^ $r asParser, #digit asParser plus flatten
]

{ #category : #accessing }
SVNLogParser >> start [
	^ svnLog end
]

{ #category : #rules }
SVNLogParser >> svnLog [
	^ svnLogEntry plus
]

{ #category : #rules }
SVNLogParser >> svnLogEntry [
	^ dashLine , logEntryHeaderLine , changedPathsEntry optional,  newLine , messageLine plus
]
