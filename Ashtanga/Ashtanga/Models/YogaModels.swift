import Foundation

struct YogaPose: Identifiable {
    let id = UUID()
    let image: String
    let sanskritName: String
    let name: String
    let instructions: String
}

struct YogaRoutine: Identifiable {
    let id = UUID()
    let image: String
    let sanskritName: String
    let name: String
    let duration: Int
    let posesNumber: Int
    let difficulty: Difficulty
    let poses: [YogaPose]
}

enum Difficulty: String, CaseIterable {
    case beginner, intermediate, advanced
}

// MARK: - All Poses

// Sun Salutation Poses
let meditationPose = YogaPose(
    image: "Meditation",
    sanskritName: "Pranamasana",
    name: "Prayer Pose",
    instructions: "Stand tall with feet together. Bring palms together in front of the chest in a prayer position. This pose symbolizes gratitude and sets an intention for the practice."
)

let raisedArmsPose = YogaPose(
    image: "RaisedArms",
    sanskritName: "Hasta Uttanasana",
    name: "Raised Arms Pose",
    instructions: "Inhale and stretch arms upward and back, keeping the biceps close to the ears. This pose opens the chest and stretches the abdomen."
)

let handToFootPose = YogaPose(
    image: "HandToFoot",
    sanskritName: "Padahastasana",
    name: "Hand to Foot Pose",
    instructions: "Exhale and bend forward from the hips, bringing hands toward the feet. This pose stretches the hamstrings and spine."
)

let equestrianPose = YogaPose(
    image: "Equestrian",
    sanskritName: "Ashwa Sanchalanasana",
    name: "Equestrian Pose",
    instructions: "Inhale and step the right leg back, placing the knee on the floor. Keep the left foot between the hands and look forward. This pose stretches the hip flexors and opens the chest."
)

let downwardDogPose = YogaPose(
    image: "DownwardDog",
    sanskritName: "Adho Mukha Svanasana",
    name: "Downward-Facing Dog Pose",
    instructions: "Exhale and lift the hips, forming an inverted “V” shape. This pose stretches the hamstrings, calves, and spine while strengthening the arms."
)

let eightLimbedPose = YogaPose(
    image: "EightLimbed",
    sanskritName: "Ashtanga Namaskara",
    name: "Eight-Limbed Salutation",
    instructions: "Exhale and lower the knees, chest, and chin to the floor, keeping the hips lifted. The eight points of contact are the toes, knees, chest, chin, and palms."
)

let cobraPose = YogaPose(
    image: "Cobra",
    sanskritName: "Bhujangasana",
    name: "Cobra Pose",
    instructions: "Inhale and slide forward, lifting the chest while keeping the elbows slightly bent. This pose strengthens the spine and stretches the chest."
)

// Beginner Routine Poses
let mountainPose = YogaPose(
    image: "Mountain",
    sanskritName: "Tadasana",
    name: "Mountain Pose",
    instructions: "Stand tall with feet together, arms at the sides, and focus on your breath."
)

let catCowPose = YogaPose(
    image: "CatCow",
    sanskritName: "Marjaryasana-Bitilasana",
    name: "Cat-Cow Pose",
    instructions: "On hands and knees, alternate between arching your back (cow) and rounding it (cat)."
)

let childsPose = YogaPose(
    image: "ChildsPose",
    sanskritName: "Balasana",
    name: "Child's Pose",
    instructions: "Sit back on your heels and stretch your arms forward, resting your forehead on the mat."
)

let seatedTwistPose = YogaPose(
    image: "SeatedTwist",
    sanskritName: "Ardha Matsyendrasana",
    name: "Seated Twist",
    instructions: "Sit with one leg crossed over the other, and twist gently to one side."
)

let bridgePose = YogaPose(
    image: "Bridge",
    sanskritName: "Setu Bandhasana",
    name: "Bridge Pose",
    instructions: "Lie on your back, bend your knees, and lift your hips towards the ceiling."
)

// Intermediate Routine Poses
let warrior1Pose = YogaPose(
    image: "Warrior1",
    sanskritName: "Virabhadrasana I",
    name: "Warrior I Pose",
    instructions: "Step one foot forward, bend the front knee, and raise your arms overhead."
)

