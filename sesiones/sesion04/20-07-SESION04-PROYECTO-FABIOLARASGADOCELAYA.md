# ---------------------------------------------------------------------------------------
# 20-07
# Proyecto Sesion 04
# Realizo: Fabiola Rasgado Celaya
# Sabado 14 de Noviembre de 2020
# ---------------------------------------------------------------------------------------

# Las consultas se realizarán sobre la base sample_training.
# Todas las consultas que realices deberás mantenerlas dentro del MongoDB Compass. 
# Para hacer esto, da clic en el botón con los puntos ··· y en Toogle Query History. 
# Busca la última consulta y agregala a favoritos presionando el íncono con la estrella ⭐.

# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# No. 01 - Obtén los datos de contacto de cada compañía.
# ---------------------------------------------------------------------------------------
## COLECCION
companies

## PROJECT
{
 name: 1,
 homepage_url: 1,
 twitter_username: 1,
 email_address: 1,
 phone_number: 1,
 description: 1
}

# ---------------------------------------------------------------------------------------
# No. 02 - Obtén la fuente de cada tweet.
# ---------------------------------------------------------------------------------------
## COLECCION
tweets

## PROJECT
{
 id: 1,
 source: 1,
 _id: 1
}

# ---------------------------------------------------------------------------------------
# No. 03 - Obtén el nombre de todas las compañias fundadas en octubre.
# ---------------------------------------------------------------------------------------
## COLECCION
companies

## FILTER
{
 founded_month: {
  $eq: 10
 }
}

## PROJECT
{
 name: 1,
 founded_month: 1,
 _id: 0
}

# ---------------------------------------------------------------------------------------
# No. 04 - Obtén el nombre de todas las compañías fundadas en 2008.
# ---------------------------------------------------------------------------------------
## COLECCION
companies

## FILTER
{
 founded_year: {
  $eq: 2008
 }
}

## PROJECT
{
 name: 1,
 founded_year: 1,
 _id: 0
}

# ---------------------------------------------------------------------------------------
# No. 05 - Obtén todos los post del autor machine.
# ---------------------------------------------------------------------------------------
## COLECCION
posts

## FILTER 
{
 author: {
  $eq: 'machine'
 }
}

# ---------------------------------------------------------------------------------------
# No. 06 - Obtén todos los tweets provenientes de la web.
# ---------------------------------------------------------------------------------------
## COLECCION
tweets

## FILTER 
{
 source: {
  $eq: 'web'
 }
}

# ---------------------------------------------------------------------------------------
# No. 07 - Obtén todas las compañías fundadas en octubre del 2008.
# ---------------------------------------------------------------------------------------
## COLECCION
companies

## FILTER 
{
 founded_month: {
  $eq: 10
 },
 founded_year: {
  $eq: 2008
 }
}

# ---------------------------------------------------------------------------------------
# No. 08 - Obtén todas las compañias con más de 50 empleados.
# ---------------------------------------------------------------------------------------
## COLECCION
companies

## FILTER 
{
 number_of_employees: {
  $gt: 50
 }
}

## SORT
{
 number_of_employees: 1
}

# ---------------------------------------------------------------------------------------
# No. 09 - Obtén las historias con número de comentarios entre 10 y 30.
# ---------------------------------------------------------------------------------------
## COLECCION
stories

## FILTER
{
 comments: {
  $gte: 10,
  $lte: 30
 }
}

## PROJECT
{
 href: 1,
 title: 1,
 description: 1,
 comments: 1
}

## SORT

{
 comments: 1
}

# ---------------------------------------------------------------------------------------
# No. 10 - Obtén la empresa con el menor número de empleados.
# ---------------------------------------------------------------------------------------
## COLECCION
companies 

##FILTER
{
 number_of_employees: {
  $ne: null
 }
}

## PROJECT
{
 name: 1,
 number_of_employees: 1
}

## SORT
{
 number_of_employees: 1
}

## LIMIT 
1

# ---------------------------------------------------------------------------------------
# No. 11 - Obtén la empresa con el mayor número de empleados.
# ---------------------------------------------------------------------------------------
## COLECCION
companies 

##FILTER
{
 number_of_employees: {
  $ne: null
 }
}

## PROJECT
{
 name: 1,
 number_of_employees: 1
}

## SORT
{
 number_of_employees: -1
}

## LIMIT 
1

# ---------------------------------------------------------------------------------------
# No. 12 - Obtén la historia más comentada.
# ---------------------------------------------------------------------------------------
## COLECCION
stories 

## PROJECT 
{
 href: 1,
 title: 1,
 description: 1,
 comments: 1
}

## SORT
{
 comments: -1
}

## LIMIT
1


# ---------------------------------------------------------------------------------------
# No. 13 - Obtén la historia menos comentada.
# ---------------------------------------------------------------------------------------
## COLECCION
stories 

## PROJECT 
{
 href: 1,
 title: 1,
 description: 1,
 comments: 1
}

## SORT
{
 comments: 1
}

## LIMIT
1
