paris = User.create(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@tournapets.com', password: 'tournapets')
deja = User.create(f_name: 'Deja', l_name: 'Baker', username: 'dbaker', email:'deja@tournapets.com', password: 'tournapets')
tim = User.create(f_name: 'Tim', l_name: 'Cook', username: 'tcook', email:'tim@tournapets.com', password: 'tournapets')
jon = User.create(f_name: 'Jon', l_name: 'Young', username: 'jyoung', email:'jon@tournapets.com', password: 'tournapets')
rod = User.create(f_name: 'Rod', l_name: 'Levy', username: 'rlevy', email:'rod@tournapets.com', password: 'tournapets')
alex = User.create(f_name: 'Alex', l_name: 'Sachs', username: 'asachs', email:'alex@tournapets.com', password: 'tournapets')
mickey = User.create(f_name: 'Mickey', l_name: 'Witchuwong', username: 'mwitchuwong', email: 'mickey@tournapets.com', password: 'tournapets')
kara = User.create(f_name: 'Kara', l_name: 'Carrell', username: 'kcarrell', email:'kara@tournapets.com', password: 'tournapets')

images = [
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung7762711666.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung8931514973.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung7496406892.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung2952165185.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung1310762334.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung8733995011.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung7905615757.jpeg",
  "https://s3.us-east-2.amazonaws.com/delta-final/jyoung3102390358.jpeg"
]

i = 1
8.times do
  new_link = MediaLink.create(user_id: i, link: images[i-1], link_type:'image/jpg')
  new_pet = Pet.create(breed: Faker::Dog.breed, name: Faker::Dog.name, user_id: i, profile_pic: images[i-1])
  new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
  new_entry = Entry.create(pets_media_link_id: new_pets_media_link.id, vote_count: rand(20..100))
  if i % 2 == 0
    new_pets_media_link2 = PetsMediaLink.create(pet_id: (i - 1), media_link_id: new_link.id)
  end
  i += 1
end

tournament = Tournament.create(theme: 'Cutest Puppy')
i = 1
8.times do
  
  i += 1
end
tournament2 = Tournament.create(theme: 'Funniest Trick')
i = 1
8.times do
  
  i += 1
end
