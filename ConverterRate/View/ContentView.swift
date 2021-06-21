import SwiftUI
import CoreData
import Combine

@available(iOS 15.0, *)
struct ContentView: View {
    
    @EnvironmentObject
    private var viewModel: ValuteView.ViewModel
    
    var body: some View {
        if self.viewModel.isError {
            ErrorVIew()
        } else {
            ValuteView()
        }
    }
}
