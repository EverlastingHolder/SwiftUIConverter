import Foundation

extension String {
    static func flagCountry (_ country: String) -> String {
        let base: UInt32 = 127397
        
        var flag = ""
        
        // XDR is the world currency, so let's give it a neutral flag.
        
        if (country == "XDR") {
            return "🏳️"
        }
        
        for char in country.prefix(2).unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + char.value)!)
        }
        
        return flag
    }
    
    
    func removingSpaces() -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
            return self
        }
        guard let indexLeft = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
            return self
        }
        return String(self[index...indexLeft])
    }
    
    
    var toDouble: Double {
        Double(self) ?? 0
    }
}
