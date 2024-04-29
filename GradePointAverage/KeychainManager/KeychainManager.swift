//
//  KeychainManager.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 27.04.24.
//

import Security
import Foundation

private extension Constants {
    static let keychainService = "com.gradepointaverage.service"
}

class KeychainManager {
    
    static func savePassword(account: String, password: String) -> Bool {
        let service = Constants.keychainService
        
        guard let passwordData = password.data(using: .utf8) else { return false }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]
        
        // Delete password if exist
        SecItemDelete(query as CFDictionary)
        
        // Add new password
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }
    
    static func getPassword(account: String) -> String? {
        let service = Constants.keychainService
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if status == noErr, let data = result as? Data, let password = String(data: data, encoding: .utf8) {
            return password
        } else {
            return nil
        }
    }
}
