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

public class ClickableUIView: UIView {
    
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
    
    public func setHighlightColor(highlightColor: UIColor) {
        self.highlightColor = highlightColor
    }
    
    public func setDefaultColor(defaultColor: UIColor) {
        self.defaultColor = defaultColor
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
        }}
    }
    
