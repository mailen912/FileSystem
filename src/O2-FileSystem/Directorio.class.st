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
Directorio >> archivoMasGrande [
"Retorna el archivo con mayor cantidad de bytes en cualquier nivel del filesystem
contenido por directorio receptor."

^( (contenido collect: [ :elemento | elemento archivoMasNuevo ]) reject: [ :arch | arch isNil ])
		detectMax: [ :archivo | archivo tamanoTotalOcupado  ]

]

{ #category : #'as yet unclassified' }
Directorio >> archivoMasNuevo [
	"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."

	^( (contenido collect: [ :elemento | elemento archivoMasNuevo ]) reject: [ :arch | arch isNil ])
		detectMax: [ :archivo | archivo fechaCreacion ]
]

{ #category : #'as yet unclassified' }
Directorio >> cantidadDeArchivos [
"Devuelve un string indicando la cantidad de archivos de un directorio cuando la misma es igual o mayor a 1, caso contrario devuelve un string vacio"
|cantidad|
cantidad:=(contenido count: [ :elemento | elemento class == Archivo ]).
cantidad >0 ifTrue:[^(' (',(cantidad asString) ,' archivos)').]ifFalse:[^''].

]

{ #category : #initialization }
Directorio >> initializeConNombre:unNombre yFechaCreacion:unaFecha [
contenido:=OrderedCollection new.
super initializeConNombre: unNombre  yFechaCreacion: unaFecha 
]

{ #category : #'as yet unclassified' }
Directorio >> listadoDeContenido [
"Retorna un string con el listado del contenido del directorio imprimiendo el
path completo de cada elemento"
|listado todo|
listado :=WriteStream on: String new.
todo:='/', nombre.
listado <<(todo,self cantidadDeArchivos) .
self recorridoDeContenido: listado  conUltimaLinea: todo.
^listado contents.
]

{ #category : #'as yet unclassified' }
Directorio >> listar:stream ultimaLinea:ultima [
| todo ult|
todo:=String cr, ultima,'/', nombre, self cantidadDeArchivos .
ult:=ultima,'/', nombre.
stream<<todo.
self recorridoDeContenido: stream conUltimaLinea: ult.

]

{ #category : #'as yet unclassified' }
Directorio >> recorridoDeContenido:listado conUltimaLinea:ultima [
contenido do:[:elemento| elemento listar:listado ultimaLinea:ultima] .
]

{ #category : #'as yet unclassified' }
Directorio >> tamano [ 
"Devuelve un tamano fijo de directorio"
^32
]

{ #category : #'as yet unclassified' }
Directorio >> tamanoTotalOcupado [
"Retorna el espacio total ocupado en KB, incluyendo su contenido."
^((contenido sumNumbers:[:elemento | elemento tamanoTotalOcupado ])+ self tamano). 
]
