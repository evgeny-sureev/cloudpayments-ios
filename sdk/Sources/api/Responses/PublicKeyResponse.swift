//
//  PublicKeyData.swift
//  Cloudpayments
//
//  Created by CloudPayments on 31.05.2023.
//

import Foundation

struct PublicKeyResponse: Codable {
    let Pem: String?
    let Version: Int?
    
    private static let key = "ApiURLKey"
    
    public var version: String { return String(Version ?? 0)}
    
    private static var publicKey: String { return "PublicBaseKey64"}
    
    public static var apiURL: String! {
        get {
            let url =  UserDefaults.standard.string(forKey: key) ?? "https://api.cloudpayments.ru/"
            return url
        }
        
        set {
            guard let newValue = newValue,
                  let api =  UserDefaults.standard.string(forKey: key),
                  api == newValue
            else {
                UserDefaults.standard.set(newValue, forKey: key)
                UserDefaults.standard.synchronize()
                updateData()
                return
            }
        }
    }
    
    public static var getValue: PublicKeyResponse? {
        guard let data = UserDefaults.standard.data(forKey: PublicKeyResponse.publicKey) else {
            PublicKeyRequest.updatePublicCryptoKey()
            return nil
        }
        guard let value = try? JSONDecoder().decode(PublicKeyResponse.self, from: data) else {
            return nil
        }
        
        return value
    }
    
    public func save() {
        let data = try? JSONEncoder().encode(self)
        UserDefaults.standard.set(data, forKey: PublicKeyResponse.publicKey)
        UserDefaults.standard.synchronize()
    }
    
    public static func updateData() {
        PublicKeyRequest.updatePublicCryptoKey()
    }
}
