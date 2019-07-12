//:
//: ---
//:
//: ## Creating a Label
//: Let's get started with adding a simple label to the screen.
//:
//: **Adding an item to the screen**
//: When creating a new item you have to define the shape and size you want that item to be. The code below adds a new label container **(UILabel)** with the shape of a rectangle **(frame: CGRect)**.
//:
//: The *X* (horizontal) and *Y* (vertical) parameters plot the label on the screen. The width and height determine the size of the label.
//:
//: *Compare this to how you have to adjust and move text when adding it to a slide show presentation.*
//#-hidden-code
import PlaygroundSupport
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        view.backgroundColor = UIColor.white
//#-end-hidden-code
//: **Click the *Run My Code* button.**
//: Notice anything odd?
//: Adjust the code below to make all of the text show up. Click the *Run* button to see if you fixed the issue.
        
        //create a square container for the label
        let mylabel = UILabel(frame: CGRect(x:/*#-editable-code*/100/*#-end-editable-code*/,y:/*#-editable-code*/100/*#-end-editable-code*/,width:/*#-editable-code*/75/*#-end-editable-code*/,height:/*#-editable-code*/50/*#-end-editable-code*/))

//: Add your own text below and then click *Run* to see the changes.
        // add a text property to the label
        mylabel.text = /*#-editable-code*/"This is my first label for a music app!"/*#-end-editable-code*/
//:
//: Change the text color property of the label
        mylabel.textColor = /*#-editable-code*/UIColor.blue/*#-end-editable-code*/
//: Take a look at the code below.
//:Any time you create a new object, you have to tell the screen to display it.
        // tell the App to display the label
        appview.addSubview(mylabel)
        
//#-hidden-code
    }
}
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()

//#-end-hidden-code

