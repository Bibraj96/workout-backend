# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

blendi = User.create(email: "blendiibraj14@gmail.com", username: "blendi", password: "password")
b_workout = Workout.create(user_id: blendi.id, title: "Legs", date: "2020-11-03")
b_exercise = Exercise.create(workout_id: b_workout.id, name: "Squat", sets: 3, reps: 8, weight: 185)
