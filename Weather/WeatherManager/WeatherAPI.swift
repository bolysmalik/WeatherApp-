import Moya
import Foundation

enum WeatherAPI {
    case fetchHourlyForecast(cityName: String)
    case fetchWeeklyForecast(cityName: String)
    case fetchHourlyForecastCordinate(lat: String, long: String)
    case fetchWeeklyForecastCordinate(lat: String, long: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.weatherbit.io/v2.0")!
    }
    
    var path: String {
        switch self {
        case .fetchHourlyForecast:
            return "/forecast/hourly"
        case .fetchWeeklyForecast:
            return "/forecast/daily"
        case .fetchHourlyForecastCordinate:
            return "/forecast/hourly"
        case .fetchWeeklyForecastCordinate:
            return "/forecast/daily"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchHourlyForecast(let cityName), .fetchWeeklyForecast(let cityName):
            return .requestParameters(parameters:
                                        ["city": cityName,
                                         "key": "104e7f30bcf649499e39885c092dcb0e"],
                                      encoding: URLEncoding.default)
        case .fetchHourlyForecastCordinate(let lat, let long),
                .fetchWeeklyForecastCordinate(let lat, let long):
            return .requestParameters(parameters: ["lat": lat,
                                                   "lon": long,
                                                   "key": "104e7f30bcf649499e39885c092dcb0e"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
