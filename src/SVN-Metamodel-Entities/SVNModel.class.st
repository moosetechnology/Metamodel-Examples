Class {
	#name : #SVNModel,
	#superclass : #MooseModel,
	#category : #'SVN-Metamodel-Entities-Model'
}

{ #category : #accessing }
SVNModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
SVNModel class >> annotation [
	<FMClass: #SVNModel super: #MooseModel>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
]
