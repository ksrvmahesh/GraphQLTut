//
//  AuthorizationInterceptor.swift
//  GraphQLTut
//
//  Created by Mahesh V on 1/17/25.
//
import Foundation
import Apollo

class AuthorizationInterceptor: ApolloInterceptor {
    public var id: String = UUID().uuidString
    
    func interceptAsync<Operation>(chain: any Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, any Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        let keys = AuthorizationKeys(
            clientID: "<CLIENT_ID>",
            appID: "<APP_ID>"
        )

        request.addHeader(name: keys.clientID.name, value: keys.clientID.value)
        request.addHeader(name: keys.appID.name, value: keys.appID.value)

        chain.proceedAsync(request: request,
                           response: response,
                           interceptor: self,
                           completion: completion)
    }
    
    // Any custom interceptors you use are required to be able to identify themselves through an id property.

}
