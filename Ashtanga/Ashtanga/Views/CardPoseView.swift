//
//  PoseView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 10/12/24.
//

import SwiftUI

struct CardPoseView: View {
    var pose: YogaPose
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Image(pose.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
                
                VStack(alignment: .leading) {
                    Text(pose.sanskritName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(pose.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }
    }
}

#Preview {
    CardPoseView(pose: YogaPose.init(image: "PrayerPose", sanskritName: "Pranamasana", name: "Prayer Pose", instructions: "Stand tall with feet together. Bring palms together in front of the chest in a prayer position. This pose symbolizes gratitude and sets an intention for the practice."))
}
