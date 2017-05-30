Project must haves:
	* a has_many, a belongs_to and a has_many :through relationship
	* reasonable validations for the simple attributes
	* one class level ActiveRecord scope method
	* a nested form that writes to an associated model through a custom attribute writer, e.g. recipe[ingredients_attributes][0][name] which would write to the recipe model through a method ingredient_attributes=  NOTE: you cannot use accepts_nested_attributes_for macro.
	* standard user authentication, including signup, login, logout and passwords.
	* must have login from wome other service, such as facebook, twitter, etc. - ominauth
	* must make use of nested resources, e.g. /profiles/1/pictures/new 
	* forms must correctly display validation errors. Fields should be enclosed within a fields_for_errors class and error messages describing the validation failures must be present within the view.
	* application must be DRY



	1. Members/Users/Owner - user_admin
	2. WODs
	3. Movements
	4. PRs


1. Users
	Admin user creates all the WODs and the movements

	Users have a name, email, password and admin (boolean true/false)
	Users have many WODs
	Users have many movements

	Users can signup, signin and signout
	Users can only access their own information
	Admin User can access all information on anyone

	Users can record results for WODs they have done
	Users can record results for movements they have done 
	Users can note when they hit a PR
	Users cannot create WODs or create movements
	Users can view all their WODs, individual WODs and the WODs they PR'd in
	Users can view all their movements, individual movements and the movements they have PR'd in

2. WODs
	WODs have a name (actual name or the date), date, result, type (either 'for time', 'for weight' or 'for repetitions'), movements and PR (boolean true/false)
	WODs belong to a user
	WODs have many movements

	WODs are selected from a list of existing WODs created by Admin user
	WODs can be listed by name (and then best result)? to group the same WOD to compare results

3. Movements
	Movements have a name, date, result, type ('time', 'weight' or 'repetitions') and PR (boolean true/false)
	Movements belong to a user
	Movements have many WODs

	Movements are selected from a list of existing WODs created by the Admin user
	Movements can be displayed by name (and then by best result)? to group the same movement to compare results

4. PRs are a boolean field in WODs and movements	
	PRs can be listed by all, by WOD or by individual movements
	Recording a PR for a WOD or movement removes it from previous WODs or movements of the same name?

