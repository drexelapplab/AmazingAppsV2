
import Foundation
import UIKit
import AVFoundation



public class appLabel: UILabel {

public override init(frame: CGRect) {
super.init(frame: frame)
}

init(frame: CGRect, defaultColor: UIColor, highlightColor: UIColor) {
super.init(frame: frame)
self.textColor = UIColor.black
}

required public init?(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
fatalError("init(coder:) has not been implemented")
}



}


