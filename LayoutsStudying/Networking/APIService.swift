//
//  APIService.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import Foundation

class APIService {
    static let shared = APIService()

    func fetchCoaches() async throws -> [Coach] {
        guard
            let url = URL(
                string:
                    "https://d3534fbd-f4c9-47e0-bb7c-543e41c51d83.mock.pstmn.io/coaches"
            )
        else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }

        let coaches = try JSONDecoder().decode([Coach].self, from: data)
        return coaches
    }
}
