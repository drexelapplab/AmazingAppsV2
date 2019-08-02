//: [Previous](@previous)
//: ## Advanced Buttonl Functions
//:
//: This exercise will show you how to add images and loops to your button
//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation
//-end-hidden-code
class ViewController: UIViewController {
    //:-hidden-code
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        
    //#-end-hidden-code
        
        //: **Exercise 1
        //:* Run the code and see how the button works.
        //:* Look in the Resources folder for more images and sounds
        //:* Change the image on the button
        //:* Adjust the loop to play the sound more or less times
        //:* Change the touch action to addAudioTouchDown
        //:* Run the code to see your changes

        //view object creates a blank screen.
        //change the view color
        view.backgroundColor = UIColor.white
        
        //add a button
        var mybutton = appButton(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        //attach an image to the button
        mybutton.addImage(image: "cymbal.png")
        //use the toggle function to play the whole sound
        mybutton.addAudioToggle(sound: "clap.wav")
        //add a loop to the audio
        mybutton.setLoopCount(count: 6)
        
        //add the button to the screen
        view.addSubview(mybutton)
        
        //: **Exercise 2**
        //:* Using the example above, create a new button object
        //:* Design the button how you want it.
        //:* Add a touch action, image and loop
        //:* Look in the Resources folder for more sound files

        //type your new code below
        
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

