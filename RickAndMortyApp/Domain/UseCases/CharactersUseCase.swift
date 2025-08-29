//
//  CharactersUseCase.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

protocol CharactersUseCaseProtocol {
    func execute(pageNumber: Int) async throws -> CharacterBaseEntity
}

class CharactersUseCase: CharactersUseCaseProtocol {
    
    private let repo: CharactesRepoProtocol
    
    init(repo: CharactesRepoProtocol) {
        self.repo = repo
        
    }
    
    func execute(pageNumber: Int = 1) async throws -> CharacterBaseEntity {
        let response = try await repo.getcharacters(pageNumber: pageNumber)
        return response.mapToEntity()
    }
}
