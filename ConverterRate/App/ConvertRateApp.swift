import SwiftUI
import Combine

@available(iOS 15.0, *)
@main
struct ConverterRateApp: App {
    @ObservedObject
    private var viewModel: ViewModel = .init()
    
    let container = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, self.container.container.viewContext)
                .environmentObject(self.viewModel)
                .task {
                    if self.viewModel.valute.date != Date().format {
                        self.viewModel.getValute()
                    }
                }
        }
    }
}
