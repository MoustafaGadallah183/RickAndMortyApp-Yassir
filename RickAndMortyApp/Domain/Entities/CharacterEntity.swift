//
//  CharacterEntity.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//
import Foundation

struct CharacterBaseEntity {
    let results: [CharacterEntity]
    let info: Info?
    
}


struct CharacterEntity: Identifiable , Equatable, Hashable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct LocationEntity {
    let name: String?
    let url: String?
}


struct Info {
    let count: Int?
    let pages: Int?
    let next: String?
}
