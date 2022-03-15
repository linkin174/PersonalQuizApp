//
//  ViewController.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    //MARK: Private Properties
    private let questions = Question.getQuestions()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(.cyan, .white)
    }
    
    //MARK: IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {}
}

