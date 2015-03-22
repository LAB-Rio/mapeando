FactoryGirl.define do

  sequence :email do |n|
    "test-#{n}@test.com"
  end

  sequence :name do |n|
    "Sample" if n == 0
    "Sample-#{n}" if not n == 0
  end

  sequence :fullname do |n|
    "Sample" if n == 0
    "Sample-#{n}" if not n == 0
  end

  factory :category do
    name
    travel_mode { 'driving' }
    icon_url { 'http://test.com/imagem.png' }
  end

  factory :user do
    email
    first_name { 'Test' }
    last_name { 'Data' }
    password { '123456' }
    district 
    avatar { 'http://placehold.it/60x60' }
  end

  factory :demand do
    user
    category
    fullname { "Sample" }

    factory :demand_with_pins do
      transient do
        pins_count 5
      end


      after(:create) do |demand, evaluator|
        create_list(:pin, evaluator.pins_count, demand: demand)
      end
    end

  end



  factory :pin do
    fullname
    lat { rand(1..40) }
    long { rand(1..30) }
    demand
  end

  factory :district do
    name "Copabacana"
    lat "-14.182827"
    long "-43.2424"
  end




end
