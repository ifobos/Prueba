#  Dependencies

Dependencies are considered all third-party libraries or implementations that make use of a system service.
Each dependency folder has 3 subfolders which are:

-  **Abstraction**:  
which contains the form in which the dependence will be used

-  **Instantiation**: 
that contains the strategy to obtain an instance of the point of entry to the implementation without coupling it, 
this can be a factory or something else. depending on the nature of the dependence

- **Implementation**: The name of this folder depends on what is really being implemented (specific third-party or native library).
This folder contains the code that is coupled to the specific dependency for example a third-party library like Alamofire.


## Project dependencies

The dependencies used in this project are those that are contained in folders next to this file, which are:

- **APIClient**: 
Which is to communicate with the API handling features such as the retry and the authentication of the request in the request header. 
The entry point to use this dependency is the RequesterProtocol.
To obtain an intance of this make use of the RequesterFactory.
The specific implementation of this dependency uses Alamofire.

- **SecureStorage**: 
Which is for the secure storage of string, used for the persistence of authentication tokens.
The entry point to use this dependency is the SecureStringStorageProtocol.
To obtain an intance of this make use of the SecureStringStorageFactory.
The specific implementation of this dependency uses KeychainAccess.


- **DefaultsStorage**:
Which is used to store variables of the installation, such as a flag indicating that the app was executed previously.
The entry point to use this dependency is the DefaultsStorageProtocol.
To obtain an intance of this make use of the DefaultsStorageInstance.
The specific implementation of this dependency is UserDefaults.

- **Location**:
Used to obtain the geographical location of the device.
The entry point to use this dependency is the LocalizatorProtocol
To obtain an intance of this make use of the LocalizatorFactory
The specific implementation of this dependency uses CoreLocation

- **Maps**:
Used to present the map view
The entry point to use this dependency is the MapViewConfiguratorProtocol
To obtain an intance of this make use of the MapViewConfiguratorFactory
The specific implementation of this dependency uses GoogleMaps
