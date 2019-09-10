import Foundation
import UIKit
import AVFoundation


public class appSlider: UISlider {
    
    
    var sliderButton = appButton()
    var soundlist:[String] = [""]
    public var width = 300
    public var height = 100
    public var xPos = 100
    public var yPos = 100
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFrame()
    }
    
    init(frame: CGRect, defaultColor: UIColor, highlightColor: UIColor) {
        super.init(frame: frame)
        setupFrame()
    }
    
    init(frame: CGRect, minimumValue: Float, maximumValue: Float) {
        super.init(frame: frame)
        self.minimumValue = 1
        self.maximumValue = 10
        self.tintColor = UIColor.black
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
        setMinMax(min: 1, max: 10)
    }
    
    public func setMinMax(min:Float, max:Float){
        self.minimumValue = min
        self.maximumValue = max
    }
    
    public func attachButtonWithLoop(button: appButton){
        self.sliderButton = button
        self.addTarget(self, action: #selector(loopValueDidChange(_ :)), for: .valueChanged)
    }
    
    public func attachButtonWithSound(button: appButton, list: [String]){
        self.sliderButton = button
        self.soundlist = list
        self.addTarget(self, action: #selector(soundValueDidChange(_ :)), for: .valueChanged)
    }
    
    public func attachButtonWithPitch(button: appButton){
        //reset min/max to normal pitch values
        setMinMax(min:-2400, max:2400)
        self.sliderButton = button
        self.addTarget(self, action: #selector(pitchValueDidChange(_ :)), for: .valueChanged)
    }
    
    public func attachButtonWithSpeed(button: appButton){
        //reset min/max to reasonable speeds
        setMinMax(min:1, max:10)
        self.sliderButton = button
        self.addTarget(self, action: #selector(speedValueDidChange(_ :)), for: .valueChanged)
    }
    
    //function needed for sliders
    @objc func loopValueDidChange(_ sender:UISlider!)
    {
        self.sliderButton.loopCount = Int(sender.value)
        
    }
    
    @objc func pitchValueDidChange(_ sender:UISlider!)
    {
        self.sliderButton.setAudioPitch(pitch: Float(sender.value))
        
    }
    
    @objc func speedValueDidChange(_ sender:UISlider!)
    {
        self.sliderButton.setAudioSpeed(speed: Float(sender.value))
    }
    
    @objc func soundValueDidChange(_ sender:UISlider!)
    {
        var i = 1
        
        for sound in self.soundlist {
            if (i == Int(sender.value)) {
                self.sliderButton.addAudio(sound: sound, type: "down")
            }
            i = i+1
            
        }
    }
    
    
}
