//
//  ViewController.swift
//  Anxiety
//
//  Created by Joel Menezes Hamon on 19/10/2018.
//  Copyright © 2018 Joel Menezes Hamon. All rights reserved.
//

import UIKit

class Cena16ViewController: UIViewController {
    
    
    @IBOutlet weak var Cena16ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Cena16ImageView.isAccessibilityElement = true
        let Cena16Gif = UIImage.gifImageWithName("Cena_16") // Cria uma variável com a imagem Gif através da extensão da biblioteca ImageView que será utilizada na ImageView da Cena
        Cena16ImageView.image = Cena16Gif // Adicionando a variável à tela de ImageView
    }
    
    
}
