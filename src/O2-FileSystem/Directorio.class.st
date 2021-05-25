Class {
	#name : #Directorio,
	#superclass : #EstructuraArchivo,
	#instVars : [
		'contenido'
	],
	#category : #'O2-FileSystem'
}

{ #category : #initialization }
Directorio class >> llamado:unString creadoEl:unaFecha [ 
^self new initializeConNombre: unString  yFechaCreacion: unaFecha 
]

{ #category : #'as yet unclassified' }
Directorio >> agregar:elemento [
contenido  add:elemento
]

{ #category : #initialization }
Directorio >> initializeConNombre:unNombre yFechaCreacion:unaFecha [
contenido:=OrderedCollection new.
super initializeConNombre: unNombre  yFechaCreacion: unaFecha 
]
