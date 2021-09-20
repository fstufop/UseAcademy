//
//  HomeViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class HomeViewController: UIViewController {


        //MARK: - Properties
        
        
        //MARK: - Outlets
        @IBOutlet weak var welcomeView: UIView!
        @IBOutlet weak var startButtonView: UIButton!
    
        
        //MARK: - Actions
        @IBAction func handlerButtonStarGame(_ sender: Any) {
            let viewController = QuestionViewController()
            
            navigationController?.pushViewController(viewController, animated: true)
    }
        //toDo - add button action to questions
        
        //MARK: - Overrides
        override func viewDidLoad() {
            super.viewDidLoad()
            welcomeViewCornerRadius()
            startButtonViewCornerRadius()
            title = "Perguntas e respostas"
    }
        //MARK: - Methods
        func welcomeViewCornerRadius() {
        welcomeView.layer.cornerRadius = 40
    }
        func startButtonViewCornerRadius() {
        startButtonView.layer.cornerRadius = 35
    }
}