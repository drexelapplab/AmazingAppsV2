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
        motionButton.addAudio(sound: "guitar E4.wav", touch:"down")
        motionButton.addImage(image:"coin.png")
        motionButton.setPosition(x:100, y:200)
        motionButton.addMotion()
        
        //add the button to the screen
        view.addSubview(motionButton)
        
        //add label for tracking
        let mlabel = appLabel()
        mlabel.text = motionButton.statusMsg
        view.addSubview(mlabel)
        
        
        //#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

