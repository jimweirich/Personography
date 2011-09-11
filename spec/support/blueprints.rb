require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Category.blueprint do
  name { "sample" }
  sort_order { 50 }
end

Character.blueprint do
  name { "Bob" }
end

Tag.blueprint do
  character { Character.make }
  category { Category.make }
end

User.blueprint do
  name { "Bob" }
  email { "bob@sample.com" }
  password { "secret" }
end
