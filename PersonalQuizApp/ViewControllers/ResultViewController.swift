//
//  ResultViewController.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var choosenAnimalLabel: UILabel!
    @IBOutlet var choosenAnimalDescriptionLabel: UILabel!
    
    //MARK: Public Properties
    var answers: [Answer]!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        view.setGradientBackground(.cyan, .white)
        
        choosenAnimalLabel.text = "Вы - \(getChoosenAnimal(from: answers).rawValue)!"
        choosenAnimalDescriptionLabel.text = getChoosenAnimal(from: answers).definition
    }

    //MARK: Private methods
    private func getChoosenAnimal(from answers: [Answer]) -> Animal {
        var animals: [Animal: Int] = [:]
        var choosenAnimal: Animal?
        
        answers.forEach({ animals[$0.animal] = (animals[$0.animal] ?? 1 ) + 1 })
        choosenAnimal = animals.sorted(by: { $0.value > $1.value }).first?.key
        
        return choosenAnimal ?? .dog
    }
    
}
