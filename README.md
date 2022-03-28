# Birthdays

# Install and Run

1. Download the Source Code.
2. Open Birthdays.xcodeproj in XCode Version 13.3 (13E113).
3. Ensure that the following Swift Packages are installed :-
    - [Networking](https://github.com/freshOS/Networking)
4. Build and Run.
    

# Features
- A single UI page that shows a list view of all the people whose birthdays you're keeping track of.
- A page that shows a single person's name, date of birth and current age in years.

## Technical Requirements

- The UI should be a web client or mobile app. The person setting the challenge will specify the expected language/runtime.
- We will provide an API for you to build against, see below.
- It's fine to bring in a UI components library or to use native components. We are looking for good usability, visual hierarchy, focus, and layout, but not a polished design.
- There should be tests for the client, use whatever testing frameworks/libraries you prefer.
- You don't need to provide thorough test coverage, but cover the basics and show what your approach would be.

## Approach

The app is using MVVM (`Model View View-Model`) Architectual Design Pattern as this keeps the UI Layout and Logic that drives the app, seperate.

I built the app using the following third-party libraries

- [Networking](https://github.com/freshOS/Networking) - this is a Swift Package which uses `URLSession`, `Combine`, `Decodable` and `Generics`. Its built using 100% Swift.  It's very lightweight and straightforward to implement as I have used it in other apps before.  It made implementing the API call quick and allowed me to focus on build the logic and the UI Layout elements that the app needs.

## Models

I created the following Models 

Response
```swift
struct Response:  Codable, Hashable {
    
    let results: [Person]
    
    init(
        results: [Person] = []
    ) {
        self.results = results
    }
}
```

Person
```swift
struct Person:  Codable, Hashable {
    
    let name: Name
    let dob: DOB
    
    init(
        name: Name? = nil,
        dob: DOB? = nil
    ) {
        self.name = name ?? Name()
        self.dob = dob ?? DOB()
    }
}
```

Name
```swift
struct Name: Codable, Hashable {
    
    let title: String?
    let first: String?
    let last: String?
    
    init(
        title: String? = nil,
        first: String? = nil,
        last: String? = nil
    ){
        self.title = title ?? ""
        self.first = first ?? ""
        self.last = last ?? ""
    }
}
```
I also added `fullName` variable that combines the `first` and `last` values
```swift
public var fullName: String {
        
    var fullName = ""

    if let first = first {
        fullName += first
    }
    if let last = last {
        fullName += " " + last
    }

    return fullName.trimmingCharacters(in: .whitespacesAndNewlines)
}
``` 
DOB
```swift
struct DOB: Codable, Hashable {
    
    let date: String?
    let age: Int?
    
    
    init(
        date: String? = nil,
        age: Int? = nil
    ){
        self.date = date ?? ""
        self.age = age ?? 0
    }
}
```
I also added `birthday` variable takes the date value and returns the date formatted as `dd-MM-yyy`.
```swift
public var birthday: String {
    guard let date = date else {
        return "n/a"
    }

    guard let date = CommonUtils.dateFormatter.date(from: String(date.prefix(10))) else {
        return "n/a"
    }
    let endResult = CommonUtils.birthdayDateFormatter.string(from: date)

    return endResult
}
```
I also added `yearsOld` variable takes the `age` value and returns a string saying how many years old the person is.
```swift
public var yearsOld: String {
        guard let age = age else {
            return "n/a"
        }
        
        return "\(age) YEARS OLD"
    }
```

# Class
I created a class called `CommonUtils` to handle the date formating
```swift
public class CommonUtils {
    
    public static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    public static let birthdayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()
}
```

# Extensions
I created a extension for String to handle taking in the `fullName` and return the Initals.
```swift
extension String {
    var initials: String {
        return self.components(separatedBy: " ")
            .reduce("") {
                ($0.isEmpty ? "" : "\($0.first?.uppercased() ?? "")") +
                ($1.isEmpty ? "" : "\($1.first?.uppercased() ?? "")")
            }
    }
    
}
```

# ViewModel
I created a View Model called `BirthdayViewModel` which handles the fetch to the API and returns the response.
```swift
class BirthdayViewModel: ObservableObject {
    
    private let api = API()
    @Published var response: Response = Response()
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch(completion: @escaping (Error?) -> ()){
        let promise = api.fetch()
        PromiseHandler<Response>.fulfill(promise, storedIn: &cancellables) { result in
            switch result {
            case .success(let response):
                self.response = response
                completion(nil)
            case .failure(let err):
                completion(err)
            }
        }
    }
   
}
```

# Contact Details
- [Email](davidsirron@gmail.com)
- [Twitter](https://twitter.com/_davidnorris)
- [Twitter - Watchlist+](https://twitter.com/watchlistPlus)
- [Twitter - Nebula](https://twitter.com/getNebulaApp)
- [Linkedin](https://www.linkedin.com/in/davidsirron/)

# Time Spent on Challenge
2hrs 50mins.
