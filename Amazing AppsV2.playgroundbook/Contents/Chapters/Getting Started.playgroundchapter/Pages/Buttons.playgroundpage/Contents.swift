//: [Previous](@previous)
//: ## Creating a Button
//:
//: This exercise will show you how to create a button and attach a sound to that button

//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview

//#-end-hidden-code
        
        //# **Exercise 1
        //: - Run the code and see how the button works.
        //: - Adjust the x/y values to change the button position
        //: - Adjust the width and height
        //: - Run the code to see your changes

        //view object creates a blank screen.
        //change the view color
        view.backgroundColor = UIColor.white
        
        //add a button
        var mybutton = appButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        //set the button text
        mybutton.text(title: "My Amazing Button")
        //the background color of the button
        mybutton.setDefaultColor(color : UIColor.blue)
        //the color of the button when pressed
        mybutton.setHighlightColor(color : UIColor.green)
        //play a sound when held down
        mybutton.addAudioTouchDown(sound: "clap.wav")
        
        //add the button to the screen
        view.addSubview(mybutton)
        
        //:**Exercise 2**
        //:- Using the example above, create a new button object
        //:- Design the button how you want it.
        //:- Make sure to add a touch action
        //:- Look in the Resources folder for more sound files

        //type your new code below
        
    //#-hidden-code
    }
    //#-end-hidden-code
//#-hidden-code
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

