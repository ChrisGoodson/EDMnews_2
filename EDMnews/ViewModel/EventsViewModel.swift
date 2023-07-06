//
//  EventsViewModel.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import Foundation

class EventsViewModel: ObservableObject {
    
    
    @Published var events: [Event] = []
    let url = "https://edmtrain.com/api/events?client=23ad8b0a-746a-4ea3-8e6f-3222f51cd372"

    func fetchData() {
        guard let url = URL(string: url) else {return}
        let sess = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(EventSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    // limit to 10 events
                    self?.events = Array(response.data.prefix(10))
                }
            } catch {
                print("Error during JSON decoding:", error)
            }
        }
        sess.resume()
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

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
}

