//
//  Styles.swift
//  Animation
//
//  Created by Steven Kirke on 17.09.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class Blur {
    func blurImage(image: UIImageView, view: UIView, style: UIBlurEffect.Style) {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.frame = view.frame
        image.addSubview(blurView)
    }
}

class Button: UIButton {
    func buttonBorder(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
}

class gradient {

}
