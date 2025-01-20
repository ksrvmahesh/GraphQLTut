//
//  StationListView.swift
//  GraphQLTut
//
//  Created by Mahesh V on 1/17/25.
//

import SwiftUI

struct StationListView: View {
    @StateObject var viewModel = StationListViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(viewModel.stationList, id: \.self) { station in
                    Section {
                        Text("Owner name: " + viewModel.ownerName(of: station))
                            .fontWeight(.bold)
                        
                        Text("Address: " + viewModel.address(of: station))
                            .fontWeight(.light)
                    }
                }
            }
            
//            
//            List(viewModel.stationList, id:\.self) { station in
//                Section {
//                    Text("Owner name: " + viewModel.ownerName(of: station))
//                        .fontWeight(.bold)
//                    
//                    Text("Address: " + viewModel.address(of: station))
//                        .fontWeight(.light)
//                }
//            }
        }
        .task {
            viewModel.fetchGraphQuery()
        }
    }
}

#Preview {
    StationListView()
}
