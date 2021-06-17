import SwiftUI
import Combine

@available(iOS 15.0, *)
@main
struct ConverterRateApp: App {
    @ObservedObject
    private var viewModel: ViewModel = .init()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.viewModel)
                .task {
                    self.viewModel.getValute()
                }
        }
    }
}
