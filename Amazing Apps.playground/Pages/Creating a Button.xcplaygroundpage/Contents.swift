//: [Previous](@previous)
//:
//: ## Creating a Button
//:
//: Lets use the same concepts we learned with our label **(UILabel)** and apply it to a button **(ClickableUIView)**.
//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation

class ViewController: UIViewController {
    //create audio player object
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        view.backgroundColor = UIColor.white
        //#-end-hidden-code
//: Just like a label, we need to tell the app the location and size of our button using the X, Y, width, and height parameters.
//:
//: **Exercise 1**
//:  * Adjust the parameters below and **Run** the code to see how the button appears on the screen.
        
    //create a variable called mybutton and make it a square Clickable object
    var mybutton = UIButton(frame: CGRect(x: /*#-editable-code*/100/*#-end-editable-code*/, y: /*#-editable-code*/100/*#-end-editable-code*/, width: /*#-editable-code*/50/*#-end-editable-code*/, height: /*#-editable-code*/50/*#-end-editable-code*/))

//:  * Set the button's background color so that we can see it on the screen. Use basic color names like you did with the label text.
        
    // set the backgroundColor property
    mybutton.backgroundColor = /*#-editable-code*/UIColor.blue/*#-end-editable-code*/
        
//: Since we're making a music app, let's add a sound to our button.
//: This Playground book contains several sample sounds.  You can find them on the [Resources](Resources) page.
//:
//: To play a sound we need to create a variable that points to our sound file. Just like a website, Swift uses terms like URL *(Bundle.main.url)* to search for files or pages within the application.
//:
//: **Exercise 2**
//:
//: * Run the code and see how the button works.
//: * Look through the [Resources](Resources) and change the sound below to something different.
//: * Run the code again to hear the new sound
        
    //create a constant named clap that points to the clap.wav sound file
        let sound = Bundle.main.path(forResource: /*#-editable-code*/"clap"/*#-end-editable-code*/, ofType: /*#-editable-code*/"wav"/*#-end-editable-code*/)
        
        //assign sound to a url path
        let url = URL(fileURLWithPath: sound!)
        
        //assign sound to audioplayer
        do {audioPlayer =  try AVAudioPlayer(contentsOf: url)} catch{}
        
//: We've now created the button and found the sound file.  But how does the button know to play the sound when clicked?
//:
//: The code below adds a touch event to the putton and calls a "tapButton" function that plays the sound
    
    //assign tap event to button
    mybutton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

//: REMEMBER - We need to let the app screen know about our button.
    
    //adding the button to the app screen *(View)*
    appview.addSubview(mybutton)
        

//: [Next](Graphic%20Button) Creating a Graphic Button
        
//#-hidden-code
        
    }
//#-end-hidden-code
    
    //function to play the audioPlayer
    @objc func tapButton() {
        audioPlayer.play()
    }
    
//#-hidden-code
}

PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()

//#-end-hidden-code
