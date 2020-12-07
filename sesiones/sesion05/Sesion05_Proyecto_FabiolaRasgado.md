# Sesión 05
# Proyecto
# 21 de Noviembre de 2020
# Realizó: Fabiola Rasgado

# Descripción del proyecto
# El proyecto consiste en obtener todas las publicaciones que tengan 50 o más comentarios, 
# que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable 
# y estén ubicadas en Brazil.

## My Pipeline:

[{$match: {
  number_of_reviews: {$gte: 50},
  "review_scores.review_scores_rating": {$gte: 80}, 
  "amenities": { $in: [/Ethernet/i] },
  "address.country_code" : "BR" 
}}, {$sort: {
  number_of_reviews: 1
}}]
