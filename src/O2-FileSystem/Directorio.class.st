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
^(contenido collect: [ :elemento | elemento archivoMasGrande   ] )detectMax: [ :archivo | archivo tamanoTotalOcupado   ].
]

{ #category : #'as yet unclassified' }
Directorio >> archivoMasNuevo [
"retorna el archivo con fecha de creacion más reciente en cualquier nivel del
filesystem contenido por directorio receptor."
^(contenido collect: [ :elemento | elemento archivoMasNuevo  ] )detectMax: [ :archivo | archivo fechaCreacion  ].
]

{ #category : #'as yet unclassified' }
Directorio >> cantidadDeArchivos [
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
|listado todo|
listado :=WriteStream on: String new.
todo:='/', nombre.
listado <<todo.
contenido do:[:elemento| elemento listar:listado ] .
^listado contents.
]

{ #category : #'as yet unclassified' }
Directorio >> listar:stream [
| todo |

todo:=  String cr,stream contents,'/', nombre.
stream<<todo.
contenido do:[:elemento | elemento listar:stream ].

]

{ #category : #'as yet unclassified' }
Directorio >> tamano [ 
^32
]

{ #category : #'as yet unclassified' }
Directorio >> tamanoTotalOcupado [
"Retorna el espacio total ocupado en KB, incluyendo su contenido."
^((contenido sumNumbers:[:elemento | elemento tamanoTotalOcupado ])+ self tamano). 
]
