
//: [Previous](@previous)
//: ## Motion Example
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
        var motion = appButton(frame: CGRect(x: 10, y: 50, width: 500, height: 200))
        motion.text(title: "my pitch button")
        motion.setDefaultColor(color: UIColor.blue)
        motion.addAudioTouchDown(sound: "coin.wav")
        
        //motion.addMotionControl(image: "coin.png", sound1:"clap.wav", sound2:"coin.wav", xMov: 0.5, zMov: 1.5)
        //set the button text
        
        let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: "clap", ofType: "wav")!)
        
        //motion.playPitch(url)
        
        //add the button to the screen
        view.addSubview(motion)
        
        
        //#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

