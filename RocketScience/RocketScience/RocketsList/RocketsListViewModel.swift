import Foundation

final class RocketsListViewModel: ObservableObject {
    var model: [RocketModel] = [
        RocketModel(name: "name1", height: 30, costPerLaunch: 20000, active: true, mass: 20),
        RocketModel(name: "name2", height: 39, costPerLaunch: 10000, active: false, mass: 300)
    ]
}
