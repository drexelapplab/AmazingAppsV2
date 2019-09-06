//:![ExCITe Center Logo?](excite-logo-small.png)
//:# Amazing Apps
//:
//:## Introduction to Programming
//: Lets review a few definitions before we get started.
//:
//: What is **code**?  Code is a set of instructions or statements that can inform or control a device, machine, or other object.
//:
//: Code is written in a **programming language** such as Java, Python, or in this case, Swift.  Each language has its own syntax and unique structure and rules that are used to write code.
var message = "Hello World!"
print(message)
//: *message:  Hello World!*
//:
//: A **variable** (or var) is a piece of information that can change.
//:
//: A **constant** (or let) is a piece of information that doesn't change.
//:
//: ** Example: **
//average human temp shouldn't change
let avgTemp = 98.6
//my temp might change
var myTemp = 99.1
//:
//: Programs can include **comments** that explain the code or provide a reminder to fix something.  See the comment for the *screenWidth* variable below. The comment helps the programmer understand the measurements being used. Use the double forward slashes to make a comment. "//"
//width of the screen in pixels
var screenWidth = 720
//:
//: Comments can also be used to comment out code. Programmers comment out code for testing or troubleshooting programs.
// screen height is not needed yet
// var screenHeight = 100
//:
//: Variables and constants can be combined and evaluated in code to create a program. Programmers use *if* and *if/else* statements to check on conditions and react to them.  Pay attention to the syntax used including the *()* used for if statements and the *{}* (curly brackets) used to open and close both the *if* and the *else* statements.
let volumeLimit = 100
var myVolume = 110

//use an "if" statement to evaluate the numbers
if (myVolume > volumeLimit) {
    print("Turn your music down!")
}

//use an "if/else" statement to respond if the volume is fine
if (myVolume > volumeLimit) {
    print("Turn your music down!")
}
else {
    print("Thank you for being quiet.")
}

//: Look at the **syntax** of the different statements.  Although all languages will have a variation of an if/else statement, they will vary on how to format it.  Some may not require paranthesis and some may require that the brackets all align in a certain way.
//:
//:
//: [Next](@next)
