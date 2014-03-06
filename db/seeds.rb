# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.new(
  email: ENV["ADMIN_EMAIL"],
  password: ENV["ADMIN_PASS"],
  password_confirmation:  ENV["ADMIN_PASS"]
)
admin.save!

project = Project.new(
  name: "My test",
  started: Date.today(),
  desc: "Magical Unicorns",
  image: "blank.png"
  )
project.save!

project_element = ProjectElement.new(
  name: "UI",
  body: "Unicorn Interface",
  project_id: project.id,
  status: 1
  )
project_element.save!

project_subelement = ProjectSubelement.new(
  name: "Buttons",
  status: 1,
  project_element_id: project_element.id
  )
project_subelement.save!
project_subelement = ProjectSubelement.new(
  name: "Text!",
  status: 2,
  project_element_id: project_element.id
  )
project_subelement.save!
