//
//  CharacterCardView.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 05/03/1447 AH.
//

import SwiftUI

struct CharacterCardView: View {
    
    var character: CharacterEntity
    
    var body: some View {
        HStack(spacing: 16) {
            
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            
            
            VStack(alignment: .leading, spacing: 6) {
                Text(character.name ?? "Unknown")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(character.species ?? "Unknown")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
        )
        .padding(.vertical, 4)
    }
}
