//
//  HomeViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class HomeViewController: UIViewController {


        //MARK: - Properties
        let question1 =  QuestionModel(quiz: "Se não era amor, o que era?", answer: [
                                                                                AnswerModel(name: "Paixão", style: .blank),
                                                                                AnswerModel(name: "Ódio", style: .blank),
                                                                                AnswerModel(name: "Ranço", style: .blank),
                                                                                AnswerModel(name: "Cilada, Bino", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
        let question2 =  QuestionModel(quiz: "Luiz Carlos está com um problema. Ele precisa de ajuda para segurar",
                                                                            answer: [
                                                                                AnswerModel(name: "A calça que está caindo", style: .blank),
                                                                                AnswerModel(name: "O forninho", style: .blank),
                                                                                AnswerModel(name: "Essa barra que é gostar de você", style: .blank),
                                                                                AnswerModel(name: "As pontas", style: .blank)
                                                                            ],
                                                                            answerCorrect: 2)
        let question3 =  QuestionModel(quiz: "Em Faroeste Caboclo, Renato Russo adverte que não se deve brincar com quem é de qual signo?", answer: [
                                                                                AnswerModel(name: "Escorpião com ascendente em câncer", style: .blank),
                                                                                AnswerModel(name: "Aries com ascendente em libra", style: .blank),
                                                                                AnswerModel(name: "Peixes com ascendente em escorpião", style: .blank),
                                                                                AnswerModel(name: "Virgem com ascendente em sagitário", style: .blank)
                                                                            ],
                                                                            answerCorrect: 2)
        let question4 =  QuestionModel(quiz: "Quando eu digo que deixei de te amar é porque?", answer: [
                                                                                AnswerModel(name: "Você mexe com minha cabeça e me deixa assim", style: .blank),
                                                                                AnswerModel(name: "Eu te amo", style: .blank),
                                                                                AnswerModel(name: "Assim você me mata", style: .blank),
                                                                                AnswerModel(name: "Eu dormi na praça", style: .blank)],
                                                                            answerCorrect: 1)
        let question5 =  QuestionModel(quiz: "Ano passado eu morri, qual o plano para este ano?", answer: [
                                                                                AnswerModel(name: "Não morrer", style: .blank),
                                                                                AnswerModel(name: "Não matar", style: .blank),
                                                                                AnswerModel(name: "Não roubar", style: .blank),
                                                                                AnswerModel(name: "Não mentir", style: .blank)
                                                                            ],
                                                                            answerCorrect: 0)
        let question6 =  QuestionModel(quiz: "Anderson está participando daquela velha brincadeira de beijar, qual fruta ele escolheu?", answer: [
                                                                                AnswerModel(name: "Pêra", style: .blank),
                                                                                AnswerModel(name: "Uva", style: .blank),
                                                                                AnswerModel(name: "Maça", style: .blank),
                                                                                AnswerModel(name: "Salada mista", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
        let question7 =  QuestionModel(quiz: "Segundo Sebastião Rodrigues Maia, qual a melhor sobremesa depois tomar guaraná e suco de caju?", answer: [
                                                                                AnswerModel(name: "Marmelada", style: .blank),
                                                                                AnswerModel(name: "Goiabada", style: .blank),
                                                                                AnswerModel(name: "Pudim", style: .blank),
                                                                                AnswerModel(name: "Pavê", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
        let question8 =  QuestionModel(quiz: "Se não era amor, o que era?", answer: [
                                                                                AnswerModel(name: "paixão", style: .blank),
                                                                                AnswerModel(name: "ódio", style: .blank),
                                                                                AnswerModel(name: "ranço", style: .blank),
                                                                                AnswerModel(name: "cilada, Bino", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
        let question9 =  QuestionModel(quiz: "Se não era amor, o que era?", answer: [
                                                                                AnswerModel(name: "paixão", style: .blank),
                                                                                AnswerModel(name: "ódio", style: .blank),
                                                                                AnswerModel(name: "ranço", style: .blank),
                                                                                AnswerModel(name: "cilada, Bino", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
        let question10 =  QuestionModel(quiz: "Se não era amor, o que era?", answer: [
                                                                                AnswerModel(name: "paixão", style: .blank),
                                                                                AnswerModel(name: "ódio", style: .blank),
                                                                                AnswerModel(name: "ranço", style: .blank),
                                                                                AnswerModel(name: "cilada, Bino", style: .blank)
                                                                            ],
                                                                            answerCorrect: 3)
    
        lazy var questions: [QuestionModel] = [
                question1,
                question2,
                question3,
                question4,
                question5,
                question6,
                question7,
                question8,
                question9,
                question10,
            ]
        //MARK: - Outlets
        @IBOutlet weak var welcomeView: UIView!
        @IBOutlet weak var startButtonView: UIButton!
    
        
        //MARK: - Actions
        @IBAction func handlerButtonStarGame(_ sender: Any) {
            let viewController = QuestionViewController(questions: questions)
            
            navigationController?.pushViewController(viewController, animated: true)
    }
        //toDo - add button action to questions
        
        //MARK: - Overrides
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            welcomeViewCornerRadius()
            startButtonViewCornerRadius()
            title = "Perguntas e respostas"
    }
        //MARK: - Methods
    private func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 94/255, green: 130/255, blue: 249/255, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
    }
        func welcomeViewCornerRadius() {
        welcomeView.layer.cornerRadius = 40
    }
        func startButtonViewCornerRadius() {
        startButtonView.layer.cornerRadius = 35
    }
}
