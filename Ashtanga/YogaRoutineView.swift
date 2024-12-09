import SwiftUI

struct YogaRoutineView: View {
    let routine: YogaRoutine
    @State private var currentPoseIndex = 0
    @State private var timeRemaining: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(routine.name)
                .font(.largeTitle)
            Text("Difficulty: \(routine.difficulty.rawValue.capitalized)")
                .font(.subheadline)
            
            if currentPoseIndex < routine.poses.count {
                let pose = routine.poses[currentPoseIndex]
                Text(pose.name)
                    .font(.title)
                Text(pose.instructions)
                    .padding()
                Text("Time Remaining: \(Int(timeRemaining))s")
                    .font(.headline)
            } else {
                Text("Routine Complete!")
                    .font(.title)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else if currentPoseIndex < routine.poses.count - 1 {
                currentPoseIndex += 1
                timeRemaining = routine.poses[currentPoseIndex].duration
            }
        }
        .onAppear {
            timeRemaining = routine.poses[currentPoseIndex].duration
        }
    }
}

struct YogaRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        YogaRoutineView(routine: sampleRoutine)
    }
}

// End of file. No additional code.
