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
                        for (keyold, valueold) in self.viewModel.valute.rates {
                            if key != keyold {
                                self.viewModel.valute.rates.updateValue(valueold/value, forKey: keyold)
                            }
                        }
                        self.viewModel.valute.rates.updateValue(1 / value, forKey: self.viewModel.valute.base)
                        self.viewModel.valute.base = key
                        self.viewModel.valute.rates.removeValue(forKey: key)
                        self.viewModel.isSelect = false
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
            }
        }
        .listStyle(.plain)
    }
}
