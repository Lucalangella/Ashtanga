import SwiftUI

struct AsanaView: View {
    // Add this property to store unique poses
    let uniquePoses: [YogaPose]
    
    // Add an initializer
    init() {
        // Get all poses from all routines
        let allPoses = SunRoutine.poses + beginnerRoutine.poses + intermediateRoutine.poses + advancedRoutine.poses
        
        // Create a dictionary to store unique poses
        var uniquePosesDict = [String: YogaPose]()
        
        // Iterate through all poses and add them to the dictionary if they don't exist
        for pose in allPoses {
            if uniquePosesDict[pose.name] == nil {
                uniquePosesDict[pose.name] = pose
            }
        }
        
        // Convert the dictionary values to an array and sort by name
        self.uniquePoses = uniquePosesDict.values.sorted(by: { $0.sanskritName < $1.sanskritName })
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(uniquePoses) { pose in
                    NavigationLink(destination: YogaPoseView(pose: pose)) {
                        CardPoseView(pose: pose)
                            .padding(.vertical, 8) // Add breathing space between cards
                    }
                }
            }
            .navigationTitle("Asana")
            .background(Color(.systemGroupedBackground)) // Subtle background
        }
    }
}



#Preview {
    AsanaView()
}
