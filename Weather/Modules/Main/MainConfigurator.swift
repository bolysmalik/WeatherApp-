import UIKit

final class MainConfigurator {
    
    static let shared = MainConfigurator()
    
    func configure(viewController: MainViewController) {
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}

