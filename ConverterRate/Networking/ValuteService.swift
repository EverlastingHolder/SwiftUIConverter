import Foundation
import Combine
import SwiftUI

protocol ValuteServiceType {
    func get () -> AnyPublisher<Valute, Error>
}

final class ValuteService: ValuteServiceType {
    @Environment(\.agent)
    var agent: Agent
    
    func get() -> AnyPublisher<Valute, Error> {
        self.agent.run()
    }
}

struct ValuteServiceKey: EnvironmentKey {
    static let defaultValue: ValuteService = ValuteService()
}

extension EnvironmentValues {
    var valuteService: ValuteService {
        get {
            self[ValuteServiceKey.self]
        }
        set {
            self[ValuteServiceKey.self] = newValue
        }
    }
}
