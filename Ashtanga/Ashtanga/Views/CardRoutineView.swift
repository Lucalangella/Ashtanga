//
//  CardRoutineView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 17/12/24.
//

import SwiftUI

struct CardRoutineView: View {
    let routine: YogaRoutine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Routine Titles
            Text(routine.sanskritName)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Text(routine.name)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            // Time and Poses - Grouped in HStack
            HStack {
                Label("\(routine.duration) min", systemImage: "stopwatch.fill")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                Label("\(routine.poses.count) poses", systemImage: "figure.yoga")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                    .padding(.leading, 8)
            }
        }
        .padding()
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.accent, lineWidth: 1)
            }
        )
    }
}

#Preview {
    CardRoutineView(routine: SunRoutine)
}
