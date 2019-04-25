//
//  Cena23ViewController.swift
//  Anxiety
//
//  Created by Robson James Junior on 04/11/18.
//  Copyright © 2018 Joel Menezes Hamon. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox // Biblioteca para utilizar vibração

class Cena23ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var Cena23ImageView: UIImageView!
    
    @IBOutlet weak var respImageView: UIImageView!
    
     @IBOutlet weak var progressBar: ProgressBarView!
    
    var labelEnd: Bool = false
    var inspBool: Bool = false
    var respBool: Bool = false
    var countAlc: Bool = false
    var timer: Timer!
    var portVib: Bool = false
    var initialView: Bool = false
    
    var longePressBeginTime: TimeInterval = 0.0
    
    // For Progress Bar
    var progressCounter:Float = 0
    let duration:Float = 6.0
    var progressIncrement:Float = 0
    var trueSemaf: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView = true
        labelEnd = true
        progressBar.layer.cornerRadius = progressBar.frame.height / 2
        progressIncrement = 2.0/duration
        
        Cena23ImageView.isAccessibilityElement = true
        
        let imagemInitial = UIImage.init(named: "respira")
        respImageView.image = imagemInitial
        
        respImageView.isUserInteractionEnabled = true
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(Cena23ViewController.addPulse))
        
        longPress.minimumPressDuration = 0.5
        longPress.delegate = self
        self.respImageView.addGestureRecognizer(longPress)
        
        let Cena23Gif = UIImage.gifImageWithName("Cena_23") // Cria uma variável com a imagem Gif através da extensão da biblioteca ImageView que será utilizada na ImageView da Cena
        Cena23ImageView.image = Cena23Gif // Adicionando a variável à tela de ImageView
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Cena23ViewController.update), userInfo: nil, repeats: true)
    }
    
   
    @objc func addPulse(longPress: UIGestureRecognizer){
        countAlc = true
//        if countAlc == 0 {
//            let Cena23_2Gif = UIImage.gifImageWithName("Cena_23_2")
//            Cena23ImageView.image = Cena23_2Gif
//            countAlc = 1
//        } else {
//            let Cena23Gif = UIImage.gifImageWithName("Cena_23")
//            Cena23ImageView.image = Cena23Gif
//            countAlc = 0
//        }
        
        if (longPress.state == UIGestureRecognizer.State.ended)
        {
           // countAlc = true
            labelEnd = true
            let gestureTime = NSDate.timeIntervalSinceReferenceDate -
                longePressBeginTime
            print("Gesture time = \(gestureTime)")
            let Cena23_2Gif = UIImage.gifImageWithName("Cena_23_2")
            Cena23ImageView.image = Cena23_2Gif
        }
        else if (longPress.state == UIGestureRecognizer.State.began)
        {
            print("Began")
            labelEnd = false
            longePressBeginTime = NSDate.timeIntervalSinceReferenceDate
            let Cena23Gif = UIImage.gifImageWithName("Cena_23")
            Cena23ImageView.image = Cena23Gif
        }
        
    }
    
    @objc func update() { // Função de atualização para opreações constantes
        print("1 - \(countAlc)")
        if initialView == true {
            if labelEnd == true {
                progressBar.progress = 0
                progressCounter = 0
                let pulse = Pulsing(numberOfPulses: 1, radius: 60, position: respImageView.center)
                pulse.animationDuration = 1.0
                pulse.backgroundColor = UIColor.blue.cgColor
                self.view.layer.insertSublayer(pulse, below: respImageView.layer)
            } else {
                
                if(progressCounter > 1.0){timer.invalidate()} //sai da funcao de update
                if (countAlc == true){
                    progressBar.progress = progressCounter
                    progressCounter = progressCounter + progressIncrement
                }
            }
        }
    }
    
    
    
    
// button inspirar
//        if inspBool == false {
//            inspBool = true
//            let Cena23Gif = UIImage.gifImageWithName("Cena_23") // Cria uma variável com a imagem Gif através da extensão da biblioteca ImageView que será utilizada na ImageView da Cena
//            Cena23ImageView.image = Cena23Gif // Adicionando a variável à tela de ImageView
//        }
    
    
// button respirar
//        if respBool == false {
//            respBool = true
//            let Cena23_2Gif = UIImage.gifImageWithName("Cena_23_2") // Cria uma variável com a imagem Gif através da extensão da biblioteca ImageView que será utilizada na ImageView da Cena
//            Cena23ImageView.image = Cena23_2Gif // Adicionando a variável à tela de ImageView
//        }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
}
