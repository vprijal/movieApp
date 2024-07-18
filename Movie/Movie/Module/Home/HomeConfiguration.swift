//
//  HomeConfiguration.swift
//  Ichigo
//
//  Created by Ichigo iOS Team on 15/06/22.
//  

import UIKit

//MARK: Don't foget to register module on router
class HomeConfiguration {
    static func setup(parameters: [String: Any]) -> UIViewController {
        let controller = HomeViewController(parameters: parameters)
        
        return controller
    }
}