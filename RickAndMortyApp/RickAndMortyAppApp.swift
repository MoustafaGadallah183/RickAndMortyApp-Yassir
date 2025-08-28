//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var dependencies = AppDependencies()
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharactersViewModel(coordinator: appCoordinator, repo: dependencies.characterssRepo))
                .environmentObject(appCoordinator)
                .environmentObject(dependencies)
        }
    }
}
