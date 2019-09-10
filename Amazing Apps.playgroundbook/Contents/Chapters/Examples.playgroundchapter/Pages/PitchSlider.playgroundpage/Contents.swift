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
//: ## Creating a Custom Slider with Pitch and Speed
//:
//: This exercise will show you how to create slider that adjusts the speed and pitch of a sound.

        //add button
        var mybutton = appButton()
        //position button on the screen
        mybutton.setPosition(x:140, y:50)
        //resize the button
        mybutton.setSize(width:100, height:100)
        
        //set the button text
        mybutton.addImage(image:"lol.jpg")
        //the background color of the button
        mybutton.setDefaultColor(color : UIColor.blue)
        //the color of the button when pressed
        mybutton.setHighlightColor(color : UIColor.green)
        //play a sound when held down
        mybutton.addAudio(sound: "guitar E4.wav", type:"up")
        
        //add the button to the screen
        view.addSubview(mybutton)
        
        //create slider
        var loopSlider = appSlider()
        //set title
        //loopSlider.setTitle(text: "Loop Slider")
        //set slider size
        loopSlider.setSize(width:300, height:50)
        //set slider size
        loopSlider.setPosition(x: 50, y: 200)
        //attach button to slider
        loopSlider.attachButtonWithLoop(button:mybutton)
        //add slider to subview
        view.addSubview(loopSlider)
        //create label for slider
        let loopLabel = appLabel()
        loopLabel.setPosition(x: loopSlider.xPos+100, y:loopSlider.yPos-30)
        loopLabel.text = "Loop Slider"
        //add label to view
        view.addSubview(loopLabel)
        
        //create slider
        var pitchSlider = appSlider()
        //set slider size
        pitchSlider.setSize(width:300, height:50)
        //set slider size
        pitchSlider.setPosition(x: 50, y: 300)
        //attach button to slider
        pitchSlider.attachButtonWithPitch(button:mybutton)
        //add slider to subview
        view.addSubview(pitchSlider)
        //create label for slider
        let pitchLabel = appLabel()
        pitchLabel.setPosition(x: pitchSlider.xPos+100, y:pitchSlider.yPos-30)
        pitchLabel.text = "Pitch Slider"
        //add label to view
        view.addSubview(pitchLabel)
        
        //create slider
        var speedSlider = appSlider()
        //set slider size
        speedSlider.setSize(width:300, height:50)
        //set slider size
        speedSlider.setPosition(x: 50, y: 400)
        //attach button to slider
        speedSlider.attachButtonWithPitch(button:mybutton)
        //add slider to subview
        view.addSubview(speedSlider)
        //create label for slider
        let speedLabel = appLabel()
        speedLabel.setPosition(x: speedSlider.xPos+100, y:speedSlider.yPos-30)
        speedLabel.text = "Speed Slider"
        //add label to view
        view.addSubview(speedLabel)
//: [Next](@next)
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

