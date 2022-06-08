# Metamodel-Examples

Examples of metamodel creation.

### To load in a Moose image: 
Execute this in a playgroung: 
```Smalltalk
[ Metacello new
   baseline: 'MetamodelExamples';
   repository: 'github://moosetechnology/Metamodel-Examples:main/src';
   onConflictUseIncoming;
   load ]
   on: Warning do: [ :warning | warning resume ]
```

## First example: a simple SVN metamodel.

For this demo, please checkout the dedicated MooseIDE branch: `DM-demo`.

### Build a model

This script will:
- generate the svn metamodel
- parse the source file provided in this repo to load a model
- install the model into Moose tools
- show the 10 more active authors

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
```
The 10 first authors:  
![SVN 01 - Authors](https://user-images.githubusercontent.com/39184695/172640483-19a8aef8-5b5c-4531-b9dd-9fc6e32bb9ea.png)

Open Moose Models browser: the model is here:  
![SVN 02 - Models browser](https://user-images.githubusercontent.com/39184695/172641228-3101b8ed-9b4f-40a4-bdf7-0312c425c344.png)

### Explore the model: build a distribution map

We will show a distribution map of all files in the model.
The child entities will be the commits that modified each file.
We will tag the commits by author.

#### Child Query

- Inspect the model in Moose and propagate all model files.  
![SVN 03 - Inspector](https://user-images.githubusercontent.com/39184695/172643416-42dd75dc-4138-4237-b94c-a6807cde78f3.png)  
- Open a Queries browser.  
- Build a relation query on commits. You should get 1250 commits.

#### Queries for intent tags

- From the inspector, propagate all model commits.  
- In the Queries browser, build the queries as shown in the image below:
  - 1 relation query on authors (Q2 in the image)
  - As children of Q2, 10 string queries: name = *Author name*. Where author names are the names of the 10 most active authors.

![SVN 04 - Queries](https://user-images.githubusercontent.com/39184695/172648941-fa9f4849-7619-4cf8-9ce6-4467f8fa5785.png)

#### Intent tags

Open the tag browser and create 10 intent tags, 1 for each author:
![SVN 05 - Intent tag](https://user-images.githubusercontent.com/39184695/172645407-007bdf85-0f80-4692-8c50-ffc6976062ba.png)

#### Distribution map

- Open the Distribution map browser. Be sure the last entities you propagated were the model files.  
- Choose the first query you created as Child query  
- Add the tags you created  
- Apply  

![SVN 06 - Distribution map](https://user-images.githubusercontent.com/39184695/172647445-bce90dec-a5f3-4c7d-8907-c0bb0c1cdb86.png)
