//based off SwiftUI Apprentice
//modified by: a-a-robbins

import SwiftUI

@main
struct HIITFitApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
            .onAppear {
                print(FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask))
            }
    }
  }
}
