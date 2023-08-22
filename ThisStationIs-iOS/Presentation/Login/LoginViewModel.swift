//
//  LoginViewModel.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/26.
//

import Foundation

protocol LoginNavigation: AnyObject {
    func goToFindPassword()
    func goToRegister()
    func goToHome()
}

class LoginViewModel {
    weak var navigation: LoginNavigation!
    
    init(nav: LoginNavigation) {
        self.navigation = nav
    }
    
    func goToFindPassword(){
        navigation.goToFindPassword()
    }
    
    func goToRegister(){
        navigation.goToRegister()
    }
    
    func goToHome(){
        navigation.goToHome()
    }
    
    deinit {
        print("Deinit Login")
    }
}
