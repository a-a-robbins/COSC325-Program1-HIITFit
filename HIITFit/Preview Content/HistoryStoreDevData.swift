
import Foundation

extension HistoryStore {
     func createDevData() {
        //test data
        exerciseDays = [
            ExerciseDay (
                date: Date().addingTimeInterval(-86400),
                exercises: [
                    Exercise.exercises[0].exerciseName,
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[2].exerciseName
            ]),
            ExerciseDay (
                date: Date().addingTimeInterval(-84600 * 2),
                exercises: [
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[0].exerciseName
                ])
        ]
    }
}
