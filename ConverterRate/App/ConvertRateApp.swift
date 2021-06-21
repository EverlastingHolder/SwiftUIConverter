import SwiftUI
import Combine

@available(iOS 15.0, *)
@main
struct ConverterRateApp: App {
    @ObservedObject
    private var viewModel: ValuteView.ViewModel = .init()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.viewModel)
                .task {
                    if self.viewModel.valute.date != Date().format {
                        self.viewModel.getValute()
                    }
                }
        }
    }
}
