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
    @StateObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
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
                                Link(destination: URL(string: event.link)!) {
                                    Text("Link to Event")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetListStyle())

                Divider()
                    .padding(.vertical)

                HStack {
                    Button(action: {
                        eventsViewModel.fetchEventsForLocation(locationID: 72)
                        // San Francisco location ID: 72
                    }) {
                        Text("San Francisco")
                    }
                    .padding(.horizontal)
                    .buttonStyle(BorderlessButtonStyle())

                    Button(action: {
                        eventsViewModel.fetchEventsForLocation(locationID: 73)
                        // Los Angeles location ID: 73
                    }) {
                        Text("Los Angeles")
                    }
                    .padding(.horizontal)
                    .buttonStyle(BorderlessButtonStyle())

                    Button(action: {
                        eventsViewModel.fetchEventsForLocation(locationID: 69)
                        // Las Vegas location ID: 69
                    }) {
                        Text("Las Vegas")
                    }
                    .padding(.horizontal)
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding()

            }
            .navigationBarTitle("Events")
        }
        .onAppear {
            eventsViewModel.fetchEvents()
        }
    }
}

//struct SignedInView: View {
//    @EnvironmentObject var signInViewModel: SignInViewModel
//    @StateObject var eventsViewModel = EventsViewModel()
//
//    @State private var city: String = ""
//    @State private var state: String = ""
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(eventsViewModel.events, id: \.id) { event in
//                        VStack(alignment: .leading) {
//                            VStack(alignment: .leading, spacing: 10){
//                                Text(event.name ?? "")
//                                    .foregroundColor(.purple)
//                                    .font(.title3)
//                                    .fontWeight(.bold)
//                                Text(event.date)
//                                    .foregroundColor(.gray)
//                                    .font(.callout)
//                                    .fontWeight(.bold)
//                                Link(destination: URL(string: event.link)!) {
//                                    Text("Link to Event")
//                                        .foregroundColor(.blue)
//                                }
//                            }
//                        }
//                    }
//                }
//                .listStyle(InsetListStyle())
//
//                Divider()
//                    .padding(.vertical)
//                HStack {
//                    Button(action: {
//                        eventsViewModel.fetchEventsForLocation(city: "San Francisco", state: "California")
//                    }) {
//                        Text("San Francisco")
//                    }
//                    .padding(.horizontal)
//                    .buttonStyle(BorderlessButtonStyle())
//
//                    Button(action: {
//                        eventsViewModel.fetchEventsForLocation(city: "Los Angeles", state: "California")
//                    }) {
//                        Text("Los Angeles")
//                    }
//                    .padding(.horizontal)
//                    .buttonStyle(BorderlessButtonStyle())
//
//                    Button(action: {
//                        eventsViewModel.fetchEventsForLocation(city: "Las Vegas", state: "Nevada")
//                    }) {
//                        Text("Las Vegas")
//                    }
//                    .padding(.horizontal)
//                    .buttonStyle(BorderlessButtonStyle())
//                }
//                .padding()
//
//            }
//            .navigationBarTitle("Events")
//        }
//        .onAppear {
//            eventsViewModel.fetchEvents()
//        }
//    }
//}
