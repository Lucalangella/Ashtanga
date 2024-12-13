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
                            VStack(alignment: .leading) {
                                ForEach(routines) { routine in
                                    NavigationLink {
                                        RoutineView(routine: routine)
                                        } label: {
                                        VStack {
                                          VStack {
                                            Text(routine.sanskritName)
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text(routine.name)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                    }
                                                     .padding(.horizontal)
                                                     .padding(.vertical, 10)
                                        //time and poses
                                        HStack {
                                          HStack {
                                            Image(systemName: "stopwatch.fill")
                                              Text("\(routine.duration) min")
                                                  }
                                                  .padding(.leading)
                                           HStack {
                                            Image(systemName: "figure.yoga")
                                            Text(String(routine.poses.count))
                                                  }
                                                  .padding(.leading, 30)
                                                   Spacer()
                                                }
                                                .offset(y: -10)
                                                }
                                                .frame(height: 80)
                                                .frame(maxWidth: .infinity)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
                                                .padding()
                                            }
                                        }
                                    }
                                    .padding()
                                }
                .navigationTitle("Ashtanga")
            }
        }
    }


struct AshtangaView_Previews: PreviewProvider {
    static var previews: some View {
        AshtangaView()
    }
}
