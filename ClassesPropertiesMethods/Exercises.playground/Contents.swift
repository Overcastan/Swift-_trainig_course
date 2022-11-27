//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    init(species: String, t_length: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: t_length)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
var cat = Animal(species: "cat", t_length: 20)
var owl = Animal(species: "owl", t_length: 10)
//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    static let varieties = ["A", "B", "C"]
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    func ripen() -> String {
        self.softness += 1
        if softness >= 5 {
            return "ripe"
        } else {
            return "not ripe"
        }
    }
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
}
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
let peach = Peach(variety: "A", softness: 4)
peach.ripen()
//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
//var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    var cuddlability: Int {
        get {
            return fluffiness * droolFactor
        }
    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(_ wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
let fluffy_dog = FluffyDog(name: "dog", fluffiness: 10, droolFactor: 5)
fluffy_dog.chase("bicycle")
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case small
    case medium
    case large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    func bark() {
        switch size {
        case Size.small:
            print("uif uif!")
        case Size.medium:
            print("bark bark")
        case Size.large:
            print("bow wow wow")
        }
    }
    
    static func speak(size: Size) {
        switch size {
        case Size.small:
            print("Yes, I'm an ugly dumb loud... creature, so what?")
        case Size.medium:
            print("I'm a normal dog, u now")
        case Size.large:
            print("Do you want to bite your ass?")
        }
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
let another_dog = ChattyDog(name: "dog", breed: "the nemetskaya ovcharka", size: Size.large)
another_dog.bark()
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
ChattyDog.speak(size: Size.small)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case poor, fair, good, excellent
}

enum NaturalDisaster {
    case earthquake
    case wildfire
    case hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    
    var worthyOfAnOffer: Bool {
        get {
            switch location {
            case .excellent:
                return true
            case .good:
                if numberOfBedrooms > 0 {
                    return true
                } else {
                    return false
                }
            case .fair:
                if numberOfBedrooms > 1 {
                    return true
                } else {
                    return false
                }
            case .poor:
                return false
            }
        }
    }
    
    init (numberOfBedrooms: Int, location: Quality) {
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
 
    func willStayStanding(_ naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .earthquake:
            return true
        case .wildfire:
            return true
        case .hurricane:
            return false
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
let house = House(numberOfBedrooms: 1, location: Quality.good)
house.willStayStanding(NaturalDisaster.earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.
