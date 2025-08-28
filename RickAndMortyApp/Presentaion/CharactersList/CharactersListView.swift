//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//
import SwiftUI

struct CharacterListView: View {
    
    @State private var viewModel: CharactersViewModel

    
    init(viewModel: CharactersViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationStack(path: $viewModel.coordinator.path) {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.filteredCharacters) { character in
                        Button {
                            viewModel.navigateToDetail(for: character)
                        } label: {
                            CharacterCardView(character: character)
                                .onAppear {
                                    viewModel.loadMoreIfNeeded(character)
                                }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    if viewModel.currentPage <= viewModel.totalPages  {
                        
                        if viewModel.isLoading, !viewModel.filteredCharacters.isEmpty {
                            ProgressView()
                                .padding()
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Characters")
            .searchable(text: $viewModel.searchText, prompt: "Search by name")
            .overlay(emptyView)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .characterDetail(let character):
                    CharacterDetailView(character: character)
                }
            }
        }
        .task { await viewModel.loadCharacters() }
    }
    
    
    private var emptyView: some View {
        Group {
            if viewModel.filteredCharacters.isEmpty {
                ContentUnavailableView(
                    "No Characters",
                    systemImage: "person.3",
                    description: Text("Try searching again or check your connection.")
                )
            }
        }
    }
}
