import UIKit
import SnapKit

final class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    var homeVC = MainViewController()
    
    var navVC: UINavigationController?
    var centerController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        addChildVC()
    }
    
    func addChildVC() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        menuVC.menuDelegate = self
        
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        homeVC.delegate = self
        self.navVC = navVC
    }

}

extension ContainerViewController: HomeViewControllerDelegate {
    func menuButtonDidTapped() {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .curveEaseOut) {
                self.navVC?.view.frame.origin.x = (self.navVC?.view.frame.size.width)! - 80
                self.menuVC.view.frame.origin.x = 0
            } completion: { done in
                if done {
                    self.menuState = .opened
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .curveEaseOut) {
                self.navVC?.view.frame.origin.x = 0
                self.menuVC.view.frame.origin.x = (self.navVC?.view.frame.origin.x ?? 0) - self.menuVC.view.frame.size.width
            } completion: { done in
                if done {
                    self.menuState = .closed
                }
            }
        }
        menuVC.viewWillAppear(true)
    }
}

extension ContainerViewController: ManageDelegate {
    func didTapped() {
        let vc = ManageViewController()
        menuState = .opened
        homeVC.navigationController?.pushViewController(vc, animated: false)
        menuButtonDidTapped()
    }
}

extension ContainerViewController: MenuDelegate {
    func didSelectMenuItem(city: String) {
        homeVC.viewWillAppear(true)
        menuState = .opened
        menuButtonDidTapped()
    }
}
