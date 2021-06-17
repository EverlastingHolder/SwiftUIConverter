import SwiftUI

@available(iOS 15.0, *)
struct ListItemView: View {
    
    @EnvironmentObject
    private var viewModel: ViewModel
    
    @Binding
    var count: String
    
    var body: some View {
        List {
            ForEach(self.viewModel.valute.rates.sorted(by: <), id: \.key) { key, value in
                if self.viewModel.isSelect{
                    Button(action:{
                        self.viewModel.selectedValute(key: key, value: value)
                    }){
                        HStack {
                            GroupValuteView(flag: key, name: "")
                            Spacer()
                            Text(String(format: "%.2f", self.count.toDouble * value))
                        }
                        .lineLimit(1)
                    }
                } else {
                    HStack {
                        GroupValuteView(flag: key, name: "")
                        Spacer()
                        Text(String(format: "%.2f", self.count.toDouble * value))
                    }
                    .lineLimit(1)
                }
            }.listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
