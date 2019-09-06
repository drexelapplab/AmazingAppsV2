
import Foundation
import UIKit
import AVFoundation



public class appLabel: UILabel {
    
    public var setWidth = 200
    public var setHeight = 60
    public var setX = 100
    public var setY = 100
    
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
}


