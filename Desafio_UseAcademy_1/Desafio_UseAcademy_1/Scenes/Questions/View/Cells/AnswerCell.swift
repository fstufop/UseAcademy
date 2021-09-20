//
//  AnswerCell.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

class AnswerCell: UITableViewCell {
    //MARK: - Properties
    enum Style {
        case blank
        case selected
        case correct
        case incorrect
    }
    var style: Style = .blank
    //MARK: - Outlets

    @IBOutlet weak var alternativeLabel: UILabel!
    @IBOutlet weak var alternativeViewBackgound: UIView!
    
    
    //MARK: - Actions
    
    
    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        alternativeViewBackgound.backgroundColor = selected ? UIColor.init(red: 117/255, green: 140/255, blue: 255/255, alpha: 0.5) : .white
        alternativeViewBackgound.layer.borderColor = selected ? UIColor.purple.cgColor : UIColor.gray.cgColor
    }
    
    //MARK: - Methods
    func setup(title: String, style: Style){
        alternativeLabel.text = title
        
        alternativeViewBackgound.layer.cornerRadius = 15
        alternativeViewBackgound.layer.borderWidth = 1
        
        setStyle(style)
    }
    func setStyle(_ style: Style) {
        switch style {
        case .blank:
            alternativeViewBackgound.backgroundColor = .white
            alternativeViewBackgound.layer.borderColor = UIColor.gray.cgColor
        case .selected:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 117/255, green: 140/255, blue: 255/255, alpha: 0.5)
            alternativeViewBackgound.layer.borderColor = UIColor.purple.cgColor
        case .correct:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 145/255, green: 226/255, blue: 149/255, alpha: 0.5)
            alternativeViewBackgound.layer.borderColor = UIColor.green.cgColor
        case .incorrect:
            alternativeViewBackgound.backgroundColor = UIColor.init(red: 251/255, green: 174/255, blue: 174/255, alpha: 0.5)
            alternativeViewBackgound.layer.borderColor = UIColor.red.cgColor
        }
        
    }
}
