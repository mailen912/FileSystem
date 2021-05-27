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
EstructuraArchivo >> archivoMasGrande [
"Retorna el archivo con mayor cantidad de bytes en cualquier nivel del filesystem
contenido por directorio receptor."
^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstructuraArchivo >> archivoMasNuevo [
"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."
^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstructuraArchivo >> esDirectorio: elemento [
^elemento class==self class 
]

{ #category : #initialization }
EstructuraArchivo >> initializeConNombre:unNombre yFechaCreacion:unaFecha [
"initialize"
nombre:=unNombre .
fechaCreacion :=unaFecha . 
]
