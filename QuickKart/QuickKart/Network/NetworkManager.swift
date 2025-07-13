//
//  NetworkManager.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import Foundation

protocol NetworkService {
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T
}

enum NetworkError: Error{
    case invalidResponse
    case decodingError
    case unknown(Error)
}

final class NetworkManager: NetworkService {
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        let request = endpoint.request

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidResponse
            }

            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
