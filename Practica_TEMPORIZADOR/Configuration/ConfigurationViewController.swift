//
//  ConfigurationViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created Administrator on 06/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConfigurationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Protocol Properties
	var presenter: ConfigurationPresenterProtocol?

    //MARK: - Properties
    var opciones = ["Vibrar y Sonido", "Solo sonido", "Solo Vibrar"]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ConfigurationTableViewCell.self, forCellReuseIdentifier: "ConfigurationTableViewCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()
    
    //MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Configuration"
        view.backgroundColor = .systemOrange
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        view.backgroundColor = colorTableView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.reloadData()
    }
    
    //MARK: - Methods
}

//MARK: - View Methods
extension ConfigurationViewController: ConfigurationViewProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MenuOptions.allCases.count
        listTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfigurationTableViewCell", for: indexPath) as! ConfigurationTableViewCell
        let model = listTable[indexPath.row]
        var listContentfiguration = UIListContentConfiguration.cell()
        listContentfiguration.text = model.title
        listContentfiguration.image = UIImage(systemName: model.imageName)
        cell.contentConfiguration = listContentfiguration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

//MARK: - Private functions
extension ConfigurationViewController {
    

}