let trianglePose = YogaPose(
    image: "Triangle",
    sanskritName: "Trikonasana",
    name: "Triangle Pose",
    instructions: "Extend one arm towards the ground and the other to the sky while keeping both legs straight."
)

let chairPose = YogaPose(
    image: "Chair",
    sanskritName: "Utkatasana",
    name: "Chair Pose",
    instructions: "Bend your knees as if sitting in a chair while keeping your arms raised."
)

let boatPose = YogaPose(
    image: "Boat",
    sanskritName: "Navasana",
    name: "Boat Pose",
    instructions: "Sit and balance on your sit bones, lifting your legs and keeping your back straight."
)

// Advanced Routine Poses
let crowPose = YogaPose(
    image: "Crow",
    sanskritName: "Bakasana",
    name: "Crow Pose",
    instructions: "Balance on your hands with knees resting on your upper arms."
)

let wheelPose = YogaPose(
    image: "Wheel",
    sanskritName: "Urdhva Dhanurasana",
    name: "Wheel Pose",
    instructions: "Lie on your back and press up into a full backbend."
)

let kingPigeonPose = YogaPose(
    image: "KingPigeon",
    sanskritName: "Kapotasana",
    name: "King Pigeon Pose",
    instructions: "Bend one leg forward and the other backward while arching your back and reaching for your foot."
)

let sidePlankPose = YogaPose(
    image: "SidePlank",
    sanskritName: "Vasisthasana",
    name: "Side Plank Pose",
    instructions: "Balance on one hand and the side of your foot, lifting your other arm to the sky."
)

let headstandPose = YogaPose(
    image: "Headstand",
    sanskritName: "Sirsasana",
    name: "Headstand",
    instructions: "Balance upside down on your head and forearms, with legs extended upward."
)

// Master List of All Poses
let allPoses: [YogaPose] = [
    meditationPose,
    raisedArmsPose,
    handToFootPose,
    equestrianPose,
    downwardDogPose,
    eightLimbedPose,
    cobraPose,
    mountainPose,
    catCowPose,
    childsPose,
    seatedTwistPose,
    bridgePose,
    warrior1Pose,
    trianglePose,
    chairPose,
    boatPose,
    crowPose,
    wheelPose,
    kingPigeonPose,
    sidePlankPose,
    headstandPose
]

// MARK: - Yoga Routines

// Sun Routine
let SunRoutine = YogaRoutine(
    image: "Sun",
    sanskritName: "Surya Namaskar",
    name: "Sun Salutation",
    duration: 6,
    posesNumber: 12,
    difficulty: .beginner,
    poses: [
        meditationPose,
        raisedArmsPose,
        handToFootPose,
        equestrianPose,
        downwardDogPose,
        eightLimbedPose,
        cobraPose,
        downwardDogPose,
        equestrianPose,
        handToFootPose,
        raisedArmsPose,
        meditationPose
    ]
)

// Beginner Routine
let beginnerRoutine = YogaRoutine(
    image: "BeginnerRoutine",
    sanskritName: "Arambha Yoga",
    name: "Beginner",
    duration: 10,
    posesNumber: 20,
    difficulty: .beginner,
    poses: Array(repeating: [
        mountainPose,
        catCowPose,
        childsPose,
        seatedTwistPose,
        bridgePose
    ].flatMap { $0 }, count: 4).flatMap { $0 } // Repeats the 5 poses 4 times
)

// Intermediate Routine
let intermediateRoutine = YogaRoutine(
    image: "IntermediateRoutine",
    sanskritName: "Madhya Yoga",
    name: "Intermediate",
    duration: 15,
    posesNumber: 30,
    difficulty: .intermediate,
    poses: Array(repeating: [
        warrior1Pose,
        trianglePose,
        cobraPose,
        chairPose,
        boatPose
    ].flatMap { $0 }, count: 6).flatMap { $0 } // Repeats the 5 poses 6 times
)

// Advanced Routine
let advancedRoutine = YogaRoutine(
    image: "AdvancedRoutine",
    sanskritName: "Unnata Yoga",
    name: "Yogi Master",
    duration: 20,
    posesNumber: 40,
    difficulty: .advanced,
    poses: Array(repeating: [
        crowPose,
        wheelPose,
        kingPigeonPose,
        sidePlankPose,
        headstandPose
    ].flatMap { $0 }, count: 8).flatMap { $0 } // Repeats the 5 poses 8 times
)
