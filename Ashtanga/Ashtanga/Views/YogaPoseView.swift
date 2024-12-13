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
                    Image(pose.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .cornerRadius(20)
                        .padding(.top, showCloseButton ? 40 : 20) // Adjust top padding if close button is shown

                    VStack(spacing: 8) {
                        Text(pose.sanskritName)
                            .font(.title)
                            .foregroundColor(.black)

                        Text(pose.name)
                            .font(.title3)
                            .foregroundColor(.gray)

                        Text(pose.instructions)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                   Spacer()
                }
                .frame(maxWidth: .infinity)
    }
}

struct YogaPoseView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePose = YogaPose(
            image: "Mountain",
            sanskritName: "Tadasana",
            name: "Mountain Pose",
            instructions: "Stand tall with feet together, shoulders relaxed, weight evenly distributed through your soles, arms at sides."
        )
        YogaPoseView(pose: samplePose, showCloseButton: true) // Preview with close button
    }
}
