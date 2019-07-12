//: [Previous](@previous)
//:
//: ## Graphic Button
//:
//: Let's take some time to make our button look nice. This exercise will teach you how to add an graphic to the page and use it as a button.
//#-hidden-code
import PlaygroundSupport
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    //create audio player object
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        view.backgroundColor = UIColor.white
        //#-end-hidden-code
//: **Exercise 1**
//: * Run the code and see how the button works.
//: * Look through the [Resources](Resources) and change the sound below to something different.
//: * **Run** the code again to hear the new sound

    //create a constant named clap that points to the clap.wav sound file
    let sound = Bundle.main.path(forResource: /*#-editable-code*/"clap"/*#-end-editable-code*/, ofType: /*#-editable-code*/"wav"/*#-end-editable-code*/)!

    //assign sound to a url path
    let url = URL(fileURLWithPath: sound)
    //assign sound to audioplayer
    do {audioPlayer =  try AVAudioPlayer(contentsOf: url)} catch{}
        
//:
//: **Exercise 2**
//: * **Run** the code and see how the image displays in the app.
//: * Change the image to one of your choice. Use the [Resources](Resources) page to find an image you like. Update the code with your new image and run the app.

//: This code creates a button object and assigns it an image *(setImage)* and a tap event *(touchUpInside)*
        
        //create button object
        var mybutton : UIButton!
        
        //assign an image file
        mybutton.setImage(UIImage(named: "cymbal.PNG"), for: .normal)
        
        //add tap event
        mybutton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        //: Just like our button, we need to tell the image where to display and what the shape is.
        
        //assign location and size of button
        mybutton = UIButton(frame: CGRect(x: /*#-editable-code*/100/*#-end-editable-code*/, y: /*#-editable-code*/100/*#-end-editable-code*/, width: /*#-editable-code*/50/*#-end-editable-code*/, height: /*#-editable-code*/50/*#-end-editable-code*/))
    
//: REMEMBER - We need to let the app *View* know about our button and image.
        
        //adding the button to the app screen *(View)*
        appview.addSubview(mybutton)
        
//: [Next](Example%20Code) - Example Code
        
        //#-hidden-code
        
    }
        @objc func tapButton() {
            audioPlayer.play()
    }
}

PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()

//#-end-hidden-code
