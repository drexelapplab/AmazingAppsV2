//: [Previous](@previous)
//: ## Touch Pad Example
//:
//: Run the code below to see an example of a touch pad electronic drum kit.

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
        var drum1 = appButton(frame: CGRect(x: 50, y: 100, width: 150, height: 150))
        //set the button text
        drum1.addImage(image: "othersnare.png")
        drum1.addAudioTouchDown(sound: "snare.wav")
        //add the button to the screen
        view.addSubview(drum1)
        
        //add a button
        var drum2 = appButton(frame: CGRect(x: 250, y: 100, width: 150, height: 150))
        //set the button text
        drum2.addImage(image: "kick.png")
        drum2.addAudioTouchDown(sound: "kick1.wav")
        //add the button to the screen
        view.addSubview(drum2)
        
        //add a button
        var drum3 = appButton(frame: CGRect(x: 50, y: 300, width: 150, height: 150))
        //set the button text
        drum3.addImage(image: "cymbal.png")
        drum3.addAudioTouchDown(sound: "snare3.wav")
        //add the button to the screen
        view.addSubview(drum3)
        
        //add a button
        var drum4 = appButton(frame: CGRect(x: 250, y: 300, width: 150, height: 150))
        //set the button text
        drum4.addImage(image: "wooddrum.png")
        drum4.addAudioTouchDown(sound: "nia_Bass_Bb.wav")
        //add the button to the screen
        view.addSubview(drum4)

        
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

