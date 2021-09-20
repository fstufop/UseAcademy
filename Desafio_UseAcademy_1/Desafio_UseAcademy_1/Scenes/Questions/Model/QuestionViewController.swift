//
//  QuestionViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    
    //MARK: - Properties
    var questions: [QuestionModel]
    var indexQuestions: Int = 0
    var countCorrectAnswer: Int = 0
    init(questions: [QuestionModel]) {
        self.questions = questions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Outlets
    @IBOutlet weak var AlternativeTabelView: UITableView!
    @IBOutlet weak var questionLabelView: UILabel!
    @IBOutlet weak var AnswerButton: UIButton!
    
    //MARK: - Actions
    @IBAction func handlerAnswerButton(_ sender: Any) {
        
        if questions[indexQuestions].isAnswer {
            indexQuestions += 1
            if indexQuestions < questions.count {
                questionLabelView.text = questions[indexQuestions].quiz
                AlternativeTabelView.reloadData()
                answerButtonDisable()
            } else {
                
                let viewController = ResultViewController(countCorrects: countCorrectAnswer, total: questions.count)
                navigationController?.pushViewController(viewController, animated: true)
            }
            
          
        }
        else{
        
            for indexAnswer in 0..<questions[indexQuestions].answer.count {
                
                if indexAnswer == questions[indexQuestions].answerCorrect {
                    if questions[indexQuestions].answer[indexAnswer].style == .selected {
                        countCorrectAnswer += 1
                    }
                    print(countCorrectAnswer)
                    questions[indexQuestions].answer[indexAnswer].style = .correct
                   
                }
                else if questions[indexQuestions].answer[indexAnswer].style == .selected {
                    questions[indexQuestions].answer[indexAnswer].style = .incorrect
                }
            }
            AlternativeTabelView.reloadData()
            questions[indexQuestions].isAnswer = true
            
            if indexQuestions < questions.count - 1 {
                AnswerButton.setTitle("Próxima pergunta", for: .normal)
            } else {
                AnswerButton.setTitle("Ver Resultado", for: .normal)
            }
        }
    }
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.backBarButtonItem?.title = nil
    }
    //MARK: - Methods
    func setupUI() {
        answerButtonDisable()
        title = "Perguntas e respostas"
        questionLabelView.text = questions[indexQuestions].quiz
        AlternativeTabelView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        AlternativeTabelView.dataSource = self
        AlternativeTabelView.delegate = self
        AlternativeTabelView.reloadData()
        AnswerButton.layer.cornerRadius = 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[indexQuestions].answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = questions[indexQuestions].answer[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as? AnswerCell {
            cell.setup(model: answer)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if questions[indexQuestions].isAnswer {
            return
        }
        
        
        for indexAnswer in 0..<questions[indexQuestions].answer.count {
            questions[indexQuestions].answer[indexAnswer].style = indexAnswer == indexPath.row ? .selected : .blank
        }
        
        AnswerButton.isEnabled = true
        AnswerButton.backgroundColor = UIColor(red: 94/255, green: 130/255, blue: 249/255, alpha: 1)
        tableView.reloadData()
    }
    func answerButtonDisable() {
        AnswerButton.isEnabled = false
        AnswerButton.backgroundColor = .gray
        AnswerButton.setTitle("Responder", for: .normal)
    }
    
}
