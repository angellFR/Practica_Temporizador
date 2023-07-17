//
//  CoreMotionViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 07/07/23.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {
    
    static let shared = CoreMotionViewController()
    
    private var labelX: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    private var labelY: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    
    private var labelZ: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    
    private var aceledatax: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    private var aceledatay: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    private var aceledataz: UILabel = {
        let label = UILabel()
        label.text = "Comentarios: "
        return label
    }()
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("hola")
        MyGryo()
        setupUI()
        MyAccel()
    }

    func setupUI(){
        view.addSubview(labelX)
        labelX.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: nil, top: 150, right: nil, bottom: nil)
        
        view.addSubview(labelY)
        labelY.addAnchorsAndCenter(centerX: true, centerY: nil, width: nil, height: nil, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top,relativeToView: labelX)
        
        view.addSubview(labelZ)
        labelZ.addAnchorsAndCenter(centerX: true, centerY: nil, width: nil, height: nil, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top,relativeToView: labelY)
        
        view.addSubview(aceledatax)
        aceledatax.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: nil, left: nil, top: nil, right: nil, bottom: nil)
        
        view.addSubview(aceledatay)
        aceledatax.addAnchorsAndCenter(centerX: true, centerY: nil, width: nil, height: nil, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top,relativeToView: aceledatax)
        
        view.addSubview(aceledataz)
        aceledatax.addAnchorsAndCenter(centerX: true, centerY: nil, width: nil, height: nil, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top,relativeToView: aceledatay)
    }
    func MyGryo(){
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let trueData = data{
                print("giroscopio::::",trueData)
                self.labelX.text = "\(trueData.rotationRate.x)"
                self.labelY.text = "\(trueData.rotationRate.y)"
                self.labelZ.text = "\(trueData.rotationRate.z)"
            }
        }
    }
    func MyAccel(){
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data{
//                print(myData)
                if myData.acceleration.x > 1 {
                    self.aceledatax.text = "\(myData.acceleration.x)"
                    print("aceleracion:::",myData)
                    
                }
                self.aceledatay.text = "\(myData.acceleration.y)"
                self.aceledataz.text = "\(myData.acceleration.z)"
            }
        }
    }
}
