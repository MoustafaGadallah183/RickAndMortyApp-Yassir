//
//  ApiConstants.swift
//  Networking
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

import Foundation

public enum ApiConstants {
    /// Base URL for all API requests
    public static let baseURL = "https://rickandmortyapi.com"
    
    /// Common headers
    public enum Headers {
        public static let contentType = "Content-Type"
        public static let authorization = "Authorization"
        public static let accept = "Accept"
        public static let userAgent = "User-Agent"
    }
    
    /// Header values
    public enum HeaderValues {
        public static let applicationJson = "application/json"
        public static let bearer = "Bearer"
    }
    
    /// Timeout intervals
    public enum Timeout {
        public static let request: TimeInterval = 30
        public static let resource: TimeInterval = 60
    }
    
    /// API paths
    public enum Paths {
      public static func characters(pageNumber: Int) -> String {
            "/api/character"
        }
    }
}
