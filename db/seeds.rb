5.times do |i|
  User.find_or_create_by name: "user#{i + 1}", email: "user_#{i + 1}@example.com"
end
