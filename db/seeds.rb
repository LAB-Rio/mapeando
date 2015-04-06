# encoding: UTF-8
#

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'csv'

Category.create([

  # A pe
  { name: 'Nova travessia de pedestre', travel_mode: 'walking', icon_url: 'http://i.imgur.com/ISQeE1f.png' },
  { name: 'Reajuste do tempo do semáforo', travel_mode: 'walking', icon_url: 'http://i.imgur.com/ObLDwfp.png' },

  # Coletivo
  { name: 'Novo ponto de ônibus', travel_mode: 'bus', icon_url: 'http://i.imgur.com/jvhVwVy.png' },
  { name: 'Novo terminal de ônibus', travel_mode: 'bus', icon_url: 'http://i.imgur.com/zry52P2.png' },

  # Bicicleta
  { name: 'Novo posto de BikeRio', travel_mode: 'biking', icon_url: 'http://i.imgur.com/Nx6uN7a.png' },
  { name: 'Quero uma ciclovia passando aqui', travel_mode: 'biking', icon_url: 'http://i.imgur.com/PGkr5aX.png' },


  # Motorizado individual
  { name: 'Restrição do tráfego de automóveis', travel_mode: 'driving', icon_url: 'http://i.imgur.com/TwAqclO.png' },
  { name: 'Redução da velocidade máxima para automóveis', travel_mode: 'driving', icon_url: 'http://i.imgur.com/Ie4XIjz.png' }


])




districts = CSV.read(Rails.root.join('db/sampledata/bairros.csv'), encoding: 'ISO8859-1')


districts.each do |row|
  District.create(name: row[0].encode('utf-8'), lat: row[1], long: row[2])
end

#create(first_name: 'Luiz', email: 'eu@luiz.cc', district_id: District.first.id, last_name: 'Claudio', password: '123456')
