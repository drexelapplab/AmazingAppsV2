import Foundation
import UIKit
import AVFoundation


public class appSlider: UISlider {
    
    var sliderButton = appButton()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    public func setMinMax(min:Float, max:Float){
        self.minimumValue = min
        self.maximumValue = max
    }
    
    public func attachButtonWithLoop(button: appButton){
        self.sliderButton = button
        self.addTarget(self, action: #selector(loopValueDidChange(_ :)), for: .valueChanged)
    }
    
    //function needed for sliders
    @objc func loopValueDidChange(_ sender:UISlider!)
    {
        self.sliderButton.setLoopCount(count: Int(sender.value))
        
    }
    
}
