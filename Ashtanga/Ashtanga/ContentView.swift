//
//  ContentView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 09/12/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var cameraManager = CameraManager()
    @State private var showCamera = false
    
    var body: some View {
        NavigationView {
            VStack {
                if showCamera {
                    // Camera view
                    ZStack {
                        CameraPreview(cameraManager: cameraManager)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Spacer()
                            Text("Camera Active")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                            
                            NavigationLink(destination: YogaRoutineView(routine: sampleRoutine)) {
                                Text("Begin Routine")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                    }
                    .onAppear {
                        cameraManager.startSession()
                    }
                    .onDisappear {
                        cameraManager.stopSession()
                    }
                } else {
                    // Welcome view
                    VStack {
                        Text("Yoga Practice App")
                            .font(.largeTitle)
                        
                        Button(action: {
                            showCamera = true
                        }) {
                            Text("Start Practice")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Yoga App", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    showCamera = false
                    cameraManager.stopSession()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                }
                .opacity(showCamera ? 1 : 0)
            )
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let cameraManager: CameraManager
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        cameraManager.previewLayer?.frame = view.bounds
        view.layer.addSublayer(cameraManager.previewLayer!)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
