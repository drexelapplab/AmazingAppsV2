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
//: ## Creating a Button
//:
//: This exercise will show you how to create a button and attach a sound to that button
//:
//: **Exercise 1**
//: * Run the code and see how the button works.
//: * Adjust the x/y values to change the button position
//: * Adjust the width and height
//: * Run the code to see your changes

        //the view object creates a blank screen
        //set the view/screen color
        view.backgroundColor = UIColor.white
        
        //create a button object from the button class
        var mybutton = appButton()
        //set the button text
        mybutton.text(title: "My Amazing Button")
        //the background color of the button
        mybutton.setDefaultColor(color : UIColor.blue)
        //play a sound when held down
        mybutton.addAudio(sound: "clap.wav", type: "up")
        
        //use the setPosition and setWidth functions to change the size and location of the button
        
        //add the button to the view so it displays on the screen
        view.addSubview(mybutton)
 
//: **Exercise 2**
//: * Using the example above, create a new button object
//: * Design the button how you want it.
//: * Make sure to add a touch action
//: * Look in the Resources folder for more sound files

        //type your new code below

        
        
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
