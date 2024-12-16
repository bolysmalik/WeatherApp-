import UIKit

@objc protocol ManageRoutingLogic {
    
}

protocol ManageDataPassing {
    var dataStore: ManageDataStore? { get }
}

final class ManageRouter: NSObject, ManageRoutingLogic, ManageDataPassing {
    weak var viewController: ManageViewController?
    var dataStore: ManageDataStore?
    
}
