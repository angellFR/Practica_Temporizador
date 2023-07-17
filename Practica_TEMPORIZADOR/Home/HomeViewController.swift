//
//  HomeViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created Administrator on 05/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import CoreMotion

class HomeViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Protocol Properties
    var presenter: HomePresenterProtocol?

    //MARK: - Properties
       
    var timer: Timer = Timer()
    var count: Int = 120
    var timerCounting: Bool = false
    let manager = CMMotionActivityManager()
    let motion = CMMotionManager()
    var contador: Int = 0
    var defaults = UserDefaults.standard
    
    var datov: Int = 0
    
    private var labelTemporizador: UILabel = {
        let label = UILabel()
        label.text = "00:01:59"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 70)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timerTextField : UITextField = {
       let timer = UITextField()
        timer.text = "00:00:00"
        timer.textColor = .white
        timer.font = UIFont(name: "Helvetica", size: 70)
        timer.textAlignment = .center
        return timer
    }()
    
    private var startStopButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 20
        button.setTitle("INICIAR", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(startStopTapped), for: .touchUpInside)
        return button
    }()
    
    private var buttonReset: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 20
        button.setTitle("RESTABLECER", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()

    }
    
    //MARK: - Methods
    
    func setupUI(){

        view.addSubview(timerTextField)
        timerTextField.addAnchorsAndSize(width: nil, height: 80, left: 10, top: 200, right: 10, bottom: nil)
        
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(startStopButton)
        startStopButton.addAnchorsAndCenter(centerX: true, centerY: false, width: 300, height: 50, left: nil, top: 100, right: nil, bottom: nil, withAnchor: .top, relativeToView: timerTextField)
        
        view.addSubview(buttonReset)
        buttonReset.addAnchorsAndCenter(centerX: true, centerY: false, width: 300, height: 50, left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: startStopButton)
        MyGryo()
        startAtomatic()
        
        self.timerTextField.delegate = self
    }
}

//MARK: - View Methods
extension HomeViewController: HomeViewProtocol {
    func sendData(dato: Int) {
        datov = dato
    }
    
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        timerTextField.resignFirstResponder()
        return false
    }
}

//MARK: - Private functions

extension HomeViewController {
    func startAtomatic(){
        if contador == 10 {
            print("empieza el temporizador")
        
        } else {
            print("el celular esta en movimiento")
        }
    }
     
    @objc func startStopTapped(){
        
        if(timerCounting){
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("RENUDAR", for: .normal)
            startStopButton.layer.backgroundColor = UIColor.systemGreen.cgColor
            startStopButton.setTitleColor(UIColor.white, for: .normal)
            print("boton inicio")
            if let opciones = UserDefaults.standard.string(forKey: "opciones") {
                print("valor en user defaulds::: \(opciones)")
            } else {
                print("no hay valores")
            }
        }
        else {
                timerCounting = true
                startStopButton.setTitle("PAUSAR", for: .normal)
                startStopButton.setTitleColor(UIColor.white, for: .normal)
                startStopButton.layer.backgroundColor = UIColor.systemRed.cgColor
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    
    }
     
    @objc func resetTapped(){
        print("restButton")
        let alert = UIAlertController(title: "Reset Timer", message: "Are you sure you would like to reset the timer", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            self.count = 120
            self.timer.invalidate()
            self.timerTextField.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startStopButton.setTitleColor(UIColor.white, for: .normal)
            print("::::::: \(self.makeTimeString(hours: 0, minutes: 0, seconds: 0))")
            self.startStopButton.setTitle("INICIAR", for: .normal)
            self.startStopButton.layer.backgroundColor = UIColor.systemOrange.cgColor
        }))
        self.present(alert, animated: true, completion: nil)
        Vibrator.shared.stopHaptic()
        Vibrator.shared.stopVibrate()
 
    }
    
    @objc func timerCounter() -> Void {
        count = Int((timerTextField.text?.convertToTimeInterval())!) - 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1 , seconds: time.2)
        timerTextField.text = timeString
        print(timeString)
        if(count == 0){
                   timer.invalidate()
                self.startStopButton.setTitle("INICIAR", for: .normal)
                self.startStopButton.layer.backgroundColor = UIColor.systemOrange.cgColor
                               configVibration()
               }
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    @objc func Detalles(){
        
    }
    
    func MyGryo(){
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let trueData = data{
                
                if trueData.rotationRate.x < 0 {
//                    print("celular en reposo")
                    self.contador += 1
//                    print("contador:::: \(self.contador)")
                    if self.contador == 8 {
                        self.startStopTapped()
                    }
                    
                }else {
//                    print("celular en movimiento")
                    self.contador = 0
//                    print("contador reposo ----- \(self.contador)")
                }
              
            }
        }
    }
    
    
    func configVibration() {
        if let preference = UserDefaults.standard.string(forKey: "opciones") {
            
            switch preference {
            case "Vibrar y Sonido":
                print("vibrar y sonido")
                Vibrator.shared.startVibrate(frequency: .low, loop: true)
            case "Solo Vibrar":
                print("Solo Vibrar")
                Vibrator.shared.startVibrate(frequency: .low, loop: true)
            case "Solo Sonido" :
                print("Solo Sonido")
            default:
                print("defauld")
                
            }
        }
    }
    
    
}

extension String {
    func convertToTimeInterval() -> TimeInterval {
        guard self != "" else {
            return 0
        }

        var interval:Double = 0

        let parts = self.components(separatedBy: ":")
        for (index, part) in parts.reversed().enumerated() {
            interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
        }

        return interval
    }
}
