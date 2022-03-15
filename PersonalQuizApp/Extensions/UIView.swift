//
//  UIView.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackground(_ firstColor: UIColor, _ secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
}
