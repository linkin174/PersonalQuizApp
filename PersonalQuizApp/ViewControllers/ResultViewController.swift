//
//  ResultViewController.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Public Properties
    
    var choosenAnswers: [Answer]!
    
    
    @IBOutlet var choosenAnimalLabel: UILabel!
    @IBOutlet var choosenAnimalDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        choosenAnimalLabel.text = "Вы - \(getAnimalDependingOnAnswers(from: choosenAnswers).rawValue)!"
        choosenAnimalDescriptionLabel.text = getAnimalDependingOnAnswers(from: choosenAnswers).definition
    }

    //MARK: Private methods
    
    private func getAnimalDependingOnAnswers(from answers: [Answer]) -> Animal {
        var animals: [Animal: Int] = [:]
        var animal: Animal?
        answers.forEach { animals[$0.animal] = (animals[$0.animal] ?? 0 ) + 1 }
        if let (value, _) =  animals.max(by: {$0.1 < $1.1}) {
           animal = value
        }
        return animal ?? .dog
    }
    
}
