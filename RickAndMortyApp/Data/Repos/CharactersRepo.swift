//
//  CharactersRepo.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 05/03/1447 AH.
//

import Foundation
import Networking

class CharactersRepo: CharactesRepoProtocol {
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }
    
    
    func getcharacters(pageNumber: Int) async throws -> CharactersDTO {
        
        let endpoint = ApiEndpoint(
            path: ApiConstants.Paths.characters(pageNumber: pageNumber),
            method: .get,
            body: nil,
            queryItems: [
                URLQueryItem(name: "page", value: "\(pageNumber)")
            ]
        )
        return try await apiManager.request(endpoint, responseType: CharactersDTO.self)
        
    }
    
}
