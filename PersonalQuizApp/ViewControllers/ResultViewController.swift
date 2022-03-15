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
    var choosenAnswers: [Answer]!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        view.setGradientBackground(.cyan, .white)
        choosenAnimalLabel.text = "Вы - \(getAnimalDependingOnAnswers(from: choosenAnswers).rawValue)!"
        choosenAnimalDescriptionLabel.text = getAnimalDependingOnAnswers(from: choosenAnswers).definition
    }

    //MARK: Private methods
    private func getAnimalDependingOnAnswers(from answers: [Answer]) -> Animal {
        var animals: [Animal: Int] = [:]
        var choosenAnimal: Animal?
        
        answers.forEach { animals[$0.animal] = (animals[$0.animal] ?? 0 ) + 1
            debugPrint(animals)
        }
        
        if let (animal, _) =  animals.max(by: { $0.value < $1.value}) {
            choosenAnimal = animal
        }
        
        return choosenAnimal ?? .dog
    }
    
}
