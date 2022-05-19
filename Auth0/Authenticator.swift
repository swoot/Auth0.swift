//
//  Authenticator.swift
//  
//
//  Created by Petri Aura on 19.5.2022.
//

import Foundation

public struct Authenticator: Codable {
    
    /// what the type of this authencator is
    public let authenticatorType: String
    
    /// seeeecrets
    public let secret: String?

    /// uri for the barcode?
    public let barcodeUri: String?
    
    /// the recovery codes
    public let recoveryCodes: [String]?
    
    public let bindingMethod: String?

    public let oobCode: String?
    public let oobChannel: String?
    
    
    /// possible types for the authenticator
    public enum Types: String {
        case otp = "otp"
        case email = "email"
        case sms = "sms"
    }

    enum CodingKeys: String, CodingKey {
        case authenticatorType = "authenticator_type"
        case secret = "secret"
        case barcodeUri = "barcode_uri"
        case bindingMethod = "binding_method"
        case recoveryCodes = "recovery_codes"
        case oobCode = "oob_code"
        case oobChannel = "oob_channel"
    }
}
