//
//  TorchEffectVC.swift
//  ApiProject
//
//  Created by O'ral Nabiyev on 16/04/24.
//

import UIKit
import Lottie

class TorchEffectVC: UIViewController {
    
    @IBOutlet weak var torchV: UIView!
    
    @IBOutlet weak var torchImg: UIImageView! {
        didSet {
            torchImg.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @IBOutlet weak var lottieV: UIView!
    
    @IBOutlet weak var secondLottieV: UIView!
    
    @IBOutlet weak var backImg: UIImageView!
    
    @IBOutlet weak var OnOffLbl: UILabel!
    
    private var animationView: LottieAnimationView?
    
    var isOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPanGesture()
        setLottie()
        tapLighter()
    }
    
    //Lottie
    func setLottie() {
        //first lottie
        animationView = .init(name: "fire")
        animationView!.frame = lottieV.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1
        lottieV.addSubview(animationView!)
        animationView!.play()
        
        //second lottie
        animationView = .init(name: "fire")
        animationView!.frame = secondLottieV.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1
        secondLottieV.addSubview(animationView!)
        animationView!.play()
    }
    
    func tapLighter() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0) { [self] in
            if !isOn {
                torchImg.alpha = 1
                UIView.animateKeyframes(withDuration: 0.4, delay: 0.3) { [self] in
                    backImg.alpha = 1
                }
                OnOffLbl.text = "On"
                lottieV.alpha = 1
                secondLottieV.alpha = 1
                animationView!.play()
                isOn = true
            } else {
                backImg.alpha = 0
                UIView.animateKeyframes(withDuration: 0.4, delay: 0.3) { [self] in
                    torchImg.alpha = 0
                }
                OnOffLbl.text = "Off"
                lottieV.alpha = 0
                secondLottieV.alpha = 0
                animationView!.stop()
                isOn = false
            }
        }
    }
    
    func setUpPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned (_:)))
        self.torchV.addGestureRecognizer(panGesture)
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {
        
        let location = gesture.location(in: self.view)
        torchV.center = location
        torchImg.center = location
        
    }
    
    @IBAction func zippoLighterTapped(_ sender: Any) {
        tapLighter()
    }
    
    
    
    
}
