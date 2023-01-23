//based off SwiftUI Apprentice
//modified by: a-a-robbins

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                       Text("Get fit")
                            .font(.largeTitle)
                        
                        Text("with high intensity interval training " )
                            .font(.headline)
                    }
                    Image("step-up")
//                        .resizable()
//                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                        .frame(width: 240.0, height: 240.0)
                    //replacing above with extended code
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(Circle())
                }
                Button(action: {}) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                    //below did not display the arrow image
//                    Label("Get Started", systemImage: "arrow.right.cirlce")
                }
                .font(.title2)
                .padding()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
