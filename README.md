# peopart
Sample iOS and watchOS application

![Resulting Application Demonstration](/assets/demo.gif?raw=true "Resulting Application")

## Step 1 - Setup UI Navigation Structure

### Concepts

* Understand Basic Swift Syntax
* Understand Basic Xcode IDE and Project Structure 
* Understand the structure of view controllers and how to display them
  * [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)
  * [UITabBarController](https://developer.apple.com/documentation/uikit/uitabbarcontroller)
  * [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
  * [UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)

### Tasks

* Display a single tab for listing users (no items needed yet)
* Create a class for listing users by subclassing UITableViewController

*Optional*

* Use [extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) to refactor the way our view controllers are displayed

![What the end of step 1 should look like](/assets/step-1.jpg?raw=true "Step 1 Result")

## Step 2 - Parse and Display Data

### Concepts

* Reading a file from the Application [Bundle] using the [Data] type
* [Codable] protocol for easy JSON decoding
* [Delgation] pattern and how it is used with [UITableViewController]
* Basics of [Model-View-Controller] pattern
* Concept of [Optionals] and how to work with them
* How to throw and catch [Errors] in Swift

### Tasks

* Parse bundled json file using [Codable] into a set of [structs]
* Create a custom [UITableViewCell] and understand how to use `@IBOutlet`
* Display the list of users from the JSON file into the `UsersTableViewController`
* Understand the basics of updating the user interface and the `main` thread

![What the end of step 2 should look like](/assets/step-2.jpg?raw=true "Step 2 Result")

## Step 3 - Display More Complex Data

[Delegation] : https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html
