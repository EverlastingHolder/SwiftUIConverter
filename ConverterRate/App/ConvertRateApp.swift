import SwiftUI
import Combine

@available(iOS 15.0, *)
@main
struct ConverterRateApp: App {
    @StateObject
    private var viewModel: ValuteView.ViewModel = .init()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.viewModel)
                .task {
                    if self.viewModel.valute.date != DateFormatter.shortFormatDate.string(from: Date()) {
                        self.viewModel.getValute()
                    }
                }
        }
    }
}
