//
//  ViewController.swift
//  Animation
//
//  Created by Steven Kirke on 17.09.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let blur = Blur()
    let borderButton = Button()

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var marioImage: UIImageView!
    @IBOutlet weak var parametrLabel: UILabel!
    @IBOutlet weak var mushroomImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blur.blurImage(image: backgroundImage, view: view, style: .light)
        borderButton.buttonBorder(button: clickButton)
    }


}

