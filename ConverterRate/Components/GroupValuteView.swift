import SwiftUI

struct GroupValuteView: View {
    
    @State var flag: String
    @State var name: String
    
    var body: some View {
        HStack {
            Text(String.flagCountry(self.flag))
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(self.flag)
                Text(self.name)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}
