//
//  Coordinator.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/13.
//

import Foundation
import UIKit

enum CoordinatorType {
    case home, community, writting, history, my
    case login
    case tab
}

protocol CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

protocol Coordinator : AnyObject {
    /*
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
     */
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    init(_ navigationController: UINavigationController)
    
    func start()
    func finish()
    func findCoordinator(type: CoordinatorType) -> Coordinator?
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
    func findCoordinator(type: CoordinatorType) -> Coordinator? {
        var stack: [Coordinator] = [self]
        
        while !stack.isEmpty {
            let currentCoordinator = stack.removeLast()
            if currentCoordinator.type == type {
                return currentCoordinator
            }
            
            currentCoordinator.childCoordinators.forEach ({ child in
                stack.append(child)
            })
        }
        return nil
    }
}
