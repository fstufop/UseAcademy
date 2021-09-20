//
//  ResultViewController.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class ResultViewController: UIViewController {


    //MARK: - Properties
    let countCorrects: Int
    let total: Int
    let tryAgainbuttonUnderline: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    init(countCorrects: Int, total: Int) {
        self.countCorrects = countCorrects
        self.total = total
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Outlets
    @IBOutlet weak var resultDisplayView: UIView!
    @IBOutlet weak var resultDisplayLabel: UILabel!
    @IBOutlet weak var tryAgainLabel: UIButton!
    
    //MARK: - Actions
    @IBAction func handlerTryAgainButton(_ sender: Any) {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perguntas e respostas"
        setupUI()
        resultDisplayLabel.text = "\(countCorrects)/\(total) Acertos"
        navigationItem.hidesBackButton = true 
    }
    
    //MARK: - Methods
    func setupUI(){
        let attributeTryAgainButton = NSMutableAttributedString(
                string: "Tentar novamente",
                attributes: tryAgainbuttonUnderline
        )
        tryAgainLabel.setAttributedTitle(attributeTryAgainButton, for: .normal)
        resultDisplayView.layer.cornerRadius = 40
    }
    
}
