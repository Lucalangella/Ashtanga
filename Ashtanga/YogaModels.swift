import Foundation

struct YogaPose: Identifiable {
    let id = UUID()
    let name: String
    let duration: TimeInterval
    let instructions: String
}

struct YogaRoutine: Identifiable {
    let id = UUID()
    let name: String
    let difficulty: Difficulty
    let poses: [YogaPose]
}

enum Difficulty: String, CaseIterable {
    case beginner, intermediate, advanced
}

// Sample data
let samplePoses = [
    YogaPose(name: "Mountain Pose", duration: 30, instructions: "Stand tall with feet together, shoulders relaxed, weight evenly distributed through your soles, arms at sides."),
    YogaPose(name: "Tree Pose", duration: 60, instructions: "Begin in Mountain Pose. Shift your weight to your left foot, lifting your right foot off the floor. Bend your right knee, bringing the sole of your right foot high onto your inner left thigh.")
]

let sampleRoutine = YogaRoutine(name: "Basic Flow", difficulty: .beginner, poses: samplePoses)

// End of file. No additional code.
