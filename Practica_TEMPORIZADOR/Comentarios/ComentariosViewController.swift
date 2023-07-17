//
//  ComentariosViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created Administrator on 06/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ComentariosViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Protocol Properties
	var presenter: ComentariosPresenterProtocol?

    //MARK: - Properties
    private var labelName: UILabel = {
        let label = UILabel()
        label.text = "Nombre: "
        return label
    }()
    
    private var labelComentarios: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    
    private var texfieldName: UITextField = {
        let textfield = UITextField()
        textfield.layer.backgroundColor = UIColor.systemOrange.cgColor
        textfield.placeholder = " Escribe tu Nombre"
        return textfield
    }()
    
    private var texfieldComentarios: UITextField = {
        let textfield = UITextField()
        textfield.layer.backgroundColor = UIColor.white.cgColor
        textfield.layer.cornerRadius = 20
        textfield.textAlignment = .left
        textfield.textColor = .black
        return textfield
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .white
        return imageView
    }()
    
    private var buttonSave: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.systemGreen.cgColor
        button.layer.cornerRadius = 20
        button.setTitle("Guardar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comentarios"
        view.backgroundColor = .systemOrange
        setupUI()
        datosGuardados()
    }
    
    //MARK: - Methods
    func setupUI(){
        view.addSubview(imageView)
        imageView.addAnchorsAndCenter(centerX: true, centerY: false, width: 130, height: 130, left: nil, top: 90, right: nil, bottom: nil)
        
        view.addSubview(texfieldName)
        texfieldName.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 50, right: 10, bottom: nil,withAnchor: .top,relativeToView: imageView)
        
        view.addSubview(labelComentarios)
        labelComentarios.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 20, right: 10, bottom: nil,withAnchor: .top,relativeToView: texfieldName)
        
        view.addSubview(texfieldComentarios)
        texfieldComentarios.addAnchorsAndSize(width: nil, height: nil, left: 5, top: 20, right: 5, bottom: 90,withAnchor: .top,relativeToView: labelComentarios)
        
        view.addSubview(buttonSave)
        buttonSave.addAnchorsAndSize(width: nil, height: 45, left: 30, top: 30, right: 30, bottom: nil, withAnchor: .top,relativeToView: texfieldComentarios)
        
        self.texfieldName.delegate = self
        self.texfieldComentarios.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
        
    }
}

//MARK: - View Methods
extension ComentariosViewController: ComentariosViewProtocol {
    func datosGuardados(){
        if let preference = UserDefaults.standard.string(forKey: "comentariosname") {
            texfieldName.text = preference
            }
        if let preference = UserDefaults.standard.string(forKey: "comentarios") {
            texfieldComentarios.text = preference
            }
    }
}

//MARK: - Private functions
extension ComentariosViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        texfieldName.resignFirstResponder()
        texfieldComentarios.resignFirstResponder()
        return false
    }
    
    @objc func saveButton(){
        UserDefaults.standard.set(texfieldName.text, forKey: "comentariosname")
        UserDefaults.standard.set(texfieldComentarios.text, forKey: "comentarios")
        UserDefaults.standard.synchronize()
    }
    
    
    @objc func handleKeyboard(_ gesture: UITapGestureRecognizer) {
       let location = gesture.location(in: texfieldComentarios)
       
       if !texfieldComentarios.bounds.contains(location) {
          view.endEditing(true)
       }
    }

}


