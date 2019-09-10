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
//: ## Touch Pad Example
//:
//: Run the code below to see an example of a touch pad electronic drum kit.

        //add a button
        var drum1 = appButton()
        drum1.setPosition(x: 50, y: 100)
        drum1.setSize(width: 150, height: 150)
        //set the button text
        drum1.addImage(image: "othersnare.png")
        drum1.addAudio(sound: "crash-Cymbal-1.wav", type:"down")
        //add the button to the screen
        view.addSubview(drum1)
        
        //add a button
        var drum2 = appButton()
        drum2.setPosition(x: 250, y: 100)
        drum2.setSize(width: 150, height: 150)
        //set the button text
        drum2.addImage(image: "kick.png")
        drum2.addAudio(sound: "kick1.wav", type:"down")
        //add the button to the screen
        view.addSubview(drum2)
        
        //add a button
        var drum3 = appButton()
        drum3.setPosition(x: 50, y: 300)
        drum3.setSize(width: 150, height: 150)
        //set the button text
        drum3.addImage(image: "cymbal.png")
        drum3.addAudio(sound: "cymbal.wav", type:"down")
        //add the button to the screen
        view.addSubview(drum3)
        
        //add a button
        var drum4 = appButton()
        drum4.setPosition(x: 250, y: 300)
        drum4.setSize(width: 150, height: 150)
        //set the button text
        drum4.addImage(image: "wooddrum.png")
        drum4.addAudio(sound: "electro-Tom.wav", type:"down")
        //add the button to the screen
        view.addSubview(drum4)
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
