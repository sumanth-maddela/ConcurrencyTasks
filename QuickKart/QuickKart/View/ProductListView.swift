//
//  ProductListView.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading products...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: product.image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(8)
                                    } else if phase.error != nil {
                                        Color.red.frame(width: 80, height: 80)
                                    } else {
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    }
                                }

                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .font(.headline)
                                    Text(String(format: "$%.2f", product.price))
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                    Text(product.description)
                                        .font(.caption)
                                        .lineLimit(2)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }                }
            }
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}
