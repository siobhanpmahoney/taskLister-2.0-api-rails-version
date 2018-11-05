# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


6.times do
  u = User.find_or_create_by(username: Faker::Community.characters.downcase.split(" ").join("_"))
  u.update(password: u.username, password_confirmation: u.username)
end

siobhan = User.create(username: "siobhan", password: "siobhan", password_confirmation: "siobhan")

15.times do
  t = Task.find_or_create_by(title: Faker::Hacker.say_something_smart)
  options = ["new", "in progress", "under review", "closed"]
  t.update(
    description: Faker::Community.quotes,
    priority: true,
    status_summary: options.sample
  )
end


12.times do
  t = Tag.find_or_create_by(title: Faker::Hacker.noun)
end

6.times do
  t = Tag.find_or_create_by(title: Faker::Hacker.abbreviation)
end

8.times do
  t = Page.find_or_create_by(path: Faker::Internet.url)
end

Task.all.each do |task|
  task.pages << Page.all.sample
  2.times do
    task.users << User.all.sample
  end
  3.times do
    task.tags << Tag.all.sample
  end
end

users_no_tasks = User.all.select {|user| user.tasks.length == 0}

users_no_tasks.each do |u|
  u.tasks << Task.all.sample
end

pages_no_tasks = Page.all.select {|page| page.tasks.length == 0}

pages_no_tasks.each do |p|
  p.tasks << Task.all.sample
end

tags_no_tasks = Tag.all.select {|tag| tag.tasks.length == 0}

tags_no_tasks.each do |p|
  p.tasks << Task.all.sample
end
