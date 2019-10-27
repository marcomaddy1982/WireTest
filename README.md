# WireTest

WireTest is an iOS application for check the currencies trends respect the EUR.

## Meta

**State:** Version 0.1 alpha
**Point People:** [Marco Maddalena](mailto: marco.maddalena82@gmail.com)

----------

- [Requirements](#requirements)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Running the project](#running-the-project)
- [Run Tests](#run-tests)
- [Development Flow 1](#development-flow-1)
- [Development Flow 2](#development-flow-2)
- [New Ideas](#new-ideas)
- [Development Time](#development-time)

---

## Requirements

- iOS 10.0+ / macOS 10.13+
- Xcode 11.0+
- Swift 5.0

---

## Dependencies

Foundation,
UIKit,
CoreData (See Commented code),
Reusable, 
Networking (written by  Marco Maddalena git => 'https://github.com/marcomaddy1982/Networking.git', :branch => 'Wire'),
Quick,
Nimble

---

## Installation

Open WireTest.xcodeproj. It can immediatelly be run from Xcode, no additional steps are required.

---

## Running the project

To run the app from Xcode, open the workspace file `WireTest.xcodeproj` and run the Scheme `WireTest`. Choose a simulator, and `⌘R`

---

## Running Tests

To run the tests , open the workspace file `WireTest.xcodeproj` and run the Scheme `WireTestTests`. Choose a simulator, and `⌘U`

---

## Development Flow 1

1) Decide the patter -> VIPER + ContentManager + WireFrame. 
The duties of the ContentManager class is to get the date from the service (business logic). It is injected in the Interactor (using Dependency Injection) and it usually implements a protocol with functions using a completion block to propagate the date to the Interactor (i.e func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ())). The reason why I decided to use the ContentManager is because is simple to mock and easier write tests to the Interactor 
The duty of the WireFrame layes is to build the module. (It could also be made directly in the Router).

2) Check the request response and create a model for it.
3) Implement the Currencies Module (ViewController, Interactor, Presenter, Router, WireFrame, ViewModels)
4) Implement the Search Action
5) Implement the model for the Trends Module.
6) Implement the TrendsContentManager using DispatchGroup().
7) Implement the model for the Trends Module (ViewController, Interactor, Presenter, Router, WireFrame, ViewModels)
8) Write Tests for Models and ViewModels
9) Write Tests for Interactor and Presnter (just for the Currencies Module)

---

## Development Flow 2

1) Added Coredata -> Models and CoreDataManager (PersistentStore Type: NSInMemoryStoreType)
2) Implement the Search Action using CoreData
3) Add Loadgin and Error Screen

---

## New Ideas

1) Add pull to refresh (in the case a user leave the app in background for long time). 
2) Implement CoreData using PersistentStore Type: NSSQLiteStoreType for the currencies (How often new currencies are invented? :-)). By the way the user can force the app to get the data from the end point using the pull to refresh 
3) Improve the Design

---

## Development Time
1) Development Flow 1: 5 hours
1) Development Flow 2: 1,5 hours
