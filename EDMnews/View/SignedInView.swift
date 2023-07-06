//
//  SignedInView.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignedInView: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
    @StateObject var eventsViewModel: EventsViewModel = .init()
    var body: some View {
        NavigationView {
            List {
                ForEach(eventsViewModel.events, id: \.id) { event in
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 10){
                            Text(event.name ?? "")
                                .foregroundColor(.purple)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(event.date)
                                .foregroundColor(.gray)
                                .font(.callout)
                                .fontWeight(.bold)
                            Link(destination: URL(string: event.link)!, label: {
                                Text("Link to Event")
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            .task {
                eventsViewModel.fetchData()
            }
        }
    }
}

