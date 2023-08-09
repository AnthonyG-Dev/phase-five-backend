puts 'seeding .....'

# Create Courses
courses = Course.create([
  { name: 'Course 1', start: Date.today, end: Date.today + 1.week, description: 'Description for Course 1' },
  { name: 'Course 2', start: Date.today, end: Date.today + 2.weeks, description: 'Description for Course 2' }
])

# Create Users
users = User.create([
  { name: 'User 1', email: 'user1@gmail.com', password: 'password1', role: 'role1', avatar: 'avatar1', course: courses.first },
  { name: 'User 2', email: 'user2@gmail.com', password: 'password2', role: 'role2', avatar: 'avatar2', course: courses.last }
])

# Create Announcements
announcements = Announcement.create([
  { content: 'Announcement 1 for Course 1', course: courses.first },
  { content: 'Announcement 2 for Course 2', course: courses.last }
])

# Create Sessions
sessions = Session.create([
  { start: Time.now.strftime('%H:%M'), end: (Time.now + 1.hour).strftime('%H:%M'), link: 'https://meet.google.com/fup-umru-noo', course: courses.first },
  { start: Time.now.strftime('%H:%M'), end: (Time.now + 2.hours).strftime('%H:%M'), link: 'https://meet.google.com/fup-umru-noo', course: courses.last }
])



# Create Comments
comments = Comment.create([
  { content: 'Comment 1 for Session 1', session: sessions.first, user: users.first },
  { content: 'Comment 2 for Session 2', session: sessions.last, user: users.last }
])

puts 'done !!!!!!!!!'
