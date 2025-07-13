//
//  ProductDetail.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                    } else if phase.error != nil {
                        Color.red.frame(height: 200)
                    } else {
                        ProgressView()
                            .frame(height: 200)
                    }
                }

                Text(product.title)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(String(format: "$%.2f", product.price))
                    .font(.title3)
                    .foregroundColor(.green)

                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
