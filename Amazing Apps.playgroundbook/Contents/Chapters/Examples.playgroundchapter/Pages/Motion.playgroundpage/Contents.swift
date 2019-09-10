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
//: Run the code below to see an example of a motion controlled button.

        //add a button
        var motion = appButton()
        motion.addImage(image: "coin.png")
        motion.addAudio(sound: "coin.wav", type: "motion")
        //set the button text
  
        //add the button to the screen
        view.addSubview(motion)
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

