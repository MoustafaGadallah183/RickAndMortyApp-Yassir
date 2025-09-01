

# Rick & Morty App 🛸✨

<p align="center">  
   <img src="https://github.com/user-attachments/assets/41e78468-9df0-4aa3-858b-d343f421e177" width="200" />  
   <img src="https://github.com/user-attachments/assets/220d334e-f809-4a44-9d6f-5d74f3d68341" width="200" />  
</p>  

**Rick & Morty Explorer** is a modern iOS app built with **SwiftUI**, **Clean Architecture**, and **Swift Concurrency**. Explore, search, and view detailed profiles of characters from the Rick & Morty universe. The app is designed for **maintainability, testability, and smooth performance**.

---

## 🚀 Features

* **Browse Characters**: Clean, scrollable list using `List`
* **Search & Filter**: Live search for characters by name
* **Character Detail View**: Status, species, origin, and other details
* **Pagination**: Dynamic load more while scrolling
* **Modular Design**: Networking and Coordinator implemented as local Swift Packages for reusability and separation of concerns
* **Swift Concurrency**: `async/await` for network calls
* **Clean Architecture**: MVVM + Coordinator for organized, maintainable code
* **Dependency Injection**: Easily swap repositories and coordinators for testing
* **Unit & UI Tests**: Covers UI flows (list, detail, search)

---

## 🏗 Architecture

This project follows **Clean Architecture principles** combined with the **MVVM (Model–View–ViewModel) pattern** for a scalable, testable, and maintainable structure.

### 🧩 Clean Architecture

Clean Architecture ensures separation of concerns and enforces strict boundaries between layers:

```text
                   ┌───────────────────────────┐
                   │        Presentation        │
                   │   (SwiftUI + ViewModels)   │
                   │ ───────────────────────── │
                   │  * CharacterListView       │
                   │  * CharacterDetailView     │
                   │  * CharactersViewModel     │
                   │  * Coordinator (Package)   │
                   └──────────────▲────────────┘
                                  │
                                  │ calls UseCases
                                  │
                   ┌──────────────┴─────────────┐
                   │          Domain             │
                   │ ───────────────────────── │
                   │  * Entities (Character)    │
                   │  * Repo Protocols          │
                   │  * UseCases                │
                   │    - FetchCharacters       │
                   └──────────────▲────────────┘
                                  │
                                  │ implemented by
                                  │
                   ┌──────────────┴─────────────┐
                   │            Data             │
                   │ ───────────────────────── │
                   │  * Repository              │
                   │    - CharactersRepository  │
                   │  * Models (DTOs)           │
                   │  * Networking (Package)    │
                   └────────────────────────────┘
```

### 🔑 Interaction Flow

1. **Presentation Layer (SwiftUI + ViewModel + Coordinator)**

   * Handles **UI state** and **navigation**
   * Calls **Use Cases** from the Domain layer

2. **Domain Layer**

   * Defines **Entities**, **Protocols**, and **Use Cases**
   * Enforces **business rules** independent of frameworks

3. **Data Layer**

   * Implements repository protocols from Domain
   * Uses **Networking Package** for API requests
   * Maps **DTOs → Entities**

---

## 💻 Tech Stack

* Swift 5.x & SwiftUI
* Swift Concurrency (`async/await`)
* MVVM + Coordinator + Clean Architecture
* REST API Integration
* Unit & UI Testing with XCTest

---

## 🧪 Testing

### UI Tests

* `CharacterListUITests.swift`
  Tests UI flows such as:

- Characters list existence
- Row tap navigates to detail
- Search functionality filters results

---

## 🗂 Project Structure

```
RickAndMortyApp
├── Domain
│   ├── Entities
│   │   └── CharacterEntity.swift
│   ├── RepoProtocols
│   │   └── CharactesRepoProtocol.swift
│   └── UseCases
│       └── CharactersUseCase.swift
│
├── DI
│   └── AppDependencies.swift
│
├── Data
│   ├── Repository
│   │   └── CharactersRepository.swift
│   └── Models
│       └── CharacterDTO.swift
│
├── Presentation
│   ├── Views
│   │   ├── CharacterListView.swift
│   │   ├── CharacterCardView.swift
│   │   ├── CharacterDetailView.swift
│   │   └── CharacterRowView.swift
│   ├── ViewModels
│   │   └── CharactersViewModel.swift
│
├── Resources
│   └── Assets.xcassets
│
├── Tests
│   ├── RickAndMortyAppTests
│   │   └── CharactersViewModelTests.swift
│   └── RickAndMortyAppUITests
│       └── CharacterListUITests.swift
│
└── README.md
```

---

## 📦 Local Swift Packages

This project includes two **local Swift Packages** for modularity and reuse:

### 1️⃣ Coordinator

* Handles **navigation logic** and **app routing**
* Encapsulates the **Coordinator pattern**, supporting `NavigationStack` in SwiftUI
* Platform support: **iOS 17+, macOS 14+**

### 2️⃣ Networking

* Provides **network layer functionality** for API calls
* Handles **HTTP requests, decoding, and error handling**
* Platform support: **iOS 17+**

---

## ✨ Screenshots

| Characters List                                                                          | Character Detail                                                                           |
| ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![List](https://github.com/user-attachments/assets/41e78468-9df0-4aa3-858b-d343f421e177) | ![Detail](https://github.com/user-attachments/assets/220d334e-f809-4a44-9d6f-5d74f3d68341) |

---

