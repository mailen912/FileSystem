Class {
	#name : #Archivo,
	#superclass : #EstructuraArchivo,
	#instVars : [
		'tamañoKBytes'
	],
	#category : #'O2-FileSystem'
}

{ #category : #'as yet unclassified' }
Archivo class >> llamado:unString creadoEl:unaFecha kBytes:unNumero [
^self new initializeConNombre:unString Fecha:unaFecha yKB:unNumero 
]

{ #category : #'as yet unclassified' }
Archivo >> archivoMasNuevo [
"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."
^self 
]

{ #category : #accessing }
Archivo >> fechaCreacion [
^fechaCreacion 
]

{ #category : #initialization }
Archivo >> initializeConNombre:unString Fecha:unaFecha yKB:unNumero [ 

self initializeConNombre: unString  yFechaCreacion:unaFecha  .
tamañoKBytes :=unNumero .
]
