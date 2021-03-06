Location.destroy_all
Tutor.destroy_all
Student.destroy_all
Subject.destroy_all
TutorSubject.destroy_all
Appointment.destroy_all

# Locations -------------------------------------------------------------------------------------

central = Location.create({name: "Central", address: Faker::Address.street_address})
north = Location.create({name: "North", address: Faker::Address.street_address})
south = Location.create({name: "South", address: Faker::Address.street_address})

# Tutors -> Demo --------------------------------------------------------------------------------

Tutor.create({name: Faker::Name.name, location_id: Location.all.sample.id, username: "josh", password: "josh@tutor"})
Tutor.create({name: Faker::Name.name, location_id: Location.all.sample.id, username: "steven", password: "steven@tutor"})

# Tutors -> Generate

12.times { Tutor.create({
    name: Faker::Name.name, 
    location_id: Location.all.sample.id, 
    username: Faker::Name.first_name, 
    password: "tutor123"
    }) 
}

# Students -> Demo ------------------------------------------------------------------------------

ruth = Student.create({name: "Ruth Obe", username: "ruth1", password: "ruth@student"})
angelo = Student.create({name: "Angelo Xenakis", username: "angelo", password: "angelo@student"})

# Students -> Generate

30.times { Student.create({
    name: Faker::Name.name, 
    username: Faker::Name.first_name, 
    password: "student123"
    }) 
}

# Subjects -------------------------------------------------------------------------------------

math = Subject.create({name: "Math"})
science = Subject.create({name: "Science"})
english = Subject.create({name: "English"})
history = Subject.create({name: "History"})
business = Subject.create({name: "Business"})
computer_science = Subject.create({name: "Computer Science"})

# Tutor Subjects -------------------------------------------------------------------------------

36.times { TutorSubject.create({tutor_id: Tutor.all.sample.id, subject_id: Subject.all.sample.id}) }

# Appointments ---------------------------------------------------------------------------------

120.times { 
    Appointment.create({
        student_id: Student.all.sample.id, 
        tutor_id: Tutor.all.sample.id, 
        subject_id: Subject.all.sample.id, 
        location_id: Location.all.sample.id,
        date: Faker::Date.in_date_period(month: 2),
        time: Faker::Time.forward(days: 23, period: :morning)
    }) 
}