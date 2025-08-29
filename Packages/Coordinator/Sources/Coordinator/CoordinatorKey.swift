//
//  CoordinatorKey.swift
//  Coordinator
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

import SwiftUI
public extension View {
    /// Inject a coordinator into the view hierarchy
    @available(macOS 14.0, *)
    func coordinator<Route: Hashable>(_ coordinator: BaseCoordinator<Route>) -> some View {
        self.environment(coordinator)
    }
}

// MARK: - Environment Key

private struct CoordinatorKey<Route: Hashable>: EnvironmentKey {
    static var defaultValue: BaseCoordinator<Route>? { nil }
}

public extension EnvironmentValues {
    /// Access coordinator from environment
    func coordinator<Route: Hashable>(_ type: Route.Type) -> BaseCoordinator<Route>? {
        self[CoordinatorKey<Route>.self]
    }
}
