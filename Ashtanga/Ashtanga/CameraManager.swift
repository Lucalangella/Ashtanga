import AVFoundation
import SwiftUI

class CameraManager: NSObject, ObservableObject {
    @Published var session = AVCaptureSession()
    @Published var output = AVCaptureVideoDataOutput()
    @Published var previewLayer: AVCaptureVideoPreviewLayer?
    
    override init() {
        super.init()
        setupCamera()
    }
    
    func setupCamera() {
        // Get the front camera device
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
        
        do {
            // Create input from the camera device
            let input = try AVCaptureDeviceInput(device: device)
            
            // Add input to the session if possible
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            // Add output to the session if possible
            if session.canAddOutput(output) {
                session.addOutput(output)
            }
            
            // Create and configure preview layer
            previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer?.videoGravity = .resizeAspectFill
        } catch {
            print("Failed to setup camera: \(error)")
        }
    }
    
    func startSession() {
        // Start the capture session on a background thread
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
    }
    
    func stopSession() {
        // Stop the capture session
        session.stopRunning()
    }
}
