# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Demo User
admin_demo_user =
  Admin.create(firstname: "admin-firstname",
               lastname: "admin-lastname",
               email: "admin@admin.admin",
               password: "12345678")
regular_demo_user =
  Regular.create(firstname: "regular-firstname",
                 lastname: "regular-lastname",
                 email: "regular@regular.regular",
                 password: "12345678")
visitor_demo_user =
  Visitor.create(firstname: "visitor-firstname",
                 lastname: "visitor-lastname",
                 email: "visitor@visitor.visitor",
                 password: "12345678")
demo_user =
  DemoUser.create(firstname: "demo-user-firstname",
                  lastname: "demo-user-lastname",
                  email: "demo@demo.demo",
                  password: "12345678",
                  user: admin_demo_user)
