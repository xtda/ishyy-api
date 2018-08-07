# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mayor.create

tow = TowJob.create(code: 'tow', title: 'Tow truck driver', base_pay: 25)
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'T20')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Pant')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Adder')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Ambulance')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Granger')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Sandking')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Sultan')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'car', response: 'Police Cruiser')

tow.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Mission Row Police Department')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'The Square Garage')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Pillbox Medical Center')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Train Station')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Court House')

tow.tempjobresponses.create(response_sign: "positive", response_type: 'tow_type', response: 'an illegal parked')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'tow_type', response: 'an abandoned')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'tow_type', response: 'a crashed')
tow.tempjobresponses.create(response_sign: "positive", response_type: 'tow_type', response: 'a broken down')


taxi = TaxiJob.create(code: 'taxi', title: 'taxi driver', base_pay: 25)

taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: '1 passenger')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: '2 passengers')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: '3 passengers')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: 'Judge Holliday')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: 'Lisha De Witt')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: 'Wyatt Derp')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'number', response: 'a very drunk Jonass')

taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Mission Row Police Department')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'The Square Garage')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Pillbox Medical Center')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Train Station')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'Court House')
taxi.tempjobresponses.create(response_sign: "positive", response_type: 'location', response: 'their apartment')
