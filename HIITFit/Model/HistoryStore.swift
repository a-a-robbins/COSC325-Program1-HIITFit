
import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    init(withChecking: Bool) throws {
        #if DEBUG
        //createDevData()
        #endif
        do {
            try load()
        }
        catch {
            throw error
        }
    }
    init() {}
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
            if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
                print("Adding \( exerciseName )")
                exerciseDays[0].exercises.append(exerciseName)
            }
            else {
                exerciseDays.insert(
                    ExerciseDay(date: today, exercises: [exerciseName]),
                    at: 0)
            }
        print("History: ", exerciseDays)
        do {
            try save()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getURL() -> URL? {
        guard let documentsURL = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        return documentsURL.appendingPathExtension("history.plist")
    }
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
        case urlFailure
    }
    
    func load() throws {
//        Use a separate guard-let to get data, and just return if that fails.  Then continue as before
        guard let plistExists = getURL()
        else  { return }ç
        guard let dataURL = getURL()
        else {
            throw FileError.urlFailure
        }
        do {
          let data = try Data(contentsOf: dataURL)
          let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
          let convertedPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? [])
            }
        }
        catch {
            throw FileError.loadFailure
        }
    }
    
    func save() throws {
        guard let dataURL = getURL()
        else {
            throw FileError.urlFailure
        }
        let plistData = exerciseDays.map {
//            exerciseDay in [
//                exerciseDay.id.uuidString,
//                exerciseDay.date,
//                exerciseDay.exercises]
//            above code block in shorthand
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
            try data.write(to: dataURL, options: .atomic)
        }
        catch {
            throw FileError.saveFailure
        }
    }
}


