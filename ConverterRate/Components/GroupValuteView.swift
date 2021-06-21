import SwiftUI

struct GroupValuteView: View {
    
    @State var flag: String
    
    var body: some View {
        HStack {
            Text(String.flagCountry(self.flag))
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(self.flag)
            }
        }
    }
}
