# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (Author has many Books)
- [X] Include at least one belongs_to relationship (Book belongs to an Author)
- [X] Include at least one has_many through relationship (User has many Books through ReadStatuses)
- [X] The "through" part of the has_many through includes at least one user submittable attribute (read_status.value)
- [X] Include reasonable validations for simple model objects (Author, Book, Genre, Rating, Review, User)
- [X] Include a class level ActiveRecord scope method (Review.my_reviews // URL: /users/:id)
- [X] Include signup (URL: /signup)
- [X] Include login (URL: /login)
- [X] Include logout (URL: /logout)
- [X] Include third party signup/login (OmniAuth - Goodreads)
- [X] Include nested resource show or index (URL: /books/3/reviews)
- [X] Include nested resource "new" form (URL: /books/3/reviews/new)
- [X] Include form display of validation errors (URL: /books/new

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
