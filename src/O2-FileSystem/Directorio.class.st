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
"agrega un elemento, que puede ser un archivo o un subdirectorio, al contenido del directorio"
contenido  add:elemento
]

{ #category : #'as yet unclassified' }
Directorio >> archivoMasNuevo [
"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."
^(contenido collect: [ :elemento | elemento archivoMasNuevo  ] )detectMax: [ :archivo | archivo fechaCreacion  ].
]

{ #category : #initialization }
Directorio >> initializeConNombre:unNombre yFechaCreacion:unaFecha [
contenido:=OrderedCollection new.
super initializeConNombre: unNombre  yFechaCreacion: unaFecha 
]
