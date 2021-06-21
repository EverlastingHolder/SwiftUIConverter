import SwiftUI

@available(iOS 15.0, *)
struct ValuteListItemView: View {
    
    @EnvironmentObject
    private var viewModel: ViewModel
    
    var valute: FetchedResults<Valutes>
    
    @Binding
    var count: String
    
    var body: some View {
        List {
            ForEach(self.viewModel.valute.rates.sorted(by: <), id: \.key) { key, value in
                self.selectedValute(key: key, value: value)
            }.listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    private func selectedValute(key: String, value: Double) -> AnyView{
        if self.viewModel.isSelect{
           return Button(action:{
                self.viewModel.updateSelectedValute(key: key, value: value)
            }){
                HStack {
                    GroupValuteView(flag: key)
                    Spacer()
                    Text(String(format: "%.2f", self.count.toDouble * value))
                }
                .lineLimit(1)
            }.eraseToAnyView()
        } else {
            return HStack {
                GroupValuteView(flag: key)
                Spacer()
                Text(String(format: "%.2f", self.count.toDouble * value))
            }
            .lineLimit(1)
            .eraseToAnyView()
        }
    }
}
