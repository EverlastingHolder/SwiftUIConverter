import SwiftUI
import CoreData
import Combine

@available(iOS 15.0, *)
struct ValuteView: View {
    @EnvironmentObject
    private var viewModel: Self.ViewModel
    
    @State
    private var count: String = "1"
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Current:")
                    .font(.headline)
                
                HStack {
                    Button(action: {
                        self.viewModel.isSelect.toggle()
                    }) {
                        Text(String.flagCountry(self.viewModel.valute.base))
                            .font(.largeTitle)
                        Text(self.viewModel.valute.base)
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    TextField("", text: self.$count)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: self.count) {
                            self.count = $0.removingSpaces()
                            let filtered = $0.filter { "0123456789".contains($0) }
                            if filtered != $0 { self.count = filtered }
                        }
                }
                Text("To:")
                    .font(.headline)
            }
            .padding(.horizontal, 18)
            .sheet(isPresented: self.$viewModel.isSelect) {
                ValuteListItemView(count: self.$count)
            }
            ValuteListItemView(count: self.$count)
        }
    }
}
