import UIKit

var str = "Hello, playground";

var var1:Int? = nil;
var var2:Int! = 3;

if let y = var1 {
    let var3:Int = y + var2;
    print(var3);
} else {
    print("Error: no value!");
}
