import UIKit

class ManageConfigurator {
    
    static let shared = ManageConfigurator()
    
    func configure(viewController: ManageViewController) {
        let interactor = ManageInteractor()
        let presenter = ManagePresenter()
        let router = ManageRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}

