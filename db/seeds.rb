# Hunters:

pete = Hunter.create(email: "pete@email.com", name: "Pete", password: "password")
joshua = Hunter.create(email: "joshua@email.com", name: "Joshua", password: "password")

#Snake Sacks:

# everglades = SnakeSack.create(name: "Everglades", hunter_id: joshua.id)
# florida = SnakeSack.create(name: "Florida", hunter_id: joshua.id)
# summer = SnakeSack.create(name: "Summer", hunter_id: pete.id)

# Snakes:

Snake.create(length: 10, weight: 150, monetary_value: 450, hunter_id: joshua.id )
Snake.create(length: 8, weight: 50, monetary_value: 400, hunter_id: pete.id)
Snake.create(length: 7, weight: 70, monetary_value: 300, hunter_id: joshua.id)
Snake.create(length: 16, weight: 190, monetary_value: 500, hunter_id: pete.id
Snake.create(length: 5, weight: 30, monetary_value: 100, hunter_id: joshua.id)









