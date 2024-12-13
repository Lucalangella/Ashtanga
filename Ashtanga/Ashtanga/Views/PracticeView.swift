import SwiftUI
import AVFoundation

struct PracticeView: View {
    var routine: YogaRoutine
    var startImmediately: Bool
    @State private var currentPoseIndex = 0
    @State private var timeRemaining = 30
    @State private var timer: Timer?
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isPaused = true
    @State private var isVoiceOverEnabled = true
    @State private var showPoseDetails = false
    @Environment(\.presentationMode) var presentationMode
    var currentPose: YogaPose {
        routine.poses[currentPoseIndex]
    }
    
    var body: some View {
            ZStack {
                VStack{
                 
                    VStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack {
                            Text(String(format: "%02d:%02d", timeRemaining / 60, timeRemaining % 60))
                                .font(.system(size: 54, design: .monospaced))
                            Spacer()
                            Button(action: {
                                isVoiceOverEnabled.toggle()
                                if !isVoiceOverEnabled {
                                    synthesizer.stopSpeaking(at: .immediate)
                                }
                            }) {
                                Image(systemName: isVoiceOverEnabled ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.black)
                            }
                            .padding(.trailing, 8)
                            
                            Button(action: {
                                if isPaused {
                                    startPractice()
                                } else {
                                    pausePractice()
                                }
                            }) {
                                Image(systemName: isPaused ? "play.circle.fill" : "pause.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(.horizontal)
                        .offset(x: 0, y: 20)
                        
                        //Progress bar
                        GeometryReader { geometry in
                            HStack(spacing: 4) {
                                ForEach(0..<routine.poses.count, id: \.self) { index in
                                    Capsule()
                                        .fill(index < currentPoseIndex ? Color.orange :
                                                index == currentPoseIndex ? Color.red :
                                                Color.gray.opacity(0.3))
                                        .frame(height: 4)
                                }
                            }
                        }
                        .frame(height: 4)
                        .padding(.horizontal)
                        
                        Text("\(currentPose.sanskritName)")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text("\(currentPose.name)")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    }
                    
                    if currentPoseIndex < routine.poses.count {
                        let pose = routine.poses[currentPoseIndex]
                        
                        VStack {
                            Image(pose.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 600)
                                .cornerRadius(20)
                        }
                        .padding()
                    } else {
                        Text("Practice Complete!")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showPoseDetails = true
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .padding(.bottom, 100)
                                .padding(.trailing, 50)
                        }
                    }
                }
            }
            .sheet(isPresented: $showPoseDetails) {
                if currentPoseIndex < routine.poses.count {
                    YogaPoseView(pose: routine.poses[currentPoseIndex], showCloseButton: true)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width < 0 {
                            moveToNextPose()
                        } else if value.translation.width > 0 {
                            moveToPreviousPose()
                        }
                    }
            )
            .onAppear {
                if startImmediately {
                    startPractice()
                }
            }
            .onDisappear {
                stopPractice()
            }
    }

    func startPractice() {
        isPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                moveToNextPose()
            }
        }
        speakInstructions()
    }

    func pausePractice() {
        isPaused = true
        timer?.invalidate()
        timer = nil
        synthesizer.stopSpeaking(at: .immediate)
    }

    func moveToNextPose() {
        synthesizer.stopSpeaking(at: .immediate)
        if currentPoseIndex < routine.poses.count - 1 {
            currentPoseIndex += 1
            timeRemaining = 30
            if timer != nil {
                speakInstructions()
            }
        }
    }

    func moveToPreviousPose() {
        synthesizer.stopSpeaking(at: .immediate)
        if currentPoseIndex > 0 {
            currentPoseIndex -= 1
            timeRemaining = 30
            if timer != nil {
                speakInstructions()
            }
        }
    }

    func speakInstructions() {
        guard isVoiceOverEnabled else { return }
        let pose = routine.poses[currentPoseIndex]
        let speechText = """
        \(pose.sanskritName),\(pose.name).
        \(pose.instructions)
        """
        let utterance = AVSpeechUtterance(string: speechText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Specify language if needed
        synthesizer.speak(utterance)
    }
    
    func stopPractice() {
        timer?.invalidate()
        timer = nil
        synthesizer.stopSpeaking(at: .immediate)
        isPaused = true
    }
}


#Preview {
    let sampleRoutine = YogaRoutine(
        image: "SunSalutation",
        sanskritName: "Surya Namaskar",
        name: "Sun Salutation",
        duration: 6,
        posesNumber: 12,
        difficulty: .beginner,
        poses: [
            YogaPose(image: "Mountain", sanskritName: "Tadasana", name: "Mountain Pose", instructions: "Stand tall with feet together, shoulders relaxed, weight evenly distributed through your soles, arms at sides."),
            YogaPose(image: "UpwardSalute", sanskritName: "Urdhva Hastasana", name: "Upward Salute", instructions: "Inhale and extend your arms out to the sides and up toward the ceiling, palms facing each other."),
            YogaPose(image: "ForwardFold", sanskritName: "Uttanasana", name: "Standing Forward Bend", instructions: "Exhale and bend forward from the hip joints, bringing your hands to the floor or your legs.")
        ]
    )
    
    PracticeView(routine: sampleRoutine, startImmediately: true)
}
