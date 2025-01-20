//
//  StationListViewModel.swift
//  GraphQLTut
//
//  Created by Mahesh V on 1/17/25.
//

import Foundation
import Apollo
import GraphQLAPI

@MainActor	
class StationListViewModel: ObservableObject {
    @Published var stationList: [StationListQuery.Data.StationList] = []
    
    init() {
//        fetchGraphQuery()
    }
    
    func fetchGraphQuery() {
        Network.shared.apollo.fetch(query: StationListQuery()) { result in
            switch result {
            case .success(let graphResult):
                print("success result = \(graphResult)")
                if let stationConnnection = graphResult.data?.stationList {
                    print("station list = \(stationConnnection)")
                    self.stationList.append(contentsOf: stationConnnection.compactMap({ $0 }))
                }
            case .failure(let error):
                print("error = \(error)")
            }
        }
    }
    
    func address(of station: StationListQuery.Data.StationList) -> String {
        
        var fullAddress = ""
        if let address = station.address {
            fullAddress.append(address)
        }
        if let city = station.city {
            fullAddress.append(", \\(city)")
        }
        
        return fullAddress
    }
    
    func ownerName(of station: StationListQuery.Data.StationList) -> String {
        station.owner?.name ?? "Unknowed owner"
    }
}
