//
//  MenuOptionsViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 06/07/23.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject{
    func didSelect(menuItem: MenuOptionsViewController.MenuOptions)
}

class MenuOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: MenuViewControllerDelegate?
    
       let colorTableView = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    enum MenuOptions: String, CaseIterable {
//        case home = "Home"
        case Comentarios = "Comentarios"
        case Configuracion = "Configuracion"
        
        var imageName: String {
            switch self {
//            case .home:
//                return "house"
            case .Comentarios:
//                return "list.clipboard"
                return "pencil"
            case .Configuracion:
                return "gear"
            }
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = colorTableView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = colorTableView
        cell.contentView.backgroundColor = colorTableView
//        cell.textLabel?.text = "menu opciones"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
        print("celda seleccionada en::: \(indexPath.row)")
        print(item)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    @objc func prueba(){
        print("si funciona el boton")
    }
}

