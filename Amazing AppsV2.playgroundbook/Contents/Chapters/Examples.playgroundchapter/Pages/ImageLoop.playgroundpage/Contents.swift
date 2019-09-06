

//: [Previous](@previous)
//: ## Image Loop Example
//:
//: Run the code below to see an example of a touch pad of a motion controlled app.

//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        //#-end-hidden-code
        view.backgroundColor = UIColor.white
        
        //add a button
        var myImageButton = appButton(frame: CGRect(x: 10, y: 50, width: 100, height: 100))
        
        myImageButton.addAudioTouchDown(sound: "coin.wav")
        myImageButton.addImage(image: "coin.png")

        var soundlist = ["coin.wav", "kick.wav", "snare.wave"]
        
        for sound in soundlist {
            var newX = 20
            var newbutton = appButton(frame: CGRect(x: newX, y:50, width: 100, height: 100))
            newbutton.addAudioTouchDown(sound: sound)
            
            view.addSubview(newbutton)
            
        }

        
        //add the button to the screen
        view.addSubview(myImageButton)
    }

}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()


