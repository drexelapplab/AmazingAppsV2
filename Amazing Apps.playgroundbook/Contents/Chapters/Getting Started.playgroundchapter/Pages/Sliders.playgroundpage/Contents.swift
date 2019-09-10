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
//: ## Creating a Slider
//:
//: This exercise will show you how to create slider that adjusts the speed and pitch of a sound.
//:
//: **Exercise 1**
//: * Run the code and see how the label works.
//: * Adjust the x/y values to change the label position
//: * Adjust the width and height
//: * **Run** the code to see your changes
        //view is the UI (user interface) object that makes the entire screen of your app.
        view.backgroundColor = UIColor.white
        
        //add button
        var mybutton = appButton()
        //set the button text
        mybutton.text(title: "My Amazing Slider!")
        //the background color of the button
        mybutton.setDefaultColor(color : UIColor.blue)
        //play a sound when held down
        mybutton.addAudio(sound: "guitar A4.wav", type:"up")
        //loop sound
        mybutton.loopCount = 4
        //add the button to the screen
        view.addSubview(mybutton)
        
        
        //create slider
        var myslider = appSlider()
        //set slider range
        myslider.setMinMax(min:1, max:10)
        //attach button to slider
        myslider.attachButtonWithLoop(button:mybutton)
        //add slider to subview
        view.addSubview(myslider)

        
//: **Exercise 2**
//: * Using the example above, create a new label object
//: * Design your label how you want it and Run the code
//: * Type your code below:
        
        //Add your code below here

        
        
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
