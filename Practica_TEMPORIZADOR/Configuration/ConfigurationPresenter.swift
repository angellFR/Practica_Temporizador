//
//  ConfigurationPresenter.swift
//  Practica_TEMPORIZADOR
//
//  Created Administrator on 06/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConfigurationPresenter {
    //MARK: - Protocol Properties
    weak private var view: ConfigurationViewProtocol?
    var interactor: ConfigurationInteractorProtocol?
    private let router: ConfigurationWireframeProtocol

    //MARK: - Life Cycle
    init(interface: ConfigurationViewProtocol, interactor: ConfigurationInteractorProtocol?, router: ConfigurationWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - Presenter Methods
extension ConfigurationPresenter: ConfigurationPresenterProtocol {
    
}

//MARK: - Private functions
extension ConfigurationPresenter {
    
}
