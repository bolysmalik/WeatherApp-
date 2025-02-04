import Foundation
import Moya

final class ApiManager {
    
    static let shared = ApiManager()
    private let provider = MoyaProvider<WeatherAPI>()
    
    private init() {}
    
    func fetchHourlyForecast(cityName: String, 
                             completion: @escaping (Result<WelcomeHourly, Error>) -> Void) {
        provider.request(.fetchHourlyForecast(cityName: cityName)) { result in
            switch result {
            case .success(let response):
                do {
                    let forecastData = try response.map(WelcomeHourly.self)
                    completion(.success(forecastData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchHourlyForecasCordinate(lat: Double,
                                     long: Double,
                                     completion: @escaping (Result<WelcomeHourly, Error>) -> Void) {
        provider.request(.fetchHourlyForecastCordinate(lat: lat.description,
                                                       long: long.description)) { result in
            switch result {
            case .success(let response):
                do {
                    let forecastData = try response.map(WelcomeHourly.self)
                    completion(.success(forecastData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchWeeklyForecasCordinate(lat: Double,
                                     long: Double,
                                     completion: @escaping (Result<WelcomeWeekly, Error>) -> Void) {
        provider.request(.fetchWeeklyForecastCordinate(lat: lat.description,
                                                       long: long.description)) { result in
            switch result {
            case .success(let response):
                do {
                    let forecastData = try response.map(WelcomeWeekly.self)
                    completion(.success(forecastData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchWeeklyForecastData(for cityName: String, completion: @escaping (Result<WelcomeWeekly, Error>) -> Void) {
        provider.request(.fetchWeeklyForecast(cityName: cityName)) { result in
            switch result {
            case .success(let response):
                do {
                    let forecastData = try response.map(WelcomeWeekly.self)
                    completion(.success(forecastData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
