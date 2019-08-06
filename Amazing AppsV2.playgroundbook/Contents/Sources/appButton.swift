import Foundation
import UIKit
import AVFoundation

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

public class appButton: UIButton {
    
    var highlightColor = UIColor.cyan
    var defaultColor = UIColor.blue
    var player = AVAudioPlayer()
    
    
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
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = highlightColor //Color when UIView is clicked.
        self.player.currentTime = 0
        self.player.play()
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = defaultColor //Color when UIView is clicked.
        self.player.stop()
    }
    
    public func setHighlightColor(color: UIColor) {
        self.highlightColor = color
    }
    
    public func setDefaultColor(color: UIColor) {
        self.defaultColor = color
    }
    
    public func setLoopCount(count: Int) {
        if count == 40 {
            self.player.numberOfLoops = -1
        }
        else if count == 0 {
            self.player.numberOfLoops = 1
        }
        else {
            self.player.numberOfLoops = count + 1
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
    
    public func addAudioTouchUp(sound: String) {
        //get substrings of sound name and file type
        let soundType = sound.suffix(3)
        let soundName = sound.dropLast(4)
        
        let soundpath = Bundle.main.path(forResource: "\(soundName)", ofType: "\(soundType)")
        let soundurl = URL(fileURLWithPath: soundpath!)
        self.setupAudioPlayer(path: soundurl)
        self.backgroundColor = highlightColor
        self.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    public func addAudioTouchDown(sound: String) {
        //get substrings of sound name and file type
        let soundType = sound.suffix(3)
        let soundName = sound.dropLast(4)
        
        let soundpath = Bundle.main.path(forResource: "\(soundName)", ofType: "\(soundType)")
        let soundurl = URL(fileURLWithPath: soundpath!)
        self.setupAudioPlayer(path: soundurl)
        self.addTarget(self, action: #selector(tapButton), for: .touchDown)
    }
    
    public func addAudioToggle(sound: String) {
        //get substrings of sound name and file type
        let soundType = sound.suffix(3)
        let soundName = sound.dropLast(4)
        let soundpath = Bundle.main.path(forResource: "\(soundName)", ofType: "\(soundType)")
        let soundurl = URL(fileURLWithPath: soundpath!)
        self.setupAudioPlayer(path: soundurl)
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
        self.player.play()
    }
}




