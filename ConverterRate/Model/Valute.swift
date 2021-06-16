import Foundation

struct Valute: Codable, Comparable {
    static func < (lhs: Valute, rhs: Valute) -> Bool {
        lhs.rates["AMD"]!  < rhs.rates["AMD"]!
    }
    
    var disclaimer: String = ""
    var date: String = ""
    var timestamp: Int = 0
    var base: String = ""
    var rates: [String : Double] = [:]
}
