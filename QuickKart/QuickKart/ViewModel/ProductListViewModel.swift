//
//  ProductListViewModel.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let networkManager: NetworkService

    init(networkManager: NetworkService = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            let products = try await networkManager.fetch([Product].self, from: APIEndpoint.products)
            self.products = products
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
