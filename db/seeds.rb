u = User.create(email: "me@me.com", password: "password")
u.notes.create(title: "Howdy", body: "Pick up the cat.")
