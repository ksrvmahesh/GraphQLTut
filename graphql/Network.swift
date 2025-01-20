//
//  Network.swift
//  GraphQLTut
//
//  Created by Mahesh V on 1/17/25.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo: ApolloClient = {
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: NetworkInterceptorProvider(store: ApolloStore()),
            endpointURL: URL(string: "https://api.chargetrip.io/graphql")!
        )
        return ApolloClient(networkTransport: networkTransport, store: ApolloStore())
    }()
}
