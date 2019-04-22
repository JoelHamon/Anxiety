//
//  ViewController.swift
//  Anxiety
//
//  Created by Joel Menezes Hamon on 19/10/2018.
//  Copyright © 2018 Joel Menezes Hamon. All rights reserved.
//

import UIKit

class Cena19ViewController: UIViewController {
 
    @IBOutlet weak var Cena19ImageView: UIImageView!
    @IBOutlet weak var dialogCena19Label: UILabel!
    
    
    var timer: Timer!
    var IsOk: Int = 0
    var validAnimation: Bool = true
    var fimDefrase: Bool =  false
    var okNext: Bool = false
    var labelEnd: Bool = false
    var initialView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView = true
        // Do any additional setup after loading the view, typically from a nib.
        
        dialogCena19Label.numberOfLines = 0
        dialogCena19Label.font = UIFont(name: "Juninho-Regular", size: 18)
        dialogCena19Label.numberOfLines = 2
        dialogCena19Label.textColor = .black
        dialogCena19Label.textAlignment = .center
        dialogCena19Label.lineBreakMode = .byTruncatingHead
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        downSwipe.direction = .down
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(downSwipe)
        
        
        Cena19ImageView.isAccessibilityElement = true
        let Cena19Gif = UIImage.gifImageWithName("Cena_19") // Cria uma variável com a imagem Gif através da extensão da biblioteca ImageView que será utilizada na ImageView da Cena
        Cena19ImageView.image = Cena19Gif // Adicionando a variável à tela de ImageView
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(Cena19ViewController.update), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func update() { // Função de atualização para opreações constantes
        if IsOk < cena19.count { // Variável que faz vibrar apenas uma vez
            if validAnimation == true {
                setLabelDialog()
            }
        } else{
            okNext = true
            dialogCena19Label.text = "..."
        }
    }
    
    
    @IBAction func setDialogCena19(_ sender: Any) {
        validAnimation = false
        if fimDefrase == true {
            dialogCena19Label.text?.removeAll()
            IsOk += 1
            validAnimation = true
            fimDefrase = false
        }
    }
    
