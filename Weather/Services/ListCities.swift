import Foundation

class ListCities {
    
    private var defaults = UserDefaultsManager.shared
    static let shared = ListCities()
    
    public func getListCities() -> [CityData] {
        if let cityData = defaults.getCityData() {
            return cityData
        }
        return []
    }
}
