//
//  EDMnewsModel.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import Foundation

struct EventSearchResponse: Codable {
    let data: [Event]
    let success: Bool
}

struct Event: Codable {
    let id: Int
    let link: String
    let name: String?
    let ages: String?
    let festivalInd: Bool
    let livestreamInd: Bool
    let electronicGenreInd: Bool
    let otherGenreInd: Bool
    let date: String
    let startTime: String?
    let endTime: String?
    let createdDate: String
    let venue: Venue
    let artistList: [Artist]
}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let location: String?
    let address: String?
    let state: String?
    let latitude: Double?
    let longitude: Double?
}

struct Artist: Codable {
    let id: Int
    let name: String?
    let link: String?
    let b2bInd: Bool
}

struct LocationSearchResponse: Codable {
    let data: [Location]
    let success: Bool
}

struct Location: Codable {
    let id: Int
    let city: String
    let state: String
    let stateCode: String
    let latitude: Double
    let longitude: Double
    let link: String
}

let apiKey = "23ad8b0a-746a-4ea3-8e6f-3222f51cd372"


