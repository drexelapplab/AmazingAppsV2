//: [Previous](@previous)
//: ## Creating a Label
//:
//: This exercise will show you how to create a label and adjust the size, color, and position.
//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation
class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
//#-end-hidden-code        
//: **Exercise 1**
//: * Run the code and see how the label works.
//: * Adjust the x/y values to change the label position
//: * Adjust the width and height
//: * **Run** the code to see your changes

        //view object is the UI (user interface) object.
        //the view creates a blank screen for you
        view.backgroundColor = UIColor.white
        
        //create a label object
        var mylabel = appLabel(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        //add text
        mylabel.text = "Amazing Sound"
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

