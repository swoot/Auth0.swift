//
//  AuthorizeInfo.swift
//  
//
//  Created by Petri Aura on 23.5.2022.
//

import Foundation

public struct AuthorizeInfo { // : Codable
    public let url: URL
    public let scheme: String
    public let redirectUri: String
    public let state: String
}
