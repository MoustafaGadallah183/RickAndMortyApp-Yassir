//
//  CharactedDetailsView.swift
//  RickAndMortyApp
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//
import SwiftUI

struct CharacterDetailView: View {
    let character: CharacterEntity
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                CharacterImageView(imageURL: character.image)
                
                CharacterNameView(name: character.name)
                
                CharacterInfoCard(character: character)
                
                Spacer()
            }
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}


private struct CharacterImageView: View {
    let imageURL: String?
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 220)
                .clipShape(Circle())
                .shadow(radius: 12)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .padding(.top, 20)
        } placeholder: {
            ProgressView()
                .frame(width: 220, height: 220)
        }
    }
}

private struct CharacterNameView: View {
    let name: String?
    
    var body: some View {
        Text(name ?? "Unknown")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

private struct CharacterInfoCard: View {
    let character: CharacterEntity
    
    var body: some View {
        VStack(spacing: 16) {
            InfoRow(title: "Species", value: character.species ?? "Unknown")
            InfoRow(title: "Status", value: character.status ?? "Unknown", valueColor: statusColor(character.status))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemGray6))
                .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 6)
        )
        .padding(.horizontal, 20)
    }
    
    private func statusColor(_ status: String?) -> Color {
        switch status?.lowercased() {
        case "alive": return .green
        case "dead": return .red
        default: return .gray
        }
    }
    
}

private struct InfoRow: View {
    
    let title: String
    let value: String
    var valueColor: Color = .primary
    
    var body: some View {
        HStack {
            Text(title + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundColor(valueColor)
                .fontWeight(.bold)
        }
    }
}
