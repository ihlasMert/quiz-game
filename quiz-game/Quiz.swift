//
//  Quiz.swift
//  quiz-game
//
//  Created by ihlas on 11.01.2022.
//

import Foundation
import UIKit
class Quiz: UIViewController{
    var qNo = 0
    var score = 0
    var quizArray = [
        Question(qNo: 0, qString: "Ankara istanbulun başkentidir!", qAnswer: true),
        Question(qNo: 0, qString: "Norveç cennetdir", qAnswer: true),
        Question(qNo: 0, qString: "İnsan insan olarak yaşamak zorunda", qAnswer: true),
        Question(qNo: 0, qString: "Dünya sonsuz mu", qAnswer: false),
        Question(qNo: 0, qString: "Mesele iktisat mı?", qAnswer: true),
        Question(qNo: 0, qString: "Altın yüksek maden mi?", qAnswer: true),
        Question(qNo: 0, qString: "Dünya güzel yer değil!", qAnswer: true),
        Question(qNo: 0, qString: "Ankara istanbulun başkentidir!", qAnswer: true),
        Question(qNo: 0, qString: "Belirsizlik kötü şey", qAnswer: true),
        Question(qNo: 0, qString: "Kazakıstan afrikada", qAnswer: false),
       
    ]
    
    

    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var QView: UIView!
    @IBOutlet var QNLabel: UILabel!
    @IBOutlet var QStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizArray.shuffle()
        qNo = 0
        questionTextView.text = quizArray[qNo].qString
        QNLabel.text = "Question \(qNo + 1)"
    }
    
    
    @IBAction func trueButton(_ sender: Any) {
        if quizArray[qNo].qAnswer == true{
            progressView.progress = progresBar()
            score += 1
            self.trueButton.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.trueButton.backgroundColor  = UIColor.systemTeal
                
            }
            qNo += 1
            if qNo < 10{
                QNLabel.text = "Question \(qNo + 1):"
                questionTextView.text = quizArray[qNo].qString
            }else{
                showResultMessage()
            }
        }
    }
    @IBAction func falseButton(_ sender: Any) {
        if quizArray[qNo].qAnswer == false{
            progressView.progress = progresBar()
            score += 1
            self.falseButton.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.falseButton.backgroundColor = UIColor.systemTeal
            
    }
            qNo += 1
            if qNo < 10{
                QNLabel.text = "Question \(qNo + 1):"
                questionTextView.text = quizArray[qNo].qString
            }else{
                showResultMessage()
            }

        
        
    }else{
        progressView.progress = progresBar()
        questionTextView.text = quizArray[qNo].qString
        self.falseButton.backgroundColor = UIColor.red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.falseButton.backgroundColor = UIColor.systemTeal
        }
        qNo += 1
        if qNo<10{
            QNLabel.text = "Question \(qNo + 1):"
            questionTextView.text = quizArray[qNo].qString
        }else{
            showResultMessage()
        }
        }
    }

func progresBar() -> Float{
    return Float (qNo + 1) / Float(quizArray.count)
}
func showResultMessage(){
    let alert = UIAlertController(title: "QuizResult", message: "Your score is:\(score)/10", preferredStyle: UIAlertController.Style.alert)
    let closeAction = UIAlertAction(title: "OK", style:UIAlertAction.Style.default) { _ in
        
        self.navigationController?.popViewController(animated: true)
        
    }
    alert.addAction(closeAction)
    self.present(alert, animated: true, completion: nil)
}
}
