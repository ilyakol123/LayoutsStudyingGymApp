//
//  CoachViewModel.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import Foundation


@Observable
class CoachViewModel: ObservableObject {
     var coaches: [Coach] = []
     var isLoading = false
     var errorMessage: String?

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
