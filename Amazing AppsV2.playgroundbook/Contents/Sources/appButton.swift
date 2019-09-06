import Foundation
import UIKit
import AVFoundation

public class appButton: UIButton {
    
    var highlightColor = UIColor.cyan
    var defaultColor = UIColor.blue
    public var setWidth = 200
    public var setHeight = 200
    public var setX = 100
    public var setY = 100
    var touch = "down"
    public var player = AVAudioPlayer()
    
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
    
    public func setHighlightColor(color: UIColor) {
        self.highlightColor = color
    }
    
    public func setDefaultColor(color: UIColor) {
        self.defaultColor = color
        self.backgroundColor = color
    }
    
    private func setupFrame() {
        frame = CGRect(x:setX, y:setY, width:setWidth, height:setHeight)
    }
    
    public func setPosition(x: Int, y: Int) {
        setX = x
        setY = y
        setupFrame()
    }
    
    public func setSize(width: Int, height: Int) {
        setWidth = width
        setHeight = height
        setupFrame()
    }
    
    public func setLoopCount(count: Int) {
        if count == 0 {
            self.player.numberOfLoops = 0
        }
        else {
            self.player.numberOfLoops = count - 1
        }
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
    
    public func addAudio(sound: String, touch: String) {
        //set button type
        self.touch = touch
        
        //get substrings of sound name and file type
        let soundType = sound.suffix(3)
        let soundName = sound.dropLast(4)
        
        let soundpath = Bundle.main.path(forResource: "\(soundName)", ofType: "\(soundType)")
        let soundurl = URL(fileURLWithPath: soundpath!)
        self.setupAudioPlayer(path: soundurl)
        self.backgroundColor = highlightColor
        if(touch == "up"){
            self.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        } else {
            self.addTarget(self, action: #selector(tapButton), for: .touchDown)
        }
    }
    
    public func addImage(image: String) {
        //get substrings of sound name and file type
        let imageType = image.suffix(3)
        let imageName = image.dropLast(4)
        let soundpath = Bundle.main.path(forResource: "\(imageName)", ofType: "\(imageType)")
        self.setImage(UIImage(named: image), for: .normal)
        self.setDefaultColor(color: UIColor.clear)
        self.setHighlightColor(color: UIColor.clear)
    }
    
    
    //function to play the audioPlayer
    @objc func tapButton() {
        self.player.currentTime = 0
        self.player.play()
    }
}
