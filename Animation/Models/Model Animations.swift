//
//  Model Animations.swift
//  Animation
//
//  Created by Steven Kirke on 17.09.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit
import Spring

struct ViewAnimation {
    let animation: Spring.AnimationPreset
    let curve: Spring.AnimationCurve
    let duration: CGFloat
    let force: CGFloat
}

class ViewAnimationConfig {
    static func createAnimations() -> [ViewAnimation] {
        let presets: [Spring.AnimationPreset] = [.FadeIn, .FadeInDown,
                                                 .FadeInLeft, .Fall,
                                                 .FadeInUp, .Shake,
                                                 .Flash, .Pop]
        var anim = [ViewAnimation]()
        for elem in presets {
            anim.append(ViewAnimation(animation: elem,
                                      curve: .EaseIn,
                                      duration: 1.0,
                                      force: 1.0))
        }
        return anim
    }
}

