//

import SwiftUI

struct RocketsListView: View {
    @StateObject var viewModel: RocketsListViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.model) { rocket in
                RocketView(rocket: rocket)
            }
            Spacer()
        }
        .padding()
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsListView(viewModel: RocketsListViewModel())
    }
}
