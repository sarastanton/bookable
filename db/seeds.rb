# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Allison", password_digest: "password")
User.create(username: "Brian", password_digest: "password")
User.create(username: "Carrie", password_digest: "password")
User.create(username: "Doug", password_digest: "password")

Author.create(name: "Leigh Bardugo" )
Author.create(name: "Diana Gabaldon")
Author.create(name: "Maggie Stiefvater")
Author.create(name: "Ruth Ware")
Author.create(name: "Stephen King")

Genre.create(name: "YA Fantasy")
Genre.create(name: "Historical Romance")
Genre.create(name: "Mystery Thriller")
Genre.create(name: "Horror")

Book.create(title: "Six of Crows"  author_id: 1,  genre_id: 1,  page_count: 510)
Book.create(title: "Crooked Kingdom"  author_id: 1, genre_id:1,  page_count: 536)
Book.create(title: "Outlander"  author_id: 2,  genre_id: 2,  page_count: 850 )
Book.create(title: "The Raven Boys" author_id: 3, genre_id: 1,  page_count: 409)
Book.create(title: "The Lying Game" author_id: 3, genre_id: 3,  page_count: 370)
Book.create(title: "Insomnia" author_id: 4, genre_id: 4,  page_count: 890)
Book.create(title: "The Shining" author_id: 4, genre_id: 4, page_count: 447)
