# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - User has many wods, movements, user_movements, userwods
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - wods & movements belong to user as owner, user_wods & usermovements belong to user
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - wods have many movements through move_wods
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - movement_attributes submittable by user to create and edit wods
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item):
	- validation for presence of name, movement_type and quantity for movements
	- validation for uniqueness of name movements
	- validation for inclusion for movement_type for movements
	- validation for presence of title, wod_tyoe, description for wods
	- validation for uniqueness of title for wods
	- validation for inclusion for wod_tyoe for wods
	- validation for presence and uniquesness of name and email for users
	- has_secure_password for presence of password and validation for password length
	- validation for presence of name and result for usermovement and userwod
	- validation for numericality of result for usermovement and userwod
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes):
	- scope by_pr used in usermovement and userwod - it shows a user their PRs (personal records) - added tweak through helper method ensures only one PR per movement or wod
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item):
	- wod partial form contain a collection_check_boxes to choose movements for a wod - new and edit views use this partial
- [X] Include signup (how e.g. Devise) - ensures unique name and email and existence of password, checks for pre-existence of user
- [X] Include login (how e.g. Devise) - uses a sessionController, uses the bcrypt gem, has_secure_password, aunthenticate password, user existence and password length
- [X] Include logout (how e.g. Devise) - uses a sessionController, clears the session on logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) - users can sign in with Facebook
- [X] Include nested resource show or index (URL e.g. users/2/recipes) - movements and wods are nested under admin for index and show
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - movements and wods use forms that reflect their nested status
- [X] Include form display of validation errors (form URL e.g. /recipes/new) - individual fields for forms are enclosed in a div.field and forms call to partial errors in apllication views

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate