//import UIKit
//
//var str = "Hello, playground";
//
//var var1:Int? = nil;
//var var2:Int! = 3;
//
//if let y = var1 {
//    let var3:Int = y + var2;
//    print(var3);
//} else {
//    print("Error: no value!");
//}

enum Month {
    case Jan (days: Int)
    case Feb (days: Int)
    case Mar (days: Int)
    case Apr (days: Int)
    case May (days: Int)
    case Jun (days: Int)
    case Jul (days: Int)
    case Aug (days: Int)
    case Sep (days: Int)
    case Oct (days: Int)
    case Nov (days: Int)
    case Dec (days: Int)
}

var month = Month.Jan(days: 5)

switch month {
    case .Jan(let days):
        print("Month: January, Day: \(days)")
    case .Feb(let days):
        print("Month: Febuary, Day: \(days)")
    case .Mar(let days):
        print("Month: March, Day: \(days)")
    case .Apr(let days):
        print("Month: April, Day: \(days)")
    case .May (let days):
        print("Month: May, Day: \(days)")
    case .Jun (let days):
        print("Month: June, Day: \(days)")
    case .Jul (let days):
        print("Month: July, Day: \(days)")
    case .Aug (let days):
        print("Month: August, Day: \(days)")
    case .Sep (let days):
        print("Month: September, Day: \(days)")
    case .Oct (let days):
        print("Month: Octobor, Day: \(days)")
    case .Nov (let days):
        print("Month: November, Day: \(days)")
    case .Dec (let days):
        print("Month: December, Day: \(days)")
}
