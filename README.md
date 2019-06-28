# peopart
Sample iOS and watchOS application

![Resulting Application Demonstration](/assets/demo.gif?raw=true "Resulting Application")

## Step 1 - Setup UI Navigation Structure

To begin working on this step: 

```bash
git checkout master
```

### Concepts

* Understand Basic Swift Syntax
* Understand Basic Xcode IDE and Project Structure 
* Understand the structure of view controllers and how to display them
  * [UIAppDelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)
    * **Description**
      * Handles the various states and outside entry points into the application  
    * **Properties and Methods**
      * [application(_:willFinishLaunchingWithOptions:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623032-application) 
        Setup the `UIWindow` for the `main` `UIScreen` with the root `UIViewController` 
  * [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
    * **Description**
      * Backdrop of the UI 
    * **Properties and Methods**
      * [init(frame:)](https://developer.apple.com/documentation/uikit/uiwindow)
        Setup a new `UIWindow` based on the `UIScreen`
      * [rootViewController](https://developer.apple.com/documentation/uikit/uiwindow/1621581-rootviewcontroller)
        The root `UIViewController` 
      * [makeKeyAndVisible()](https://developer.apple.com/documentation/uikit/uiwindow/1621601-makekeyandvisible)
        Make the `UIWindow` key and visible
  * [UIScreen](https://developer.apple.com/documentation/uikit/uiscreen)
    * **Description**
      * Properties associated with a hardware-display
    * **Properties and Methods**
      * [main](https://developer.apple.com/documentation/uikit/uiscreen/1617815-main)
        the main screen of the device
  * [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)
    * **Description**
      * Base View Controller 
  * [UITabBarController](https://developer.apple.com/documentation/uikit/uitabbarcontroller)
    * **Description**
      * `UIViewController` which contains a series of bottom tabs
    * **Properties and Methods**
      * [setViewControllers(, animated: Bool)](https://developer.apple.com/documentation/uikit/uitabbarcontroller/1621177-setviewcontrollers)
        Set the `UIViewController` for each tab
  * [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
    * **Description**
      * `UIViewController` for allowing tree-like navigation
    * **Properties and Methods**
      * [init(rootViewController:)](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621858-init)
        Creates and new `UINavigationController` with a the designated `rootViewController`
  * [UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)

### Tasks

* Create a class for listing users by subclassing UITableViewController
  * _Hints_ 
    * create a new _Cocoa Touch Class_ subclass of `UITableViewController` called `UsersTableViewController`
    
* Display a single tab for listing users (no items needed yet)
  * _Hints_ * in `application(_:willFinishLaunchingWithOptions:)`... create a `UIWindow` with the size of the `main` `UIScreen`   
    * ... create a `UINavigationController` with a `rootViewController` of `UsersTableViewController`
    * ... create a `UITabBarController` with our new `UINavigationController`
    * ... set the `rootViewController` of the new `UIWindow` to our new `UITabBarController`
    * ... make the new `UIWindow` key and visible
    * ... set the `window` property to the newly created `UIWindow`
    * ... return `true`
    

*Optional*

* Use [extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) to refactor the way our view controllers are displayed

![What the end of step 1 should look like](/assets/step-1.jpg?raw=true "Step 1 Result")

## Step 2 - Parse and Display Data

To skip ahead and begin working on this step: 

```bash
git checkout feature/step-1
```

### Concepts

* Reading a file from the Application [Bundle] using the [Data] type
* [Codable] protocol for easy JSON decoding
* [Delegation] pattern and how it is used with [UITableViewController]
  * [UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)
    * **Description**
      * a `UIViewController` which encapsulates a `UITableView`, `UITableViewDataSource`, `UITableViewDelegate`
    * **Properties and Methods**
      * [tableView](https://developer.apple.com/documentation/uikit/uitableviewcontroller/1614753-tableview)
        * the `UITableView` managed by the `UITableViewController`
  * [UITableView]
    * **Description**
      * a `UIView` for representing rows of data
    * **Properties and Methods** 
    * [register(_ nib: UINib?, 
    forCellReuseIdentifier identifier: String)](https://developer.apple.com/documentation/uikit/uitableview/1614937-register)
        * registers a `UINib` of the cell to be used throughout the `UITableView`
    * [reloadData()](https://developer.apple.com/documentation/uikit/uitableview/1614862-reloaddata)
        * basic method for reloading `UITableView` rows 
        * _Note_ there are preffered methods of doing this such as reloadRows or [performBatchUpdates](https://developer.apple.com/documentation/uikit/uitableview/2887515-performbatchupdates)
    * [dataSource]
        * property which defines the `UITableViewDataSource` of the `UITableView`
  * [UITableViewDataSource]
    * **Description**
      * a protocol which returns the data and cells for a `UITableView`
    * **Properties and Methods** 
      * [numberOfSections(in:)](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614860-numberofsections)
        * defines the number of sections in the `UITableView`
      * [tableView(_:numberOfRowsInSection:)](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614931-tableview)
        * defines the number of rows in a particular section for the `UITableView`
      * [tableView(_:cellForRowAt:)](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614861-tableview)
        * returns the `UITableViewCell` for the particular row and section of the `UITableView`
* Basics of [Model-View-Controller] pattern
* Concept of [Optionals] and [Optional Chaining] and how to work with them
* How to throw and catch [Errors] in Swift

### Tasks

* Parse bundled json file using [Codable] into a set of [structs]
* Create and register a custom [UITableViewCell] and understand how to use [IBOutlet]
* Display the list of users from the JSON file into the `UsersTableViewController`
* Understand the basics of updating the user interface and the `main` thread

![What the end of step 2 should look like](/assets/step-2.jpg?raw=true "Step 2 Result")

## Step 3 - Display More Complex Data

To skip ahead and begin working on this step: 

```bash
git checkout feature/step-2
```

### Concepts

* [JSONDecoder.dateDecodingStrategy]
* Protocol-Oriented Programming
* Functional Programming (map, reduce, sorting, max, etc...)
* Application Transport Security
  ```xml
  <key>NSAppTransportSecurity</key>
  <dict>
  <key>NSExceptionDomains</key>
  <dict>
  <key>lorempixel.com</key>
  <dict>
  <key>NSExceptionAllowsInsecureHTTPLoads</key>
  <true/>
  <key>NSIncludesSubdomains</key>
  <true/>
  </dict>
  </dict>
  </dict>
### Tasks

* Setup Posts and Comments
* Dealing with Dates and Codable
* Basic Functional Programming
* Setup Application Transport Security

## Step 4 - Apple Watch App Setup

```bash
git checkout feature/step-3
```

### Tasks

* Using a Storyboards to customize the UI of the main [WKInterfaceController]
* Setup a menu for displaying users and posts
* Dynamically display a different sets of data into a [WKInterfaceTable]
* Push and pass context to a new [WKInterfaceController]


[Delegation]: https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html
[UITableViewController]: https://developer.apple.com/documentation/uikit/uitableviewcontroller
[Bundle]: https://developer.apple.com/documentation/foundation/bundle
[Data]: https://developer.apple.com/documentation/foundation/data
[Codable]: https://developer.apple.com/documentation/swift/codable
[Model-View-Controller]: https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html
[Optional Chaining]: https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html
[Optionals]: https://developer.apple.com/documentation/swift/optional
[Errors]: https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
[sturcts]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
[UITableViewCell]: https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table
[IBOutlet]: https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Outlets/Outlets.html
[JSONDecoder.dateDecodingStrategy]: https://developer.apple.com/documentation/foundation/jsondecoder/2895216-datedecodingstrategy
[WKInterfaceTable]: https://developer.apple.com/documentation/watchkit/wkinterfacetable
[Protocol-Oriented Programming]: https://developer.apple.com/videos/play/wwdc2015/408/
[WKInterfaceController]: https://developer.apple.com/documentation/watchkit/wkinterfacecontroller
[UITableView]: https://developer.apple.com/documentation/uikit/uitableview
[UITableViewDataSource]: https://developer.apple.com/documentation/uikit/uitableviewdatasource
