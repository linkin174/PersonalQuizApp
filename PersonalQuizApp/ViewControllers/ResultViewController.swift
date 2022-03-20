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
        var frequentAnimals: [Animal: Int] = [:]

        answers.forEach({frequentAnimals[$0.animal] = (frequentAnimals[$0.animal] ?? 1 ) + 1})
        //MARK: Короткая запись
       // guard let choosenAnimal = frequentAnimals.sorted(by: {$0.value > $1.value}).first?.key else { return .dog}
        
        //MARK: Полная запись
        /*
        for answer in answers {
            if let animalTypeCount = frequentAnimals[answer.animal] {
                frequentAnimals.updateValue(animalTypeCount, forKey: answer.animal)
            } else {
                frequentAnimals[answer.animal] = 1
            }
        }
        guard let choosenAnimal = frequentAnimals.sorted(by: {$0.value > $1.value}).first?.key else { return .dog }
        */
        
        //MARK: В одну строку
        let choosenAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted(by: { $0.value.count > $1.value.count })
            .first?.key
        return choosenAnimal ?? .dog
    }
    
}

