Class {
	#name : #EstructuraArchivo,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'fechaCreacion'
	],
	#category : #'O2-FileSystem'
}

{ #category : #'as yet unclassified' }
EstructuraArchivo >> archivoMasNuevo [
"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."
^self subclassResponsibility 
]

{ #category : #initialization }
EstructuraArchivo >> initializeConNombre:unNombre yFechaCreacion:unaFecha [
"initialize"
nombre:=unNombre .
fechaCreacion :=unaFecha . 
]
