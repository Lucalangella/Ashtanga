//
//  CardView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 09/12/24.
//

import SwiftUI

struct AshtangaView: View {
    
    let routines: [YogaRoutine] = [SunRoutine, beginnerRoutine, intermediateRoutine, advancedRoutine]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) { // Add vertical spacing between cards
                    ForEach(routines) { routine in
                        NavigationLink(destination: RoutineView(routine: routine)) {
                            CardRoutineView(routine: routine)
                                .padding(.horizontal) // Consistent horizontal padding
                        }
                        .accessibilityLabel("\(routine.name) Routine")
                        .accessibilityHint("Tap to view details and start practice")
                    }
                }
                .padding(.top, 16)
                .navigationTitle("Ashtanga")
                .navigationBarTitleDisplayMode(.large)
            }
            .background(Color(.systemGroupedBackground)) // Subtle background color
        }
    }
}



struct AshtangaView_Previews: PreviewProvider {
    static var previews: some View {
        AshtangaView()
    }
}
