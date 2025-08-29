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
        listView
    }
    
    
}

extension CharacterListView {
    
    private var listView: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            List {
                ForEach(viewModel.filteredCharacters) { character in
                    Button {
                        viewModel.navigateToDetail(for: character)
                    } label: {
                        CharacterCardView(character: character)
                            .onAppear {
                                viewModel.loadMoreIfNeeded(character)
                            }
                            .accessibilityIdentifier("CharacterRow_\(character.id ?? 0)") // <-- row identifier
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if viewModel.currentPage <= viewModel.totalPages {
                    if viewModel.isLoading, !viewModel.filteredCharacters.isEmpty {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                        .accessibilityIdentifier("LoadingRow") // <-- loading row identifier
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Characters")
            .searchable(text: $viewModel.searchText, prompt: "Search by name")
            .accessibilityIdentifier("CharactersList") // <-- list identifier
            .overlay(emptyView)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .characterDetail(let character):
                    CharacterDetailView(character: character)
                        .accessibilityIdentifier("CharacterDetail_\(character.id ?? 0)") // <-- detail view identifier
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
                .accessibilityIdentifier("EmptyStateView") // <-- empty state identifier
            }
        }
    }
}
