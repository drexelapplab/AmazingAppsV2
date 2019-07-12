//: [Previous](@previous)

//:
//: ## Your Music App
//:
//: Use the blank canvas below to create your musical application.  Cut and paste code from the [Example Code](Example%20Code) page and modify it to make it your own creation.

//: Below is the core code necessary to implement our application *(this was hidden in our previous examples)*.
//import the necessary code libraries to support the app
import PlaygroundSupport
import UIKit
//create the main *View* for the app
class ViewController: UIViewController {
    override func viewDidLoad() {
        //create a constant that represents our main app *View*
        let appview = UIView()
        //tell the system what our main view is
        self.view = appview

/*#-editable-code*/

        //set the background color of the screen
        view.backgroundColor = UIColor.white
        
        //add your own code from the Example Code page below. Run the code when you're ready to test our your work
        
        

/*#-end-editable-code*/
//closing brackets to complete the *ViewController* and the *viewDidLoad* function
    }
}
//#-hidden-code
PlaygroundSupport.PlaygroundPage.current.liveView = ViewController()
//#-end-hidden-code
