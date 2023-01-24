
import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.raised.fill")
                .resizedToFill(width: 75, height: 75)
                .foregroundColor(.purple)
            Text("High Five!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}

