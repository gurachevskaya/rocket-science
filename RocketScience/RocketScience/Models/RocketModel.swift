import Foundation

struct RocketModel: Identifiable {
    var id = UUID()
    var name: String
    var height: Double
    var costPerLaunch: Int
    var active: Bool
    var mass: Double
}
