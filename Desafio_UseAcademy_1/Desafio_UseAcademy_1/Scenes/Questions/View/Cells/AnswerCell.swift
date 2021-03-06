//
//  AnswerCell.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class AnswerCell: UITableViewCell {
    //MARK: - Properties

    //MARK: - Outlets

    @IBOutlet weak var alternativeLabel: UILabel!
    @IBOutlet weak var alternativeViewBackgound: UIView!
    @IBOutlet weak var checkbox: UIImageView!
    
    //MARK: - Actions
    
    
    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Methods
    func setup(model: AnswerModel){
        
        alternativeLabel.text = model.name
        
        alternativeViewBackgound.layer.cornerRadius = 15
        alternativeViewBackgound.layer.borderWidth = 1

        setStyle(model.style)
    }
    func setStyle(_ style: AnswerModel.Style) {
        switch style {
        case .blank:
            alternativeViewBackgound.backgroundColor = .white
            alternativeViewBackgound.layer.borderColor = UIColor.gray.cgColor
            alternativeLabel.textColor = .black
            checkbox.tintColor = .blue
            if #available(iOS 13.0, *) {
                checkbox.image = UIImage(systemName: "square")
            } else {
                // Fallback on earlier versions
            }
        case .selected:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 117/255, green: 140/255, blue: 255/255, alpha: 0.2)
            alternativeViewBackgound.layer.borderColor = UIColor.blue.cgColor
            alternativeLabel.textColor = UIColor.init(red: 96/255, green: 97/255, blue: 255/255, alpha: 1)
            checkbox.tintColor = .blue
            if #available(iOS 13.0, *) {
                checkbox.image = UIImage(systemName: "checkmark.square.fill")
            } else {
                // Fallback on earlier versions
            }
        case .correct:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 145/255, green: 226/255, blue: 149/255, alpha: 0.1)
            alternativeViewBackgound.layer.borderColor = UIColor.green.cgColor
            alternativeLabel.textColor = UIColor.init(red: 56/255, green: 197/255, blue: 61/255, alpha: 1)
            checkbox.tintColor = .green
            if #available(iOS 13.0, *) {
                checkbox.image = UIImage(systemName: "checkmark.square.fill")
            } else {
                // Fallback on earlier versionscheckmark.square.fill
            }
        case .incorrect:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 251/255, green: 101/255, blue: 174/255, alpha: 0.2)
            alternativeViewBackgound.layer.borderColor = UIColor.red.cgColor
            alternativeLabel.textColor = UIColor.init(red: 245/255, green: 101/255, blue: 103/255, alpha: 1)
            checkbox.tintColor = .red
            if #available(iOS 13.0, *) {
                checkbox.image = UIImage(systemName: "square.split.diagonal.2x2.fill")
            } else {
                // Fallback on earlier versionscheckmark.square.fill
            }
            
        }
    }
}
