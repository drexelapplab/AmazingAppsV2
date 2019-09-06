import CoreMotion
import Foundation
import UIKit
import AVFoundation

public class appMotion: UIButton {
    
    var sound1 = AVAudioPlayer()
    var sound2 = AVAudioPlayer()
    var pitchsound = AVAudioPlayerNode()
    var engine = AVAudioEngine()
    var speedControl = AVAudioUnitVarispeed()
    var pitchControl = AVAudioUnitTimePitch()
    var motion = CMMotionManager()
    var highlightColor = UIColor.cyan
    var defaultColor = UIColor.blue
    var timer: Timer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, defaultColor: UIColor, highlightColor: UIColor) {
        
        super.init(frame: frame)
        self.defaultColor = defaultColor
        self.highlightColor = highlightColor
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setHighlightColor(color: UIColor) {
        self.highlightColor = color
    }
    
    public func setDefaultColor(color: UIColor) {
        self.defaultColor = color
    }
    
    public func addMotionControl(image: String, sound1: String, sound2: String, xMov: Double, zMov: Double) {
        
        self.setImage(UIImage(named: image), for: .normal)
        
        let sound1Type = sound1.suffix(3)
        let sound1Name = sound1.dropLast(4)
        let sound2Type = sound2.suffix(3)
        let sound2Name = sound2.dropLast(4)
        
        let soundpath1 = Bundle.main.path(forResource: "\(sound1Name)", ofType: "\(sound1Type)")
        let soundpath2 = Bundle.main.path(forResource: "\(sound2Name)", ofType: "\(sound2Type)")
        let soundurl1 = URL(fileURLWithPath: soundpath1!)
        let soundurl2 = URL(fileURLWithPath: soundpath2!)
        do { self.sound1 = try AVAudioPlayer(contentsOf: soundurl1)
        }catch {
            print("Something went wrong with the audio player")
        }
        do { self.sound2 = try AVAudioPlayer(contentsOf: soundurl2)
        }catch {
            print("Something went wrong with the audio player")
        }
        //self.sound1 = try AVAudioPlayer(contentsOf: soundurl1)
        //self.sound2 = try AVAudioPlayer(contentsOf: soundurl2)
        startAccelerometers(xMov: xMov, zMov: zMov)
        
        //clear the colors
        self.setDefaultColor(color: UIColor.clear)
        self.setHighlightColor(color: UIColor.clear)
    }
    
    public func startAccelerometers(xMov: Double, zMov: Double) {
        
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0 //60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                
                                if let data = self.motion.accelerometerData {
                                    let x = data.acceleration.x
                                    let y = data.acceleration.y
                                    let z = data.acceleration.z
                                    
                                    // Use the accelerometer data in your app.
                                    //if z > 0.5 {
                                    if z > zMov {
                                        self.sound1.play()
                                        
                                    }
                                    //if x > 0.5 {
                                    if x > xMov {
                                        self.sound2.play()
                                    }
                                }
            })
            
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
    public func addMotionPitch(image: String, sound1: String, sound2: String, xMov: Double, zMov: Double) {
        
        self.setImage(UIImage(named: image), for: .normal)
        
        let sound1Type = sound1.suffix(3)
        let sound1Name = sound1.dropLast(4)
        let sound2Type = sound2.suffix(3)
        let sound2Name = sound2.dropLast(4)
        
        let soundpath1 = Bundle.main.path(forResource: "\(sound1Name)", ofType: "\(sound1Type)")
        let soundpath2 = Bundle.main.path(forResource: "\(sound2Name)", ofType: "\(sound2Type)")
        let soundurl1 = URL(fileURLWithPath: soundpath1!)
        let soundurl2 = URL(fileURLWithPath: soundpath2!)
        var soundfile1 = AVAudioFile()
        do { soundfile1 = try AVAudioFile(forReading: soundurl1)
        }catch {
            print("error creating audio file")
        }
        do { _ = try AVAudioFile(forReading: soundurl2)
        } catch {
            print("error creating audio file")
        }
        
        self.pitchsound.scheduleFile(soundfile1, at: nil)
        do {self.sound2 = try AVAudioPlayer(contentsOf: soundurl2)
        } catch {
            print("error connecting sound2")
        }
        
        //self.sound1 = try AVAudioPlayer(contentsOf: soundurl1)
        //self.sound2 = try AVAudioPlayer(contentsOf: soundurl2)
        self.engine.attach(self.pitchsound)
        self.engine.attach(self.pitchControl)
        self.engine.attach(self.speedControl)
        
        self.engine.connect(self.pitchsound, to: speedControl, format: nil)
        self.engine.connect(self.speedControl, to: pitchControl, format: nil)
        self.engine.connect(self.pitchControl, to: engine.mainMixerNode, format: nil)
        
        //self.startAccelPitch(xMov: xMov, zMov: zMov)
        
        //clear the colors
        self.setDefaultColor(color: UIColor.clear)
        self.setHighlightColor(color: UIColor.clear)
    }
    
    public func startAccelPitch(xMov: Double, zMov: Double) {
        
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0 //60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                
                                if let data = self.motion.accelerometerData {
                                    let x = data.acceleration.x
                                    let y = data.acceleration.y
                                    let z = data.acceleration.z
                                    
                                    // Use the accelerometer data in your app.
                                    //if z > 0.5 {
                                    if z > zMov {
                                        do {try self.engine.start()
                                        }catch{
                                            print("engine failed")
                                        }
                                        self.pitchsound.play()
                                        
                                    }
                                    //if x > 0.5 {
                                    if x > xMov {
                                        self.sound2.play()
                                    }
                                }
            })
            
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
}




