Class {
	#name : #CVSLogParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'cvsLog',
		'cvsLogFileEntry',
		'cvsLogEntry',
		'cvsLogFileHeader',
		'cvsLogFileSeparatorLine',
		'newLine',
		'filePathLine',
		'cvsLogEntrySeparatorLine',
		'entryRevisionLine',
		'entryDateLine',
		'entryMessageLine',
		'entryDate',
		'entryAuthor',
		'semicolonAndSpaces'
	],
	#category : #'SVNCodeVersionner-Extractors'
}

{ #category : #'as yet unclassified' }
CVSLogParser class >> logCommand [
	^ 'cvs -d:pserver:anonymous@<SERVER>:<PATH>  log'
]

{ #category : #rules }
CVSLogParser >> cvsLog [
	^ cvsLogFileEntry plus
]

{ #category : #rules }
CVSLogParser >> cvsLogEntry [
	^ cvsLogEntrySeparatorLine , entryRevisionLine , entryDateLine , entryMessageLine plus
]

{ #category : #rules }
CVSLogParser >> cvsLogEntrySeparatorLine [
	^ ($- asParser times: 28) , newLine
]

{ #category : #rules }
CVSLogParser >> cvsLogFileEntry [
	^ newLine , cvsLogFileHeader , cvsLogEntry plus , cvsLogFileSeparatorLine
]

{ #category : #rules }
CVSLogParser >> cvsLogFileHeader [
	^ filePathLine , cvsLogEntrySeparatorLine negate plus
]

{ #category : #rules }
CVSLogParser >> cvsLogFileSeparatorLine [
	^ ($= asParser times: 77) , newLine
]

{ #category : #rules }
CVSLogParser >> entryAuthor [
	^ 'author: ' asParser , ($; asParser negate plus flatten)
]

{ #category : #rules }
CVSLogParser >> entryDate [
	^ 'date: ' asParser , ($; asParser negate plus flatten)
]

{ #category : #rules }
CVSLogParser >> entryDateLine [
	^ entryDate , semicolonAndSpaces , entryAuthor , semicolonAndSpaces , newLine negate plus , newLine
]

{ #category : #rules }
CVSLogParser >> entryMessageLine [
	^ (cvsLogEntrySeparatorLine / cvsLogFileSeparatorLine) not , newLine negate star flatten , newLine
]

{ #category : #rules }
CVSLogParser >> entryRevisionLine [
	^ 'revision ' asParser , (#digit asParser / $. asParser) plus flatten , newLine
]

{ #category : #rules }
CVSLogParser >> filePathLine [
	^ 'RCS file: ' asParser , ($, asParser negate plus flatten) , ',v' asParser , newLine
]

{ #category : #rules }
CVSLogParser >> newLine [
	^ #newline asParser
]

{ #category : #rules }
CVSLogParser >> semicolonAndSpaces [
	^ $; asParser , #space asParser plus
]

{ #category : #accessing }
CVSLogParser >> start [
	^ cvsLog end
]
