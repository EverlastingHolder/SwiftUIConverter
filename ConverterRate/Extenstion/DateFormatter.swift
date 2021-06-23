import Foundation

extension DateFormatter {
    static let shortFormatDate: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        return dateFormat
    }()
}
