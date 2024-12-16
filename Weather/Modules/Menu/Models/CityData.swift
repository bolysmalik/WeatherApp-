import Foundation

struct CityData: Codable {
    let name: String
    let temperature: Int
    let icon: String
    var currentCity: Bool? = false
}
