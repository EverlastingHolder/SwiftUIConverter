import Foundation

extension Date {
    var format: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        return dateFormat.string(from: Date())
    }
}
