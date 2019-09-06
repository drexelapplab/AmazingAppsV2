import UIKit

//: [Previous](@previous)
//:
//: ## Introduction to Functions and Objects
//:
//: A **function** is a series of code that can be used to repeat an action or process information. For instance, using the volume example.  We could write a function that checks the volume. Functions also use the parantheisis *()* and curly brackets *{}* as part of their syntax.  You also have to declare it as a function using the term *func* (for Swift).
//:
//:  **Example:**
//set volume parameters
let volumeLimit = 100
var myVolume = 110

//check volume function - this is a typical Swift function
func checkVolume()->String {
    //set initial message
    var message = "Music volume is fine."
    //check to see if the volume is too high
    if (myVolume > volumeLimit) {
        message = "Turn your music down!"
    }
    else {
        message = "Thank you for being quiet."
    }
    //return the message
    return message
}// end function

//run the check volume function to print the message
print(checkVolume())
//checkVolume:  Turn your music down!

//:
//: An **object** is a piece of data created from a template (or class). Classes use variables that define the object such as color, size, or a title.  Classes also contain functions that provide the object abilities such as play music, change the color, and more.  Take a look at the *appButton* class example below.  We will be using the appButton class later on in this Playground Book.
//:
//: **Example:**

//declare the class and copy the Swift UIButton class
//copying a class allows us to use all of functions of that class and add custom variables and functions
class appButton: UIButton {
    
    var highlightColor = UIColor.cyan
    var defaultColor = UIColor.blue
    
    //change the default color
    func setDefaultColor(color: UIColor) {
        defaultColor = color
    }
    
    //change the button title
    func text(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}//close the appButton class

//:
//: [Next](@next)

