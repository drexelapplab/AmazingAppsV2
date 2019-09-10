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
    public func addAudio(sound: String, type: String) {
        
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
        if(type == "up"){
            self.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        } else if type == "down"{
            self.addTarget(self, action: #selector(tapButton), for: .touchDown)
        } else { //type equals motion or pitch
            startAccelerometers(type: type)
        }
    }
    
    //REPLACE BUTTON WITH AN IMAGE
    public func addImage(image: String) {
        
        //load image
        self.setImage(UIImage(named: image), for: .normal)
        //clear any assigned colors
        self.setDefaultColor(color: UIColor.clear)
        self.setHighlightColor(color: UIColor.clear)
    }
    
    //MOTION FUNCTIONS
    public func startAccelerometers(type:
        String) {
        
        var x = 0.00
        var y = 0.00
        var z = 0.00
        
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 30.0 //60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/40.0), repeats: true, block: { (timer) in
                
                // Get the accelerometer data.
                if let data = self.motion.accelerometerData {
                    
                    if x < data.acceleration.x || y < data.acceleration.y {
                        if (type == "pitch"){
                            self.pitch = self.pitch - 100
                            self.pitchControl.pitch = self.pitch
                            self.pitchControl.rate = self.speed
                        }
                        self.audioPlayer.stop()
                        self.audioPlayer.scheduleFile(self.audioFile, at: nil)
                        self.audioPlayer.play()
                    }
                    
                    if x > data.acceleration.x || y > data.acceleration.y {
                        if (type == "pitch"){
                            self.pitch = self.pitch + 100
                            self.pitchControl.pitch = self.pitch
                            self.pitchControl.rate = self.speed
                        }
                        self.audioPlayer.stop()
                        self.audioPlayer.scheduleFile(self.audioFile, at: nil)
                        self.audioPlayer.play()
                    }
                    
                    if z != data.acceleration.z{
                        if (type == "pitch"){
                            self.pitch = self.pitch + 100
                            self.pitchControl.pitch = self.pitch
                            self.pitchControl.rate = self.speed
                        }
                        
                        self.audioPlayer.stop()
                        self.audioPlayer.scheduleFile(self.audioFile, at: nil)
                        self.audioPlayer.play()
                    }
                    self.audioPlayer.scheduleFile(self.audioFile, at: nil)
                    self.audioPlayer.play()
                    
                    x = data.acceleration.x
                    y = data.acceleration.y
                    z = data.acceleration.z
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
    
}

