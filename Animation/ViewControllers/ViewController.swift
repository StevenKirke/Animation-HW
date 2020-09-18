//
//  ViewController.swift
//  Animation
//
//  Created by Steven Kirke on 17.09.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var animateProgress: UIProgressView!
    @IBOutlet weak var mushroomImage: UIImageView!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var parametrView: UIView!
    @IBOutlet weak var parametrLabel: UILabel!
    @IBOutlet weak var marioImage: SpringImageView!
    
    private let animations = ViewAnimationConfig.createAnimations()
    private let blur = Blur()
    private let borderButton = Button()
    private var currentAnimationIndex = 0
    private var currentAnimation: ViewAnimation? {
        if currentAnimationIndex < animations.count {
            return animations[currentAnimationIndex]
        }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        blur.blurImage(image: backgroundImage, view: view, style: .light)
        borderButton.buttonBorder(button: clickButton)
    }
    
    @IBAction func changeAnimationAction(_ sender: Any) {
        clickButton.isEnabled = false
        mushroomImage.transform = .identity
        parametrView.transform = .identity
        marioImage.transform = .identity
        
        guard let animation = currentAnimation else { return }
        marioImage.animation = animation.animation.rawValue
        marioImage.curve = animation.curve.rawValue
        marioImage.force = animation.force
        marioImage.duration = animation.duration
        marioImage.animate()
        
        nextAnimation()
        mushroomAnimation()

        parametrLabel.text = """
        animation: \(animation.animation)
        curve: \(animation.curve.rawValue)
        duration: \(animation.duration)
        force: \(animation.force)
        """
    }
    
    private func nextAnimation() {
        currentAnimationIndex += 1
        animateProgress.progress = Float(currentAnimationIndex) / Float(animations.count)
        if currentAnimationIndex >= animations.count {
            currentAnimationIndex = 0
        }

        let nameAnimation = String(animations[currentAnimationIndex].animation.rawValue)
        clickButton.setTitle(nameAnimation, for: [.normal])
    }
    
    private func mushroomAnimation() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let self = self else { return }
            let mushroomHeight = self.mushroomImage.frame.height
            let parametrViewHeight = self.parametrView.frame.height
            self.mushroomImage.transform = CGAffineTransform(translationX: 0.0,
                                                             y: -mushroomHeight)
            self.parametrView.transform = CGAffineTransform(translationX: 0.0,
                                                            y: -parametrViewHeight)
        }) { [weak self] (complited) in
            if complited {
                self?.hide()
            }
        }
    }
    
    private func hide()  {
        UIView.animate(withDuration: 0.5,
                       delay: 2.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            guard let self = self else { return }
            self.parametrView.transform = .identity
            self.mushroomImage.transform = .identity
        }) { [weak self] (complited) in
            if complited {
                self?.clickButton.isEnabled = true
            }
        }
    }
}
