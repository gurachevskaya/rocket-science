import SwiftUI

struct RocketsListView: View {
    @StateObject var viewModel: RocketsListViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.model, id: \.id) { rocket in
                            NavigationLink(value: RocketsRoute.launches(rocket)) {
                                RocketView(rocket: rocket)
                                    .padding([.top, .bottom])
                            }
                        }
                    }
                    Spacer()
                }
                
                if viewModel.isLoading {
                    ProgressView().scaleEffect(2)
                }
            }
            .onAppear {
                viewModel.fetchRockets()
            }
            .navigationDestination(for: RocketsRoute.self) { route in
                route.view()
            }
            .alert(item: $viewModel.alertItem) { item in
                Alert(title: item.title,
                      message: item.message,
                      dismissButton: item.dismissButton)
            }
        }
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsListView(viewModel: RocketsListViewModel())
    }
}
