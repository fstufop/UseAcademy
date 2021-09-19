//
//  ResultViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class ResultViewController: UIViewController {


    //MARK: - Properties
    
    
    //MARK: - Outlets
    @IBOutlet weak var resultDisplayView: UIView!
    @IBOutlet weak var resultDisplayLabel: UILabel!
    
    //MARK: - Actions
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas e respostas"
        resultDisplayViewCornerRadius()
    }
    
    //MARK: - Methods
    func resultDisplayViewCornerRadius() {
            resultDisplayView.layer.cornerRadius = 40
    }
}
