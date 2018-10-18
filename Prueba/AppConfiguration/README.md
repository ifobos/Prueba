#  AppConfiguration

The AppConfiguration folder contains all the required configuration logic that is launched when the application starts, 
configuring keys and parameters of services and dependencies.

The app configuration class uses the `AppConfiguration.plist` file as a file from which you get some settings for the app's configuration.

The reason why not all are saved is because of security reasons since the `*.plist` files are plain text in the installed application package, 
so they could easily be read in case the device has been jailbraked.
