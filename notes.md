
	1. Members/Users/Owner - user_admin
	2. WODs
	3. Movements
	4. PRs


1. Users
	Users have a name, email, password and admin (boolean true/false)
	Users have many WODs
	Users have many movements

	Users can signup, signin and signout
	Users can only access their own information
	Admin User can access all information on anyone

	Users can record WODs they have done and their WOD result
	Users can record movements they have done and their movement results
	Users can note when they hit a PR
	Users can view all their WODs, individual WODs and the WODs they PR'd in
	Users can view all their movements, individual movements and the movements they have PR'd in
	Users 

2. WODs
	WODs have a name (actual name or the date), date, result, type (either 'for time', 'for weight' or 'for repetitions') and PR (boolean true/false)
	WODs belong to a user
	WODs have many movements

	WODs are either selected from a list of existing WODs or are created
	WODs can be listed by name to group the same WOD to compare results

3. Movements
	Movements have a name, date, result, type ('time', 'weight' or 'repetitions') and PR (boolean true/false)
	Movements belong to a user
	Movements belong to a WOD
	Movements have many WODs

	Movements are either selected from a list of existing WODs or are created
	Movements can be listed by name to group the same movement to compare results

4. PRs are only a boolean field in WODs and movements	
	PRs can be listed by all, WOD or individual movements

