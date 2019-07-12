//: [Previous](@previous)
//:
//: ## Example Code
//:
//: Below you're find the raw code for all of the previous activities.  Copy, modify and adjust the code as necessary to create your own app!

//: Below is the core code necessary to implement our application *(this was hidden in our previous examples)*.
//import the necessary code libraries to support the app
import PlaygroundSupport
import UIKit
import AVFoundation

//create the main *View* for the app
class ViewController: UIViewController {
    //create audio player object
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        //create a constant that represents our main app *View*
        let appview = UIView()
        //tell the system what our main view is
        self.view = appview
        
//: Want to change the backgroun color?  Adjust the code below to a color of your preference.
        
        //set the background color of the screen
        view.backgroundColor = UIColor.white

//: Creating a Label
        // create a variable called "mylabel" that is a square container
        let mylabel = UILabel (frame: CGRect(x: 100, y: 100, width: 50, height: 50))

        //adding a text property to the label
        mylabel.text = "ExCITe Center - Music Technology"

        //set the color of your text
        mylabel.textColor = UIColor.blue

        // tell the App to display the label
        appview.addSubview(mylabel)

//: Creating a Button

        //create a clickable view
        let mybutton = UIButton (frame: CGRect(x: 150, y: 120, width: 50, height: 50))
        
        // set the backgroundColor property
        mybutton.backgroundColor = UIColor.blue
        
        //assign tap event to button
        mybutton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        //assign sound
        let sound = Bundle.main.path(forResource: "clap", ofType: "wav")
        
        //assign sound to a url path
        let url = URL(fileURLWithPath: sound!)
        
        //assign sound to audioplayer
        do {audioPlayer =  try AVAudioPlayer(contentsOf: url)} catch{}

        //adding the button to the app screen *(View)*
        appview.addSubview(mybutton)

//: Creating an Image

        //create a clickable view
        let myimage = UIButton (frame: CGRect(x: 300, y: 300, width: 50, height: 50))
        
        // set the backgroundColor property
        myimage.backgroundColor = UIColor.blue
        
        //assign an image file
        myimage.setImage(UIImage(named: "cymbal.PNG"), for: .normal)
        
        //assign tap event to button
        myimage.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        //assign sound
        let sound2 = Bundle.main.path(forResource: "clap", ofType: "wav")
        
        //assign sound to a url path
        let url2 = URL(fileURLWithPath: sound2!)
        
        //assign sound to audioplayer
        do {audioPlayer =  try AVAudioPlayer(contentsOf: url2)} catch{}
        
        //adding the button to the app screen *(View)*
        appview.addSubview(myimage)
        //closing brackets to complete the *ViewController* and the *viewDidLoad* function
    }
    
    //function to play the audioPlayer
    @objc func tapButton() {
        audioPlayer.play()
    }
}
 //#-hidden-code

//: [Next](Your%20Music%20App) - Your Music App

PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code

