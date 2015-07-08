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

if Category.count == 0
  Category.create([

    # A pe
    { name: 'Nova travessia de pedestre', travel_mode: 'walking', icon_url: 'http://i.imgur.com/ASDCc9X.png' },
    { name: 'Reajuste do tempo do semáforo', travel_mode: 'walking', icon_url: 'http://i.imgur.com/fdthG3S.png' },

    # Coletivo
    { name: 'Novo ponto de ônibus', travel_mode: 'bus', icon_url: 'http://i.imgur.com/uwfzE3Y.png' },
    { name: 'Novo terminal de ônibus', travel_mode: 'bus', icon_url: 'http://i.imgur.com/zQ0p6pU.png' },

    # Bicicleta
    { name: 'Novo posto de BikeRio', travel_mode: 'biking', icon_url: 'http://i.imgur.com/rWyzqUL.png' },
    { name: 'Nova rota cicloviária', travel_mode: 'biking', icon_url: 'http://i.imgur.com/hVY6WqQ.png' },


    # Motorizado individual
    { name: 'Restrição do tráfego de automóveis', travel_mode: 'driving', icon_url: 'http://i.imgur.com/ukGgfHS.png' },
    { name: 'Redução da velocidade máxima para automóveis', travel_mode: 'driving', icon_url: 'http://i.imgur.com/aNDLZnZ.png' },

    # PMUS
    { name: 'Novo bicicletário', travel_mode: 'biking', icon_url: 'http://i.imgur.com/Ohen8NH.png', issue: true },
    { name: 'Alargamento de calçada', travel_mode: 'walking', icon_url: 'http://i.imgur.com/Hkq5Lnc.png', issue: true },
    { name: 'Novo corredor de alta capacidade', travel_mode: 'bus', icon_url: 'http://i.imgur.com/6Bz1cxJ.png', issue: true }

  ])
end




#districts = CSV.read(Rails.root.join('db/sampledata/bairros.csv'), encoding: 'ISO8859-1')


#districts.each do |row|
  #District.where(name: row[0].encode('utf-8'), lat: row[1], long: row[2]).first_or_create
#end
districts.each do |row|
  District.where(name: row[0].encode('utf-8'), lat: row[1], long: row[2], zone: row[3]).first_or_create
end

#create(first_name: 'Luiz', email: 'eu@luiz.cc', district_id: District.first.id, last_name: 'Claudio', password: '123456')


#zones = CSV.read(Rails.root.join("db/sampledata/bairros_zones.csv"), encoding: 'ISO8859-1')

#zones.each do |row|
  #d = District.where(id: row[0]).first
  #r = row[2] || ''
  #d.update_attribute(:zone, r) 
#end



#geom = CSV.read(Rails.root.join("db/sampledata/bairros_geometries.csv"), encoding: 'utf-8')

#geom.each do |row|
  #d = District.where(name: row[1]).first
  #d.update_attributes(shape_area: row[6], shape_length: row[7], geo: row[9]) if d
#end
