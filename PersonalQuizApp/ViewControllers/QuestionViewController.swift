//
//  QuestionViewController.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var sliderStackView: UIStackView!
    @IBOutlet var sliderLabels: [UILabel]!
    @IBOutlet var slider: UISlider! {
        didSet {
            let answersCount = Float(currentAnswers.count - 1)
            slider.maximumValue = answersCount
            slider.value = answersCount / 2
        }
    }
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionsProgress: UIProgressView!
    
    //MARK: Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var answersChosen: [Answer] = []
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(.cyan, .white)
        updateUI()
    }
    
    //MARK: IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func sliderAnswerButtonPressed() {
        let index = lrintf(slider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answersChosen 
    }
    
}

//MARK: Private Methods
extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, sliderStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionsProgress.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        showCurrentAnswers(for: currentQuestion.resposeType)
        
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showSliderStackView(with: currentAnswers)
        }
}
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showSliderStackView(with answers: [Answer]) {
        sliderStackView.isHidden = false
        sliderLabels.first?.text = answers.first?.title
        sliderLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
