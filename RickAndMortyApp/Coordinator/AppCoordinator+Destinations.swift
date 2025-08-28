//
//  AppCoordinator+Destinations.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 06/03/1447 AH.
//

import SwiftUI

extension AppCoordinator {
    
    @ViewBuilder
    func destination(for route: AppRoute) -> some View {
        switch route {
        case .characterDetail(let character):
            CharacterDetailView(character: character)
        }
    }
}
