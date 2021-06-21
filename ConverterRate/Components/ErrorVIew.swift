import SwiftUI
import Lottie

struct ErrorVIew: View {
    
    var title: String = "Ошибка!"
    var description: String = "Что-то пошло не по плану :("
    
    var body: some View {
        VStack {
            LottieView(content: "error")
                .frame(height: 250, alignment: .center)
            Text(self.title)
                .font(.title)
                .padding(.vertical)
                .multilineTextAlignment(.center)
            Text(self.description)
                .multilineTextAlignment(.center)
        }.padding()
    }
}
