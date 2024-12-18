//
//  YogaPoseView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 09/12/24.
//

import SwiftUI

struct YogaPoseView: View {
    var pose: YogaPose
    var showCloseButton: Bool = false // New parameter
    @Environment(\.presentationMode) var presentationMode

    var body: some View {

                VStack(spacing: 20) {
                    HStack{
                        VStack{
                            Text(pose.sanskritName)
                                .font(.title)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                            Text(pose.name)
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                        // Conditionally show the close button
                        if showCloseButton {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(.gray.opacity(0.5))
                                    .padding(16)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    Image(pose.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .cornerRadius(20)
                        .padding(.top, showCloseButton ? 40 : 20)
                        Text(pose.instructions)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    Spacer()
                   
                }
                .frame(maxWidth: .infinity)
    }
}

struct YogaPoseView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePose = YogaPose(
            image: "PrayerPose",
            sanskritName: "Pranamasana",
            name: "Prayer Pose",
            instructions: "Stand tall with feet together. Bring palms together in front of the chest in a prayer position. This pose symbolizes gratitude and sets an intention for the practice."
        )
        YogaPoseView(pose: samplePose, showCloseButton: true) // Preview with close button
    }
}
