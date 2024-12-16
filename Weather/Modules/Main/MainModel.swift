import UIKit

class MainModel {
    struct DaylyModel {
        let day: String
        let humidity: Int
        let weatherImage: UIImage?
        let weatherNightImage: UIImage?
        let minTem: Int
        let maxTem: Int
    }
    
    struct CurrentWeather {
        let temp: String
        let cityName: String
        let appTemp: String
        let description: String
        let pres, windSpd: Double
    }
    
    struct HourlyModel {
        let hour: String
        let image: UIImage?
        let humidity: String
        let temp: String
    }
}
