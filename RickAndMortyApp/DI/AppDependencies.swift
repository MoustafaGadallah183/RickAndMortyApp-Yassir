//
//  AppDependencies.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 05/03/1447 AH.
//

import SwiftUI
import Networking

class AppDependencies: ObservableObject {
    lazy var apiManager: ApiManagerProtocol = {
        ApiManager()
    }()
    
    lazy var characterssRepo: CharactesRepoProtocol = {
        CharactersRepo(apiManager: apiManager)
    }()
}
