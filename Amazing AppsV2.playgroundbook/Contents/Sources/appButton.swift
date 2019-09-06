import CoreMotion
import Foundation
import UIKit
import AVFoundation

public class appButton: UIButton {
    
    public var statusMsg = ""
    var highlightColor = UIColor.cyan
    var defaultColor = UIColor.blue
    //used for setting the frame
    public var width = 200
    public var height = 200
    public var xPos = 100
    public var yPos = 100
    public var loopCount = 0 //default the loop to 0
    var touch = "down" //default button types to .TouchDown
    var motion = CMMotionManager() //used for motion pitch feature
    public var player = AVAudioPlayer()
    let engine = AVAudioEngine()
    //let speedControl = AVAudioUnitTimePitch()
    let pitchControl = AVAudioUnitTimePitch()
    let audioPlayer = AVAudioPlayerNode()
    var audioFile = AVAudioFile()
    public var pitch = Float(0.00)
    public var speed = Float(1.00)
    var timer: Timer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFrame()
    }
    
    init(frame: CGRect, defaultColor: UIColor, highlightColor: UIColor, type: UIButton.ButtonType) {
        super.init(frame: frame)
        self.defaultColor = defaultColor
        self.highlightColor = highlightColor
        self.backgroundColor = defaultColor
        setupFrame()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //set default shape of button
    private func setupFrame() {
        frame = CGRect(x:xPos, y:yPos, width:width, height:height)
    }
    
    public func setPosition(x: Int, y: Int){
        self.xPos = x
        self.yPos = y
        //reset frame
        setupFrame()
    }
    
    public func setSize(width: Int, height: Int){
        self.width = width
        self.height = height
        //reset frame
        setupFrame()
    }
    
    public func setHighlightColor(color: UIColor) {
        self.highlightColor = color
    }
    
    public func setDefaultColor(color: UIColor) {
        self.defaultColor = color
        self.backgroundColor = color
    }
    
    public func setAudioPitch(pitch: Float){
        self.pitch = pitch
        pitchControl.pitch = pitch
    }
    public func setAudioSpeed(speed: Float){
        self.speed = speed
        pitchControl.rate = speed
    }
    
    public func setupAudioPlayer(path: Foundation.URL) {
        
        do {
            player = try AVAudioPlayer(contentsOf: path)
        }catch {
            print("Something went wrong with the audio player")
        }
        
    }
    
    public func text(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    public func textColor(color: UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    //PLAY A SOUND WHEN BUTTON IS TAPPED
    public func addAudio(sound: String, touch: String) {
        //set button type
        self.touch = touch
        
        //get substrings of sound name and file type
        let soundType = String(sound.suffix(3))
        let soundName = String(sound.dropLast(4))
        
        //create path to sound file
        let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: soundType)!)
        
        //create audio file object
        self.audioFile = AVAudioFile()
        do {audioFile = try AVAudioFile(forReading: url as URL)
        } catch {
            print("file not set")
        }
        //connect audio engine to play, pitch, and speed controllers
        engine.attach(audioPlayer)
        engine.attach(pitchControl)
        //engine.attach(speedControl)
        
        //connect to play, pitch and speed controllers
        engine.connect(audioPlayer, to: pitchControl, format: nil)
        //engine.connect(speedControl, to: pitchControl, format: nil)
        engine.connect(pitchControl, to: engine.mainMixerNode, format: nil)
        
        //load audio file to player
        audioPlayer.scheduleFile(audioFile, at: nil)
        
        //try and start the audio engine
        do {try engine.start()
        } catch {
            print("engine not started!")
        }
        
        //call the proper touch event (touching down or on release)
        if(touch == "up"){
            self.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        } else {
            self.addTarget(self, action: #selector(tapButton), for: .touchDown)
        }
    }
    
    //REPLACE BUTTON WITH AN IMAGE
    public func addImage(image: String) {
        //get substrings of sound name and file type
        let imageType = image.suffix(3)
        let imageName = image.dropLast(4)
        
        //load image
        self.setImage(UIImage(named: image), for: .normal)
        //clear any assigned colors
        self.setDefaultColor(color: UIColor.clear)
        self.setHighlightColor(color: UIColor.clear)
    }
    
    //MOTION PITCH FUNCTION
    public func addMotion() {
        let xMov = 50.00
        let yMov = 50.00
        let zMov = 50.00
        self.statusMsg = "Motion axis set!"
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0 //60 Hz
            self.motion.startAccelerometerUpdates()
            self.statusMsg = "Motion started!"
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                self.statusMsg = "Timer started!"
                                if let data = self.motion.accelerometerData {
                                    let x = data.acceleration.x
                                    let y = data.acceleration.y
                                    let z = data.acceleration.z
                                    
                                    // Use the accelerometer data in your app.
                                    //if z > 0.5 {
                                    if z > zMov {
                                        self.statusMsg = "Z motion!"
                                        self.audioPlayer.play()
                                        
                                    }
                                    //if x > 0.5 {
                                    if x > xMov {
                                        self.statusMsg = "X motion!"
                                        self.audioPlayer.play()
                                    }
                                }
                                else {
                                    self.statusMsg = "No motion tracked!"
                                }
            })
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
    
    //TOUCH EVENT FUNCTIONS
    @objc func tapButton() {
        
        //if sound is playing stop and reload the file
        if(audioPlayer.isPlaying){
            audioPlayer.stop()
            audioPlayer.scheduleFile(audioFile, at: nil)
        }
        //set the pitch and speed
        pitchControl.pitch = self.pitch
        pitchControl.rate = self.speed
        
        //check for loops
        if loopCount > 1 {
            //play the full sound for each loop
            for n in 1...loopCount-1 {
                audioPlayer.scheduleFile(audioFile, at: nil)
                audioPlayer.play()
                print("looping..." + String(n))
            }
        }
            //just play the file once
        else {
            audioPlayer.play()
        }
    }
    
    //MOTION EVENT TARGET FUNCTIONS
    @objc func motionXValueDidChange(_ sender:UISlider!)
    {
        self.pitch = pitch-100
    }
    @objc func motionYValueDidChange(_ sender:UISlider!)
    {
        self.pitch = pitch+100
    }
}
