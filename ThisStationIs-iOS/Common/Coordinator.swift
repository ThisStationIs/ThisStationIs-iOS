//
//  Coordinator.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/13.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}
