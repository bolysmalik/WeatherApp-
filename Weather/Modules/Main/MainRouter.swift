import UIKit

@objc protocol MainRoutingLogic {
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
}
