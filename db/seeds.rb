Location.destroy_all
Tutor.destroy_all
Student.destroy_all
Subject.destroy_all
TutorSubject.destroy_all
Appointment.destroy_all

# Locations
central = Location.create({name: "Central", address: Faker::Address.street_address})
north = Location.create({name: "North", address: Faker::Address.street_address})
south = Location.create({name: "South", address: Faker::Address.street_address})

# Tutors
12.times { Tutor.create({name: Faker::Name.name, location_id: Location.all.sample.id}) }

# Students

s1 = Student.create({name: Faker::Name.name, username: "ruth1", password: "ruth@student"})
s2 = Student.create({name: Faker::Name.name})
s3 = Student.create({name: Faker::Name.name})
s4 = Student.create({name: Faker::Name.name})
s5 = Student.create({name: Faker::Name.name})
s6 = Student.create({name: Faker::Name.name})

30.times { Student.create({name: Faker::Name.name}) }


# Subjects
math = Subject.create({name: "Math"})
science = Subject.create({name: "Science"})
english = Subject.create({name: "English"})
history = Subject.create({name: "History"})
business = Subject.create({name: "Business"})
computer_science = Subject.create({name: "Computer Science"})

# Tutor Subjects
24.times { TutorSubject.create({tutor_id: Tutor.all.sample.id, subject_id: Subject.all.sample.id}) }

# Appointments
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