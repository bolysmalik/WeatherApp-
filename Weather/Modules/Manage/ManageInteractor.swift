import UIKit

protocol ManageBusinessLogic {
    func getCitiData()
    func addNewCity(cityName: String)
}

protocol ManageDataStore {
}

final class ManageInteractor: ManageDataStore {
    var presenter: ManagePresentationLogic?
    var worker: ManageWorker?
}

// MARK: Do something
extension ManageInteractor: ManageBusinessLogic {
    func addNewCity(cityName: String) {
        let defaults = UserDefaultsManager.shared
        let cities = defaults.getCityData()
        var cityData = [CityData]()
        if let cities {
            cityData.append(contentsOf: cities)
        }
        
        if cityData.contains(where: { $0.name.lowercased() == cityName.lowercased() }) {
            print("City \(cityName) is already in the list.")
            presenter?.showAlert(message: "City \(cityName) is already in the list.")
            return
        }
        
        ApiManager.shared.fetchHourlyForecast(cityName: cityName) { result in
            switch result {
            case .success(let hourlyForecast):
                DispatchQueue.main.async {
                    let name = hourlyForecast.cityName
                    if let data = hourlyForecast.data.first {
                        cityData.append(CityData(name: name,
                                               temperature: Int(data.temp),
                                               icon: data.weather.icon))
                        self.presenter?.presentCityData(data: cityData)
                        defaults.saveCityData(data: cityData)
                    }
                }
            case .failure(let error):
                print("Error fetching hourly forecast: \(error)")
            }
        }
    }
    
    func getCitiData() {
        worker = ManageWorker()
        let cityData = worker?.fetchCityData()
        guard let cityData else {
            print("Error data")
            return
        }
        presenter?.presentCityData(data: cityData)
    }
}
