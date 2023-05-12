import SwiftUI

struct RocketsListView: View {
    @StateObject var viewModel: RocketsListViewModel

    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.model, id: \.id) { rocket in
                        RocketView(rocket: rocket)
                            .padding([.top, .bottom])
                    }
                }
                Spacer()
            }
            .onAppear {
                viewModel.fetchRockets()
            }
            
            if viewModel.isLoading {
                ProgressView().scaleEffect(2)
            }
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsListView(viewModel: RocketsListViewModel())
    }
}
