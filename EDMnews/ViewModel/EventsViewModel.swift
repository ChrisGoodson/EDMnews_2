//
//  EventsViewModel.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []

    
    func fetchEvents() {
        let eventSearchURL = URL(string: "https://edmtrain.com/api/events?client=\(apiKey)")!
        let eventSearchTask = URLSession.shared.dataTask(with: eventSearchURL) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let eventSearchResponse = try decoder.decode(EventSearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.events = Array(eventSearchResponse.data.prefix(20))
                    }
                } catch {
                    print("Error decoding event search response: \(error)")
                }
            } else if let error = error {
                print("Error making event search request: \(error)")
            }
        }
        eventSearchTask.resume()
    }
    
    func fetchEventsForLocation(locationID: Int) {
            let eventsURLString = "https://edmtrain.com/api/events?locationIds=\(locationID)&client=\(apiKey)"
            guard let eventsURL = URL(string: eventsURLString) else {
                print("Invalid events URL.")
                return
            }

            let eventsTask = URLSession.shared.dataTask(with: eventsURL) { [weak self] (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let eventSearchResponse = try decoder.decode(EventSearchResponse.self, from: data)
                        DispatchQueue.main.async {
                            self?.events = eventSearchResponse.data
                        }
                    } catch {
                        print("Error decoding events response:", error)
                    }
                } else if let error = error {
                    print("Error making events request: \(error)")
                }
            }

            eventsTask.resume()
        }
    }





//import Foundation
//
//class EventsViewModel: ObservableObject {
//    @Published var events: [Event] = []
//
//    func fetchData() {
//        guard let url = URL(string: "https://edmtrain.com/api/events?client=23ad8b0a-746a-4ea3-8e6f-3222f51cd372") else {
//            return
//        }
//
//        let session = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let response = try JSONDecoder().decode(EventSearchResponse.self, from: data)
//                DispatchQueue.main.async {
//                    self?.events = Array(response.data.prefix(20))
//                }
//            } catch {
//                print("Error during JSON decoding:", error)
//            }
//        }
//
//        session.resume()
//    }
//
//    func fetchNewData(forCity city: String, state: String) {
//        let clientAPIKey = "23ad8b0a-746a-4ea3-8e6f-3222f51cd372"
//        let locationsURLString = "https://edmtrain.com/api/locations?state=\(state)&city=\(city)&client=\(clientAPIKey)"
//
//        guard let locationsURL = URL(string: locationsURLString) else {
//            print("Invalid locations URL.")
//            return
//        }
//
//        let locationsTask = URLSession.shared.dataTask(with: locationsURL) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                print("Error retrieving locations:", error?.localizedDescription ?? "Unknown error")
//                return
//            }
//
//            do {
//                let response = try JSONDecoder().decode(LocationSearchResponse.self, from: data)
//                if let location = response.data.first {
//                    let locationId = location.id
//                    let eventsURLString = "https://edmtrain.com/api/events?locationIds=\(locationId)&client=\(clientAPIKey)"
//
//                    guard let eventsURL = URL(string: eventsURLString) else {
//                        print("Invalid events URL.")
//                        return
//                    }
//
//                    let eventsTask = URLSession.shared.dataTask(with: eventsURL) { [weak self] data, _, error in
//                        guard let data = data, error == nil else {
//                            print("Error retrieving events:", error?.localizedDescription ?? "Unknown error")
//                            return
//                        }
//
//                        do {
//                            let response = try JSONDecoder().decode(EventSearchResponse.self, from: data)
//                            DispatchQueue.main.async {
//                                self?.events = Array(response.data.prefix(20))
//                            }
//                        } catch {
//                            print("Error during JSON decoding:", error)
//                        }
//                    }
//
//                    eventsTask.resume()
//                }
//            } catch {
//                print("Error during JSON decoding:", error)
//            }
//        }
//
//        locationsTask.resume()
//    }
//


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//    var events: [Event] = []
//    var locations: [Location] = []
//
//    func fetchEvents() {
//        // Example request using Event Search API
//        let eventSearchURL = URL(string: "https://edmtrain.com/api/events?client=\(apiKey)")!
//        let eventSearchTask = URLSession.shared.dataTask(with: eventSearchURL) { (data, response, error) in
//            // Handle the response and parse the data using JSONDecoder
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let eventSearchResponse = try decoder.decode(EventSearchResponse.self, from: data)
//                    // Process the eventSearchResponse data
//                    print(eventSearchResponse)
//                } catch {
//                    print("Error decoding event search response: \(error)")
//                }
//            } else if let error = error {
//                print("Error making event search request: \(error)")
//            }
//        }
//        eventSearchTask.resume()
//    }
//
//    func fetchLocations() {
//        // Example request using Locations API
//        let locationsURL = URL(string: "https://edmtrain.com/api/locations?client=\(apiKey)")!
//        let locationsTask = URLSession.shared.dataTask(with: locationsURL) { (data, response, error) in
//            // Handle the response and parse the data using JSONDecoder
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let locationSearchResponse = try decoder.decode(LocationSearchResponse.self, from: data)
//                    // Process the locationSearchResponse data
//                    print(locationSearchResponse)
//                } catch {
//                    print("Error decoding location search response: \(error)")
//                }
//            } else if let error = error {
//                print("Error making location search request: \(error)")
//            }
//        }
//        locationsTask.resume()
//    }

