//
//  QuestionViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    
    //MARK: - Properties
    var questions: [QuestionModel] = []
    var question = QuestionModel(quiz: "Se não era amor, o que era?", answer: [AnswerModel(name: "paixão", style: .blank),
                                                                                AnswerModel(name: "ódio", style: .blank),
                                                                                AnswerModel(name: "ranço", style: .blank),
                                                                                AnswerModel(name: "cilada, Bino", style: .blank)],
                                                                        answerCorrect: 3)
    
    
    //MARK: - Outlets
    @IBOutlet weak var AlternativeTabelView: UITableView!
    @IBOutlet weak var questionLabelView: UILabel!
    @IBOutlet weak var AnswerButton: UIButton!
    
    
    //MARK: - Actions
    @IBAction func handlerAnswerButton(_ sender: Any) {
        
        if question.isAnswer {
            
        }
        else{
        
            for indexAnswer in 0..<question.answer.count {
                if indexAnswer == question.answerCorrect {
                question.answer[indexAnswer].style = .correct
                }
                else if question.answer[indexAnswer].style == .selected {
                question.answer[indexAnswer].style = .incorrect
                }
            }
            AlternativeTabelView.reloadData()
            
            question.isAnswer = true
            AnswerButton.setTitle("Próxima pergunta", for: .normal)
        }
    }
    //let viewController = HomeViewController()
    // navigationController?.pushViewController(viewController, animated: true)
  
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
        
        //Questions List
       // question = QuestionModel(quiz: "Se não era amor, o que era?", answer: ["paixão", "ódio", "ranço", "cilada, Bino"], answerCorrect: 3)
       // questions.append (question)
        //question = QuestionModel(quiz: "O Luiz Carlos do Raça Negra está com um problema. Ele precisa de ajuda para segurar", answer: ["A calça que está caindo", "O forninho", "Essa barra que é gostar de você", "As pontas"], answerCorrect: 2)
       // questions.append (question)
    }
    //MARK: - Methods
    func setupUI() {
        AnswerButton.isEnabled = false
        AnswerButton.backgroundColor = .gray
        
        title = "Perguntas e respostas"
        questionLabelView.text = question.quiz
        AlternativeTabelView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        AlternativeTabelView.dataSource = self
        AlternativeTabelView.delegate = self
        AlternativeTabelView.reloadData()
        answerButtonCornerRadius()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = question.answer[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as? AnswerCell {
            cell.setup(model: answer)
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if question.isAnswer {
            return
        }
        
        
        for indexAnswer in 0..<question.answer.count {
            question.answer[indexAnswer].style = indexAnswer == indexPath.row ? .selected : .blank
            //if question.isAnswer {
               
            //}
        }
        AnswerButton.isEnabled = true
        AnswerButton.backgroundColor = UIColor(red: 94/255, green: 130/255, blue: 249/255, alpha: 1)
        tableView.reloadData()
        
       
    }
    func answerButtonCornerRadius() {
            AnswerButton.layer.cornerRadius = 35
    }
}
