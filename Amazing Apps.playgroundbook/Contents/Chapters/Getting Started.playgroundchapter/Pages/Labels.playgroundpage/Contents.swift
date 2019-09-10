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
        view.backgroundColor = UIColor.white
        
        //create a label object using the appLabel class
        var mylabel = appLabel()
        //change position on the screen using x/y parameters
        mylabel.setPosition(x:200, y:200)
        //change the size of the label using width and height
        mylabel.setSize(width:200, height:60)
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

        
        
//: [Next](@next)
        //#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
