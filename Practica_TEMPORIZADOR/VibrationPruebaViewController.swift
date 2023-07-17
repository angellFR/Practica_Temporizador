//
//  VibrationPruebaViewController.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 10/07/23.
//

import UIKit
import AVKit



class VibrationPruebaViewController: UIViewController {

   
    var player: AVAudioPlayer?

    private var startStopButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 20
        button.setTitle("INICIAR", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(systemVibrateLoopHighButton), for: .touchUpInside)
        return button
    }()
    
    private var StopButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 20
        button.setTitle("STOP", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(stopVibration), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startStopButton)
        startStopButton.addAnchorsAndCenter(centerX: true, centerY: true, width: 300, height: 50, left: nil, top: nil, right: nil, bottom: nil)
        
        view.addSubview(StopButton)
        StopButton.addAnchorsAndCenter(centerX: true, centerY: false, width: 300, height: 50, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: startStopButton)
    
            }
    
    @objc private func systemVibrateLoopHighButton() {
        Vibrator.shared.startVibrate(frequency: .high, loop: true)
        print("systemVibrateLoopHighButton")
        playSound(soud: .MarioBros)
       
    }
    
    @objc private func stopVibration() {
        Vibrator.shared.stopHaptic()
        Vibrator.shared.stopVibrate()
        playSound(soud: .Tono)
        print("stopBUtton")
      
        
    }
    
    func playSound(soud: SoundOption){
        
        guard let rutaAlArchivo = Bundle.main.url(forResource: soud.rawValue, withExtension: "mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: rutaAlArchivo)
            player?.play()
        }catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
     
    }


}
