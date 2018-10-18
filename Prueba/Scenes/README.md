#  Scenes

The folder Scenes contains multiple folders each of being folders groups the code related to each scene (or screen) within the storyboard

This code within each scene is grouped by responsibility in different classes , which are being tools of a single responsibility,
each scene occupies different responsibilities so there is no fixed set of responsibilities per scene.

Some of the most common single responsibility tools are:

- **Store**: 
In charge of retaining in memory the data used in the screen and that are used by other classes within the same scene

- **DataSource**:
In charge of implementing a DataSource protocol of a TableView, CollectionView or other.

- **Delegate**:
In charge of implementing a Delegate protocol of a TableView, CollectionView or other.

- **Fetcher**:
In charge of getting service data from classes outside the scene handling asynchronous processes if necessary

- **Loader**:
Responsible for taking the store's data to the appropriate views

- **Actioner**:
Responsible for reacting to user interactions with different control views.
