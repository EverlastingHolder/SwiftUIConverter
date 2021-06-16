import Combine
import Foundation
import SwiftUI

class ViewModel: BaseViewModel, ObservableObject {
    @Environment(\.valuteService)
    private var service: ValuteService
    
    @Published var valute: Valute = Valute()
    @Published var isSelect: Bool = false
    
    func getValute() {
        self.service.get()
            .subscribe(on: Scheduler.background)
            .receive(on: Scheduler.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("\(error)")
                case .finished:
                    break
                }
            }){ result in
                self.valute = result
            }
            .store(in: &self.bag)
    }
}
