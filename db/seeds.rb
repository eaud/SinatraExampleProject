5.times do
  name = Faker::Name.first_name
  Doer.create(name: name)
end

25.times do
  title = Faker::Company.bs
  details = Faker::Hacker.say_something_smart
  doer_id = rand(1..5)
  Task.create(title: title, details: details, doer_id: doer_id)
end
