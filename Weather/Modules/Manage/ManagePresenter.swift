import UIKit

protocol ManagePresentationLogic {
    func presentCityData(data: [CityData])
    func showAlert(message: String)
}

final class ManagePresenter: ManagePresentationLogic {
    weak var viewController: ManageDisplayLogic?
    
    func presentCityData(data: [CityData]) {
        viewController?.displayCityData(data: data)
    }
    
    func showAlert(message: String) {
        viewController?.displayAlert(message: message)
    }
}
