require 'machinist/active_record'

User.blueprint do
  email { "test#{sn}@trashmail.com" }
end

Project.blueprint do
end

Signature.blueprint do
  user
  project
end
