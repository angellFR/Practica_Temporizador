//
//  HomeRouter.swift
//  Practica_TEMPORIZADOR
//
//  Created Administrator on 05/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeRouter {
    //MARK: - Protocol Properties
    weak var viewController: UIViewController?
    
    //MARK: - Static Methods
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewController(nibName: nil, bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

//MARK: - Router Metods
extension HomeRouter: HomeWireframeProtocol {
    
}

//MARK: - Private functions
extension HomeRouter {
    
}
