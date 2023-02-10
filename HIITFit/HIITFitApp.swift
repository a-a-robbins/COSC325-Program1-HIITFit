//based off SwiftUI Apprentice
//modified by: a-a-robbins

import SwiftUI

@main
struct HIITFitApp: App {
    @StateObject private var historyStore: HistoryStore
    @State private var showAlert = false
    
    init() {
        let historyStore: HistoryStore
        do {
            historyStore = try HistoryStore(withChecking: true)
        }
        catch {
            print("Could not load history data")
            showAlert = true
            historyStore = HistoryStore()
        }
        _historyStore = StateObject(wrappedValue: historyStore)
    }
  var body: some Scene {
    WindowGroup {
      ContentView()
            .environmentObject(historyStore)
            .onAppear {
                print(FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask))
            }
    }
  }
}
