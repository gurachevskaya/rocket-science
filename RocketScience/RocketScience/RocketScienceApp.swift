//

import SwiftUI
import SpaceXAPI

@main
struct RocketScienceApp: App {
    var body: some Scene {
        WindowGroup {
            RocketsListView(viewModel: RocketsListViewModel())
        }
    }
}
