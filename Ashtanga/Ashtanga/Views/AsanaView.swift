//
//  AsanaView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 09/12/24.
//

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
        self.uniquePoses = uniquePosesDict.values.sorted(by: { $0.name < $1.name })
    }
    
    var body: some View {
        NavigationStack {
            List {
                        ForEach(uniquePoses) { pose in
                            NavigationLink {
                                YogaPoseView(pose: pose)
                            } label: {
                                CardPoseView(pose: pose)
                            }
                        }
                    //.background(Color.gray.opacity(0.1))
                   // .cornerRadius(10)
                    //.padding(.horizontal)
                }
            .background(Color.gray.opacity(0.1))
                .navigationTitle("Asana")
        }
    }
}

#Preview {
    AsanaView()
}
