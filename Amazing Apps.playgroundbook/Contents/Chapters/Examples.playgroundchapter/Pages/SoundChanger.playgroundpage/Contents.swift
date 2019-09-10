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
//: ## Sound Changer
//:
//: Provide the slider with a list of sounds. The button will play a different sound based on the slider position.
        //add a button that plays a sound
        var soundButton = appButton()
        soundButton.addImage(image: "cool-emoji.png")
        
        soundButton.addAudio(sound: "cymbal.wav", type: "down")
        //add the button to the screen
        view.addSubview(soundButton)
        
        //create sound list
        var soundList = ["kick1.wav", "coin.wav", "hat2.wav"]
        
        //create slider
        var myslider = appSlider()
        //change position
        myslider.setPosition(x:200, y:300)
        //set slider range
        myslider.setMinMax(min:1, max: Float(soundList.count))
        //attach button to slider
        myslider.attachButtonWithSound(button:soundButton, list: soundList)
        //add slider to subview
        view.addSubview(myslider)
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

