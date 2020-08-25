import Foundation

struct CalculatorTip {
    var tip: Tip?
    mutating func calculate(_ value: Float, _ numberOfPersons: Int, _ percentage: Int) {
        tip = Tip(value: value, numberOfPersons: numberOfPersons, percentage: percentage)
    }
}
