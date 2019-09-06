//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation
class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
//#-end-hidden-code
//: [Previous](@previous)
//: ## Creating a Label
//:
//: This exercise will show you how to create a label and adjust the size, color, and position.
//: **Exercise 1**
//: * Run the code and see how the label works.
//: * Adjust the x/y values to change the label position
//: * Adjust the width and height
//: * **Run** the code to see your changes

        //a view is an object that displays something on the screen
        //this view creates a blank screen that will display our label
        
        //change the background color of the screen
        //use Swift's UIColor function to set the color
        view.backgroundColor = UIColor.white
        
        //create a label object using the appLabel class
        var mylabel = appLabel()
        //add text
        mylabel.text = "My Amazing Sound"
        //change the color
        mylabel.textColor = UIColor.blue
        
        //add the label to the screen
        view.addSubview(mylabel)
        
//: **Exercise 2**
//: * Using the example above, create a new label object
//: * Design your label and run the code when you're ready

        //add your own code below

        
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()

//#-end-hidden-code

