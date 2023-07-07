//
//  ContainerViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 06/07/23.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState{
        case opened
        case closed
    }
    private var menuState: MenuState = .closed
    
    var homVC = HomeRouter.createModule()
//    var configurationVC = ConfigurationRouter.createModule()
//    var comentatioVC = ComentariosRouter.createModule()
    var navVC : UINavigationController?
    var menuVC = MenuOptionsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        var buttonDeteail = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .done, target: self, action: #selector(Detalles))
        navigationItem.leftBarButtonItem = buttonDeteail
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .systemGray
    }
    
    func setupUI(){
        
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        let navVC = UINavigationController(rootViewController: homVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
        
    }
    
    @objc func Detalles(){
        print("detalles")
        toggleMenu(completion: nil)
   
    }
    func toggleMenu(completion: (() -> Void)?) {
        
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut){
                
                self.navVC?.view.frame.origin.x = self.homVC.view.frame.size.width - 100
                //                self.navVC?.view.frame.origin.x =
                
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        case.opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut){
                
                self.navVC?.view.frame.origin.x = 0
                //                self.navVC?.view.frame.origin.x =
                
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
            
        }
        
    }
}
extension ContainerViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuOptionsViewController.MenuOptions) {
        print("celda seleccionada")
        toggleMenu { [weak self] in
            switch menuItem {
//            case .home:
//                let vc = HomeRouter.createModule()
//                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            case .Comentarios:
                let vc = ComentariosRouter.createModule()
                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            case .Configuracion:
                let vc = ConfigurationRouter.createModule()
                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            }
        }
    }
}
