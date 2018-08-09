# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)

Mayor.find_or_create_by(id: 1)

tow = TowJob.find_or_create_by(code: 'tow', title: 'Tow truck driver')
tow.base_pay = 175
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'T20')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Pant')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Adder')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Ambulance')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Granger')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Sandking')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Sultan')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'car', response: 'Police Cruiser')

tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Mission Row Police Department')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'The Square Garage')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Pillbox Medical Center')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Train Station')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Court House')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'their apartment')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Paleto Bank')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Clucking Bell Farms')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'the lifeinvader building')

tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'tow_type', response: 'an illegal parked')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'tow_type', response: 'an abandoned')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'tow_type', response: 'a crashed')
tow.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'tow_type', response: 'a broken down')

taxi = TaxiJob.find_or_create_by(code: 'taxi', title: 'taxi driver', base_pay: 175)
taxi.base_pay = 175
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: '1 passenger')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: '2 passengers')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: '3 passengers')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Judge Holliday')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Lisha De Witt')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Wyatt Derp')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'a very drunk Jonass')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Judge Holden')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Detective Snow')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Nullcom')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: 'Hannah')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'number', response: '05_Brock')

taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Mission Row Police Department')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'The Square Garage')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Pillbox Medical Center')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Train Station')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Court House')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'their apartment')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Paleto Bank')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'Clucking Bell Farms')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'the pier to get a cream pie')
taxi.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'location', response: 'the lifeinvader building')

taxi.tempjobresponses.find_or_create_by(response_sign: 'negative', response_type: 'negative', response: 'Axed a question by Hannah and she stole')
taxi.tempjobresponses.find_or_create_by(response_sign: 'negative', response_type: 'negative', response: 'Daveo did a runner and you lost')
taxi.tempjobresponses.find_or_create_by(response_sign: 'negative', response_type: 'negative', response: "You got held up by the 'The Black Bandit' he took your phone and ")

drug = DrugJob.find_or_create_by(code: 'drugs', title: 'Drug dealer')
drug.base_pay = 0
drug.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'drugs', response: 'of crystal meth')
drug.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'drugs', response: 'joints')
drug.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'drugs', response: 'of week')
drug.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'drugs', response: 'ounce of cocaine')
drug.tempjobresponses.find_or_create_by(response_sign: 'positive', response_type: 'drugs', response: 'ecstasy tablets')
