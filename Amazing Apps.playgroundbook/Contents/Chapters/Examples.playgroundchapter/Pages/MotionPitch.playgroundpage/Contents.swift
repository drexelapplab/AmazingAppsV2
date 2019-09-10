//#-hidden-code
import PlaygroundSupport
import UIKit
import AVFoundation
class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        view.backgroundColor = UIColor.white
//#-end-hidden-code
//: [Previous](@previous)
//: ## Motion Example
//:
//: Run the code below to see an example of a touch pad of a motion controlled app.
        
        //add a button
        let motionButton = appButton()
        motionButton.loopCount = 5
        motionButton.addAudio(sound: "guitar E4.wav", type:"pitch")
        motionButton.addImage(image:"acoustic-guitar.jpg")
        motionButton.setPosition(x:100, y:200)
        motionButton.setSize(width:500, height:300)
        
        //add the button to the screen
        view.addSubview(motionButton)
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

