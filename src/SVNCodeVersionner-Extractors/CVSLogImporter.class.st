"
Importer for CVS log stream
Creates MooseEntities in a MooseModel
"
Class {
	#name : #CVSLogImporter,
	#superclass : #CVSLogParser,
	#category : #'SVNCodeVersionner-Extractors'
}

{ #category : #rules }
CVSLogImporter >> cvsLog [
	"cvsLogFileEntry plus"
	^ super cvsLog
			==> [ :ast | ast flatCollect: #yourself ]
]

{ #category : #rules }
CVSLogImporter >> cvsLogEntry [
	"cvsLogEntrySeparatorLine , entryRevisionLine , entryDateLine , entryMessageLine plus"
	^ super cvsLogEntry
		==> [ :ast |
					SYNVCSImporter createTemporaryCommit: (ast second second)
							date: (ast third first second)
							author: (ast third third second)
							message: (ast fourth)
			]
]

{ #category : #rules }
CVSLogImporter >> cvsLogFileEntry [
	"newLine , cvsLogFileHeader , cvsLogEntry plus , cvsLogFileSeparatorLine"
	
	^ super cvsLogFileEntry
			==> [ :ast | |commits|
						commits := ast third.
						commits do: [ :c | c addFile: ast second ].
						commits ]
]

{ #category : #creating }
CVSLogImporter >> ensureAuthor: authorName [
	^ authors at: authorName
				ifAbsentPut: [ model add: (SYNAuthor new name: authorName ; yourself) ]
]

{ #category : #rules }
CVSLogImporter >> entryMessageLine [
	"cvsLogEntrySeparatorLine / cvsLogFileSeparatorLine) not , newLine negate plus flatten , newLine"
	
	^ super entryMessageLine
		==> [ :ast | ast second ]
]
