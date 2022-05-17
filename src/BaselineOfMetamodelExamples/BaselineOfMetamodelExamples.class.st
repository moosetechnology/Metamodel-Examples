Class {
	#name : #BaselineOfMetamodelExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfMetamodelExamples
}

{ #category : #baselines }
BaselineOfMetamodelExamples >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self petitParser: spec.
		self mooseIDE: spec.

		spec
			package: 'SVN-Metamodel-Entities';
			package: 'SVN-Metamodel-Generator';
			package: 'SVNCodeVersionner-Extractors'
			with: [ spec requires: 'PetitParser' ] ]
]

{ #category : #dependencies }
BaselineOfMetamodelExamples >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ spec repository: 'github://moosetechnology/MooseIDE:DM-demo/src' ]
]

{ #category : #dependencies }
BaselineOfMetamodelExamples >> petitParser: spec [

	spec
		baseline: 'PetitParser'
		with: [ spec repository: 'github://moosetechnology/PetitParser/src' ]
]
