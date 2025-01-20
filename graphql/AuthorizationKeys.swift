//
//  AuthorizationKeys.swift
//  GraphQLTut
//
//  Created by Mahesh V on 1/17/25.
//
import Foundation

struct AuthorizationKeys {
    let clientID: XClientID
    let appID: XAppID
    
    init(clientID: String, appID: String) {
        self.clientID = .init(value: clientID)
        self.appID = .init(value: appID)
    }
    
    struct XClientID {
        let name = "x-client-id"
        let value: String
    }
    
    struct XAppID {
        let name = "x-app-id"
        let value: String
    }
}
