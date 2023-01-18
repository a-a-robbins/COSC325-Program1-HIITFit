//based off SwiftUI Apprentice
//modified by: a-a-robbins

import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView {
          WelcomeView()
              .tabItem {Text("Welcome")
              }
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
          
          ForEach(0..<4) { index in ExerciseView(index: index)
                  .tabItem {Text("Exercise")
                  }
                  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
              
          }
//          Text("Exercise 2")
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
