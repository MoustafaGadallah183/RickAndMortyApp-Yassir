//
//  CharacterRowView.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 05/03/1447 AH.
//

import SwiftUI

struct CharacterRowView: View {
    let character: CharacterEntity
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Text(character.name ?? "Unknown")
                    .font(.headline)
                Text(character.species ?? "Unknown")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .contentShape(Rectangle())
    }
}

