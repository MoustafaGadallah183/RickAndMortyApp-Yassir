//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 05/03/1447 AH.
//

import Foundation
import Coordinator

@MainActor
@Observable
class CharactersViewModel {
    
    var coordinator: AppCoordinator
    private let getCharactersUseCase: CharactersUseCaseProtocol
    var charactersEntities: [CharacterEntity] = []
    var searchText: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    var currentPage = 1
    var totalPages = 1
    
    
    init(coordinator: AppCoordinator, repo: CharactesRepoProtocol) {
        self.coordinator = coordinator
        self.getCharactersUseCase = CharactersUseCase(repo: repo)
        
    }
    
    
    func loadCharacters() async {
        guard !isLoading, currentPage <= totalPages else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getCharactersUseCase.execute(pageNumber: currentPage)
            
            charactersEntities.append(contentsOf: response.results)
            currentPage += 1
            totalPages = response.info?.pages ?? 0
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    
    var filteredCharacters: [CharacterEntity] {
        let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        guard !searchText.isEmpty else { return charactersEntities }
        
        return charactersEntities.filter {
            ($0.name?.lowercased().replacingOccurrences(of: " ", with: "") ?? "")
                .contains(searchText.replacingOccurrences(of: " ", with: ""))
        }
    }
    
    
    func loadMoreIfNeeded(_ character: CharacterEntity) {
        if character == filteredCharacters.last {
            Task { await loadCharacters() }
        }
    }
    
    func navigateToDetail(for character: CharacterEntity) {
        coordinator.navigate(to: .characterDetail(character))
    }
    
}
