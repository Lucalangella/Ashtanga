//
//  RoutineView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 10/12/24.
//

import SwiftUI

struct RoutineView: View {
    var routine: YogaRoutine
    @State private var isPracticeViewPresented = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            VStack(spacing: 30) {
                HStack(spacing: 0) {
                    VStack {
                        Text(routine.name)
                            .font(.title2)
                            .foregroundStyle(Color.secondary)
                            .padding(.bottom, 5)
                        HStack {
                            Image(systemName: "stopwatch.fill")
                            Text(String(format: "%02d:%02d", routine.duration))
                            HStack {
                                Image(systemName: "figure.yoga")
                                Text("\(routine.poses.count)")
                            }
                            .padding(.leading, 10)
                        }
                    }
                    .padding(.leading)
                    Spacer()
                }
                
                Button(action: {
                    isPracticeViewPresented = true
                }) {
                    Text("Start Practice")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RadialGradient(
                                gradient: Gradient(colors: [.red.opacity(0.8), .orange]),
                                center: .center,
                                startRadius: 10,
                                endRadius: 100
                            )
                        )
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .sheet(isPresented: $isPracticeViewPresented) {
                    PracticeView(routine: routine, startImmediately: true)
                }
                
                List {
                    Section(header: Text("Asana")) {
                        ForEach(routine.poses) { pose in
                            NavigationLink {
                                YogaPoseView(pose: pose)
                            } label: {
                                CardPoseView(pose: pose)
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(routine.sanskritName)
    }
}



#Preview {
    NavigationView {
        RoutineView(routine: SunRoutine)
    }
}
