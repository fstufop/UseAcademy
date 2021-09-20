//
//  AnswerModel.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import Foundation


//MARK: - Properties
struct QuestionModel {
    var quiz: String
    var answer: [AnswerModel]
    let answerCorrect: Int
    var isAnswer: Bool = false
    
}
struct AnswerModel {
    enum Style {
        case blank
        case selected
        case correct
        case incorrect
    }
    
    var name: String
    var style: Style
    
}
