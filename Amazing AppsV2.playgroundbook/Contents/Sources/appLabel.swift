
import Foundation
import UIKit
import AVFoundation

public class appLabel: UILabel {
    
    public var width = 200
    public var height = 60
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
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //set default shape of label
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
}


