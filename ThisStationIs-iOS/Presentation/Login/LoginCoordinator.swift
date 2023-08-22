//
//  LoginCoordinator.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/26.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        goToLogin()
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController()
        let loginViewModel = LoginViewModel.init(nav: self)
        
        loginViewController.viewModel = loginViewModel
        
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginNavigation {
    func goToFindPassword() { }
    
    func goToRegister() { }
    
    func goToHome() { }
    
    
}
