//
//  EmptyResponse.swift
//  Networking
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//


import Foundation
/// Empty response type for requests that don't return data
public struct EmptyResponse: Decodable {
    public init() {}
}
