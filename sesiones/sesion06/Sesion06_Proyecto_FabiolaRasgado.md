#Sesion 06
#Realizo: Fabiola Rasgado

## El proyecto consiste en obtener, por país, el número de películas que hay de cada género. 
## Un ejemplo de salida en formato de tabla sería:

[{$project: {
  title: 1,
  genres: 1,
  countries: 1,
  _id: 0
}}, {$unwind: {
  path: '$countries'
}}, {$unwind: {
  path: '$genres'
}}, {$group: {
  _id: {
    pais: '$countries',
    genero: '$genres'
  },
  titulos: {
    $sum: 1
  }
}}, {$project: {
  pais: '$_id.pais',
  genero: '$_id.genero',
  titulos: 1,
  _id: 0
}}, {$sort: {
  titulos: -1
}}]


