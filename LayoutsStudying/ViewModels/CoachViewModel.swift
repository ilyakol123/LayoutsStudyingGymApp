//
//  CoachViewModel.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import Foundation

@MainActor
class CoachViewModel: ObservableObject {
    @Published var coaches: [Coach] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadCoaches() async {
        isLoading = true
        do {
            let fetched = try await APIService.shared.fetchCoaches()
            self.coaches = fetched
        } catch {
            self.errorMessage = "Ошибка загрузки данных: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
