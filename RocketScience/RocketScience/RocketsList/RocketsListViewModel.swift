import Foundation
import SpaceXAPI

final class RocketsListViewModel: ObservableObject {
    @Published var model: [RocketsQuery.Data.Rocket] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?

    func fetchRockets() {
        isLoading = true
        let query = RocketsQuery()
        NetworkService.shared.apollo.fetch(query: query) { [weak self] result in
            self?.isLoading = false
            switch result {
            case.success(let data):
                self?.model = data.data?.rockets?.compactMap { $0 } ?? []
            case .failure:
                self?.alertItem = AlertContext.somethingWentWrong
            }
        }
    }
}
