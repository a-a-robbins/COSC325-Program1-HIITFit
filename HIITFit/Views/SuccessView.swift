
import SwiftUI

struct SuccessView: View {
    let message = """
      Good job completing all four exercises!
      Remember tomorrow's another day.
      So eat well and get some rest.
      
      """
    var body: some View {
        ZStack (alignment: .topTrailing) {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top)
                Text(message)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            Button(action: {}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}

