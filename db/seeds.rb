(1..20).to_a.each do |num|
    Destination.create(title: "Destination #{num}", completed: [true, false].sample)
end