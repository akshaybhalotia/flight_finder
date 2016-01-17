# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flight.delete_all
Flight.create!(origin: 'A',
              destination: 'B',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 1000.00
             )
Flight.create!(origin: 'A',
              destination: 'C',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 2000.00
             )
Flight.create!(origin: 'B',
              destination: 'A',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 3000.00
             )
Flight.create!(origin: 'B',
              destination: 'C',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 4000.00
             )
Flight.create!(origin: 'C',
              destination: 'A',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 5000.00
             )
Flight.create!(origin: 'C',
              destination: 'B',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 AM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 AM", "%d/%m/%Y %I:%M %p"),
              price: 6000.00
             )
Flight.create!(origin: 'A',
              destination: 'B',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 7000.00
             )
Flight.create!(origin: 'A',
              destination: 'C',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 8000.00
             )
Flight.create!(origin: 'B',
              destination: 'A',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 9000.00
             )
Flight.create!(origin: 'B',
              destination: 'C',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 10000.00
)
Flight.create!(origin: 'C',
              destination: 'A',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 11000.00
             )
Flight.create!(origin: 'C',
              destination: 'B',
              date_of_journey: Date.strptime("01/02/2016", "%d/%m/%Y"),
              departure_time: DateTime.strptime("01/02/2016 06:00 PM", "%d/%m/%Y %I:%M %p"),
              arrival_time: DateTime.strptime("01/02/2016 08:00 PM", "%d/%m/%Y %I:%M %p"),
              price: 12000.00
             )
