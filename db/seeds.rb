# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


Category.create([

  # A pe
  { name: 'Novas travessias de pedestres', travel_mode: 'walking' },
  { name: 'Novas passarelas de pedestres', travel_mode: 'walking' },
  { name: 'Estações de alta capacidade (Trem, Metro, BRT) que precisem de um projeto de requalificação do entorno', travel_mode: 'walking' },
  { name: 'Locais de travessia de pedestres inseguras', travel_mode: 'walking', issue: true },
  { name: 'Trechos de calçada deteriorados', travel_mode: 'walking', issue: true },

  # Bicicleta
  { name: 'Novos bicicletários', travel_mode: 'biking' },

  # Coletivo
  { name: 'Indicar novos terminais de onibus', travel_mode: 'bus' },
  { name: 'Novos pontos de onibus', travel_mode: 'bus' },


  # Motorizado individual
  { name: 'Indicar fechamento de ruas para transito exclusivo de pedestres', travel_mode: 'driving' },
  { name: 'Indicar ruas de trafego moderado (zona 30)', travel_mode: 'driving' },
  { name: 'Perimetro de pedagio urbano', travel_mode: 'driving' },


])
