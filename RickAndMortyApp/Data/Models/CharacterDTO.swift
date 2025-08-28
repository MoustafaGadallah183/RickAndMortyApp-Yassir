//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

import Foundation


struct CharactersDTO: Codable {
    let results: [CharacterDTO]
    let info: InfoDTO?
    
    func mapToEntity() -> CharacterBaseEntity {
        CharacterBaseEntity(results: results.map { $0.mapToEntity() },
                            info: info?.mapToEntity())
    }
    
}

struct CharacterDTO: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: LocationDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    func mapToEntity() -> CharacterEntity {
        CharacterEntity(
            id: id ?? 0,
            name: name ?? "",
            status: status ?? "",
            species: species ?? "",
            type: type ?? "",
            gender: gender ?? "",
            image: image ?? "",
            episode: episode ?? [],
            url: url ?? "",
            created : created ?? ""
        )
    }
    
}

struct LocationDTO: Codable {
    let name: String?
    let url: String?
}


struct InfoDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    
    func mapToEntity() -> Info {
        Info(count: count ,
             pages: pages,
             next: next)
    }
}
