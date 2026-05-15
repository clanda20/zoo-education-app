//
//  AnimalLocation.swift
//  Zoo
//
//  Created by christian landa on 12/1/23.
//

import Foundation
import MapKit

class AnimalLocation: Codable, Identifiable {
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static func loadAll(
        from bundle: Bundle = .main,
        resourceName: String = "animals"
    ) -> [AnimalLocation] {
        guard let url = bundle.url(forResource: resourceName, withExtension: "json") else {
            assertionFailure("Missing \(resourceName).json in app bundle")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([AnimalLocation].self, from: data)
        } catch {
            assertionFailure("Could not decode \(resourceName).json: \(error)")
            return []
        }
    }
}
