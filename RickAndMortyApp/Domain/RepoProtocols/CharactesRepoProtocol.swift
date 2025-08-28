//
//  CharactesRepoProtocol.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

import Foundation

protocol CharactesRepoProtocol {
    func getcharacters(pageNumber: Int) async throws -> CharactersDTO
}

