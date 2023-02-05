//based off SwiftUI Apprentice
//modified by: a-a-robbins

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    //@Binding var showAlert: Bool
    
    var body: some View {
        TabView (selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)
            ForEach(0 ..< Exercise.exercises.count, id:\.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        //HELP -- FIXME
//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("History"),
//                message: Text (
//                """
//                Unfortunately we can't load your past history.
//                Email support:
//                    support@xyz.com
//                """))
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
