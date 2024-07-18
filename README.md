# imageviewer
a flutter app for image viewer

FEATURES
User Sign-Up: Users can sign up by providing a username and password.
User Login: Users can log in using the credentials provided during sign-up.
Image Viewing: After logging in, users can view images fetched from the Picsum Photos API along with the author's name.

APP STRUCTURE:
main.dart: Entry point of the application.
signup.dart: Contains the sign-up page where users can create an account.
login.dart: Contains the login page where users can log in using their credentials.
image.dart: Contains the main functionality for displaying images from the API.

DEPENDENCIES:
shared_preferences: Used for storing and retrieving user credentials.
http: Used for fetching data from the web API.

SIGUNUP:
Users can enter a username and password.
Data is validated to ensure fields are not empty.
Credentials are saved using SharedPreferences.
Upon successful sign-up, users are navigated to the login page.

LOGIN:
Users can enter their username and password.
Credentials are validated against the stored data.
Upon successful login, users are navigated to the image viewing page.
If credentials are incorrect, an error message is displayed.

IMAGE VIEWING PAGE
Fetches a list of images from the web API.
Displays each image with the author's name below it.
