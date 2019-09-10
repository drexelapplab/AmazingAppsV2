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
//: ## Advanced Button Functions
//:
//: This exercise will show you how to add images and loops to your button
//:
//: **Exercise 1**
//: * Run the code and see how the button works.
//: * Look in the Private Resources folder for more images and sounds
//:     * Click on the "..." at the top of the page.
//:     * Click "Advanced"
//:     * Click "View Auxiliary Source Files
//:     * Click Contents->PrivateResources"
//: * Change the image on the button
//: * Adjust the loop to play the sound more or less times
//: * Change the addAudio type to "up" and see the difference
//: * Run the code to see your changes

        //view object creates a blank screen.
        //change the view color
        view.backgroundColor = UIColor.white
        
        //add a button
        var mybutton = appButton()
        //attach an image to the button
        mybutton.addImage(image: "cymbal.png")
        //use the toggle function to play the whole sound
        mybutton.addAudio(sound: "cymbal.wav",type: "down")
        //add a loop to the audio
        mybutton.loopCount = 6
        
        //add the button to the screen
        view.addSubview(mybutton)
        
//: **Exercise 2**
//: * Using the example above, create a new button object
//: * Design the button how you want it.
//: * Add a touch action, image and loop
//: * Look in the Resources folder for more sound files

        //type your new code below

        
        
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
