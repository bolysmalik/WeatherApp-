import UIKit

class ManageWorker {
    func fetchCityData() -> [CityData]? {
        let cityData = UserDefaultsManager.shared.getCityData()
        return cityData
    }
}
