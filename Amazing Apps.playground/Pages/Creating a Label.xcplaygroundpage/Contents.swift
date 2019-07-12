//: [Previous](@previous)
//:
//: ## Creating a Label
//: Let's get started with adding a simple label to the screen.
//#-hidden-code
import PlaygroundSupport
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        let appview = UIView()
        self.view = appview
        view.backgroundColor = UIColor.white
        //#-end-hidden-code
//: When creating a new item you have to define the shape and size you want that item to be. The code below adds a new label container **(UILabel)** with the shape **(frame)** of a rectangle **(CGRect)**.
//:
//: **Exercise:**
//:
//: Look at the code for the label below.
//: The **X** (horizontal) and **Y** (vertical) parameters plot the label on the screen. The width and height determine the size of the label.
//:
//:  * Press the **Run My Code** button to see how the label is displayed on the screen.
//:  * Adjust the **X** and **Y** parameters and click **Run** to see how the label moves.
//:  * **Troubleshooting**:  Can you figure out why all of the text isn't showing?  Adjust the parameters of the label to see if you can fix it.

    // create a variable called "mylabel" that is a square container
    let mylabel = UILabel (frame: CGRect(x: /*#-editable-code*/100/*#-end-editable-code*/, y: /*#-editable-code*/100/*#-end-editable-code*/, width: /*#-editable-code*/50/*#-end-editable-code*/, height: /*#-editable-code*/50/*#-end-editable-code*/))
        
//: Add your own text to the label property below and **Run** it to see how it displays.
        
    //adding a text property to the label
    mylabel.text = /*#-editable-code*/"This is my first label for a music app!"/*#-end-editable-code*/
        
//: Next, change the color **(textColor)** of the label text.  You can use basic color names like red, blue, cyan, black, and white using the **UIColor** class.
    //adjusting the text color property
    mylabel.textColor = /*#-editable-code*/UIColor.blue/*#-end-editable-code*/

//: As you create objects, you need to let the app know about them.
//:
//:The code below tells the app to add the label to the screen which Swift refers to as a *View*.  The items you add to the *View* are called *Subviews*.
        
    // tell the App to display the label
    appview.addSubview(mylabel)

//: [Next](Creating%20a%20Button) - Creating a Button

//#-hidden-code
    }
}

PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