    func setLabelDialog(){
        for letra in cena19[IsOk] {
            if validAnimation == false {
                dialogCena19Label.text! = cena19[IsOk]
                break
            }
            dialogCena19Label.text! += ("\(letra)")
            RunLoop.current.run(until: Date()+0.10)
        }
        fimDefrase = true
        validAnimation = false
    }
    
    
//    func showOutgoingMessage1(text: String) {
//        let label =  UILabel()
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Juninho-Regular", size: 18)
//        label.textColor = .black
//        label.text = ""
//
//        let constraintRect = CGSize(width: 0.66 * view.frame.width,
//                                    height: .greatestFiniteMagnitude)
//        let boundingBox = text.boundingRect(with: constraintRect,
//                                            options: .usesLineFragmentOrigin,
//                                            attributes: [.font: label.font],
//                                            context: nil)
//        label.frame.size = CGSize(width: ceil(boundingBox.width),
//                                  height: ceil(boundingBox.height))
//
//        let bubbleImageSize = CGSize(width: label.frame.width + 28,
//                                     height: label.frame.height + 20)
//
//        let outgoingMessageView = UIImageView(frame:
//            CGRect(x: view.frame.width - bubbleImageSize.width - 10,// posição x
//                y: view.frame.height - bubbleImageSize.height - 550, //posição y
//                width: bubbleImageSize.width,
//                height: bubbleImageSize.height))
//
//        let bubbleImage = UIImage(named: "bubble_Chat2")?
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
//                            resizingMode: .tile)
//            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//
//        outgoingMessageView.image = bubbleImage
//
//        view.addSubview(outgoingMessageView)
//
//        label.center = outgoingMessageView.center
//
//        let labelDialog = (Bundle.main.infoDictionary?["CFBoundleName"] as? String) ?? text
//
//        for letra in labelDialog {
//            label.text! += ("\(letra)")
//            RunLoop.current.run(until: Date()+0.10)
//            view.addSubview(label)
//        }
//    }
//
//    func showOutgoingMessage2(text: String) {
//        let label =  UILabel()
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Juninho-Regular", size: 18)
//        label.textColor = .black
//        label.text = ""
//
//        let constraintRect = CGSize(width: 0.66 * view.frame.width,
//                                    height: .greatestFiniteMagnitude)
//        let boundingBox = text.boundingRect(with: constraintRect,
//                                            options: .usesLineFragmentOrigin,
//                                            attributes: [.font: label.font],
//                                            context: nil)
//        label.frame.size = CGSize(width: ceil(boundingBox.width),
//                                  height: ceil(boundingBox.height))
//
//        let bubbleImageSize = CGSize(width: label.frame.width + 28,
//                                     height: label.frame.height + 20)
//
//        let outgoingMessageView = UIImageView(frame:
//            CGRect(x: view.frame.width - bubbleImageSize.width - 10,// posição x
//                y: view.frame.height - bubbleImageSize.height - 450, //posição y
//                width: bubbleImageSize.width,
//                height: bubbleImageSize.height))
//
//        let bubbleImage = UIImage(named: "bubble_Chat2")?
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
//                            resizingMode: .tile)
//            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//
//        outgoingMessageView.image = bubbleImage
//
//        view.addSubview(outgoingMessageView)
//
//        label.center = outgoingMessageView.center
//
//        let labelDialog = (Bundle.main.infoDictionary?["CFBoundleName"] as? String) ?? text
//
//        for letra in labelDialog {
//            label.text! += ("\(letra)")
//            RunLoop.current.run(until: Date()+0.10)
//            view.addSubview(label)
//        }
//    }
//
//    func showOutgoingMessage3(text: String) {
//        let label =  UILabel()
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Juninho-Regular", size: 18)
//        label.textColor = .black
//        label.text = ""
//
//        let constraintRect = CGSize(width: 0.66 * view.frame.width,
//                                    height: .greatestFiniteMagnitude)
//        let boundingBox = text.boundingRect(with: constraintRect,
//                                            options: .usesLineFragmentOrigin,
//                                            attributes: [.font: label.font],
//                                            context: nil)
//        label.frame.size = CGSize(width: ceil(boundingBox.width),
//                                  height: ceil(boundingBox.height))
//
//        let bubbleImageSize = CGSize(width: label.frame.width + 28,
//                                     height: label.frame.height + 20)
//
//        let outgoingMessageView = UIImageView(frame:
//            CGRect(x: view.frame.width - bubbleImageSize.width - 10,// posição x
//                y: view.frame.height - bubbleImageSize.height - 350, //posição y
//                width: bubbleImageSize.width,
//                height: bubbleImageSize.height))
//
//        let bubbleImage = UIImage(named: "bubble_Chat2")?
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
//                            resizingMode: .tile)
//            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//
//        outgoingMessageView.image = bubbleImage
//
//        view.addSubview(outgoingMessageView)
//
//        label.center = outgoingMessageView.center
//
//        let labelDialog = (Bundle.main.infoDictionary?["CFBoundleName"] as? String) ?? text
//
//        for letra in labelDialog {
//            label.text! += ("\(letra)")
//            RunLoop.current.run(until: Date()+0.10)
//            view.addSubview(label)
//        }
//    }
//
//    func showOutgoingMessage4(text: String) {
//        let label =  UILabel()
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Juninho-Regular", size: 18)
//        label.textColor = .black
//        label.text = ""
//
//        let constraintRect = CGSize(width: 0.66 * view.frame.width,
//                                    height: .greatestFiniteMagnitude)
//        let boundingBox = text.boundingRect(with: constraintRect,
//                                            options: .usesLineFragmentOrigin,
//                                            attributes: [.font: label.font],
//                                            context: nil)
//        label.frame.size = CGSize(width: ceil(boundingBox.width),
//                                  height: ceil(boundingBox.height))
//
//        let bubbleImageSize = CGSize(width: label.frame.width + 28,
//                                     height: label.frame.height + 20)
//
//        let outgoingMessageView = UIImageView(frame:
//            CGRect(x: view.frame.width - bubbleImageSize.width - 10,// posição x
//                y: view.frame.height - bubbleImageSize.height - 550, //posição y
//                width: bubbleImageSize.width,
//                height: bubbleImageSize.height))
//
//        let bubbleImage = UIImage(named: "bubble_Chat2")?
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
//                            resizingMode: .tile)
//            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//
//        outgoingMessageView.image = bubbleImage
//
//        view.addSubview(outgoingMessageView)
//
//        label.center = outgoingMessageView.center
//
//        let labelDialog = (Bundle.main.infoDictionary?["CFBoundleName"] as? String) ?? text
//
//        for letra in labelDialog {
//            label.text! += ("\(letra)")
//            RunLoop.current.run(until: Date()+0.10)
//            view.addSubview(label)
//        }
//    }
    
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if okNext == true {
            if sender.state == .ended {
                switch sender.direction {
                case .left:
                    performSegue(withIdentifier: "segueCena19_1", sender: nil)
                    initialView = false
                case .down:
                    performSegue(withIdentifier: "segueCena19_2", sender: nil)
                    initialView = false
                default:
                    break
                }
            }
        }
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
