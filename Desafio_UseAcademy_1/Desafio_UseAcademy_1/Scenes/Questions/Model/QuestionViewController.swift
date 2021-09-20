//
//  QuestionViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    
    //MARK: - Properties
    //var questions: [QuestionModel] = []
    let question = QuestionModel(question: "Se não era amor, o que era?", answer: ["paixão", "ódio", "ranço", "cilada, Bino"], answerCorrect: 3)
    var questionSelected: String?
    var indexSelected: IndexPath?
    
    
    //MARK: - Outlets
    @IBOutlet weak var AlternativeTabelView: UITableView!
    @IBOutlet weak var questionLabelView: UILabel!
    @IBOutlet weak var AnswerButton: UIButton!
    
    
    //MARK: - Actions
    @IBAction func handlerAnswerButton(_ sender: Any) {
        guard let indexSelected = indexSelected else {return}
        
        
        let indexPathCorrect = IndexPath(row: question.answerCorrect, section: 0)
        
        if let cellCorrect = AlternativeTabelView.cellForRow(at: indexPathCorrect) as? AnswerCell {
            cellCorrect.setStyle(.correct)}
       
        if let cellSelected = AlternativeTabelView.cellForRow(at: indexSelected) as? AnswerCell{
            let isCorrect = indexSelected.row != question.answerCorrect
            cellSelected.setStyle(isCorrect ? .incorrect : .correct)
       }
    }
 


    @IBAction func handlerSetTitleButton(_ sender: Any) {
    if indexSelected != nil {
        AnswerButton.setTitle("Próxima pergunta", for: .normal)
    } else {
        print("não clicou")
        }
    }
    //let viewController = HomeViewController()
    // navigationController?.pushViewController(viewController, animated: true)
  
    
        
    
    
    
        
    
    
    
   
        
    
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        answerButtonCornerRadius()
        questionLabelView.text = question.question
       /* var question: QuestionModel = Any
        //Questions List
        question = QuestionModel(question: "Se não era amor, o que era?", answer: ["paixão", "ódio", "ranço", "cilada, Bino"], answerCorrect: "cilada, Bino")
        questions.append (question)
        question = QuestionModel(question: "O Luiz Carlos do Raça Negra está com um problema. Ele precisa de ajuda para segurar", answer: ["A calça que está caindo", "O forninho", "Essa barra que é gostar de você", "As pontas"], answerCorrect: "Essa barra que é gostar de você")
        questions.append (question)*/
    }
    //MARK: - Methods
    func setupUI() {
        AlternativeTabelView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        AlternativeTabelView.dataSource = self
        AlternativeTabelView.delegate = self
        AlternativeTabelView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.answer.count // Tentar contar o answer do objeto question
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = question.answer[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as? AnswerCell {
            var style: AnswerCell.Style = .blank
            cell.setup(title: answer, style: .incorrect)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    questionSelected = question.answer[indexPath.row]
        indexSelected = indexPath
    }
    func answerButtonCornerRadius() {
            AnswerButton.layer.cornerRadius = 35
    }
    func buttonDisable() {
       
    }
}
