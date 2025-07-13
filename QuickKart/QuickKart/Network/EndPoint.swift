//
//  EndPoint.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

extension Endpoint {
    var request: URLRequest {
        URLRequest(url: baseURL.appendingPathComponent(path))
    }
}

enum APIEndpoint: Endpoint {
    case products

    var baseURL: URL {
        URL(string: "https://fakestoreapi.com")!
    }

    var path: String {
        switch self {
        case .products: return "products"
        }
    }
}

