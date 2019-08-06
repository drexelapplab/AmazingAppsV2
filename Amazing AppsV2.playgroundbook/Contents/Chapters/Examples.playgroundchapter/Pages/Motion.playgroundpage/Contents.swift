
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
        var motion = appMotion(frame: CGRect(x: 10, y: 50, width: 500, height: 500))
        
        motion.addMotionControl(image: "coin.png", sound1:"clap.wav", sound2:"coin.wav", xMov: 0.5, zMov: 1.5)
        //set the button text
  
        //add the button to the screen
        view.addSubview(motion)
        
        
        //#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

