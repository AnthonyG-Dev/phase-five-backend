# seeds.rb
puts 'seeding .....'
# Create Courses
courses = Course.create([
  { name: 'Course 1', start: Date.today, end: Date.today + 1.week, description: 'Description for Course 1' },
  { name: 'Course 2', start: Date.today, end: Date.today + 2.weeks, description: 'Description for Course 2' }
])

# Create Users
users = User.create([
  { name: 'User 1', password: 'password1', role: 'role1', avatar: 'avatar1', course: courses.first },
  { name: 'User 2', password: 'password2', role: 'role2', avatar: 'avatar2', course: courses.last }
])

# Create Announcements
announcements = Announcement.create([
  { content: 'Announcement 1 for Course 1', course: courses.first },
  { content: 'Announcement 2 for Course 2', course: courses.last }
])

# Create Sessions
sessions = Session.create([
  { start: Date.today, end: Date.today + 1.day, link: 'session_link_1', course: courses.first },
  { start: Date.today, end: Date.today + 2.days, link: 'session_link_2', course: courses.last }
])

# Create Comments
comments = Comment.create([
  { content: 'Comment 1 for Session 1', session: sessions.first, user: users.first },
  { content: 'Comment 2 for Session 2', session: sessions.last, user: users.last }
])

puts 'done !!!!!!!!!'