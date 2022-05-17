# Metamodel-Examples

Examples of metamodel creation.

### To load in a Moose image: 
Execute this in a playgroung: 
```Smalltalk
[ Metacello new
   baseline: 'MetamodelExamples';
   repository: 'github://moosetechnology/Metamodel-Examples:main/src';
   load ]
   on: Warning do: [ :warning | warning resume ]
```

### First example: a simple SVN metamodel.

```Smalltalk
"Generate the metamodel:"
SVNMetamodelGenerator generate.

"Import model from file:"
importer := SVNVCSImporter runOnResourceFile: 'logLse-bib.txt'.

"Install model in Moose:"
svnModel := importer model.
svnModel name: 'svn'.
svnModel metamodel: SVNModel metamodel. 
svnModel install.

"Get first 10 authors"
authors := svnModel entities select: [ :e | e class = SVNAuthor ].

firstAuthors := (authors sort: [ :a :b | a commits size > b commits size ]) first: 10.
