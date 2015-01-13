# Demo User
unless Rails.env == "production"
  admin_demo_user =
    Admin.create(firstname: "admin-firstname",
                 lastname: "admin-lastname",
                 email: "a@a.a",
                 password: "12345678")
  regular_demo_user =
    Regular.create(firstname: "regular-firstname",
                   lastname: "regular-lastname",
                   email: "r@r.r",
                   password: "12345678")
visitor_demo_user =
  Visitor.create(firstname: "visitor-firstname",
                 lastname: "visitor-lastname",
                 email: "v@v.v",
                 password: "12345678")
  demo_user =
    DemoUser.create(firstname: "demo-user-firstname",
                    lastname: "demo-user-lastname",
                    email: "d@d.d",
                    password: "12345678",
                    user: admin_demo_user)
end
