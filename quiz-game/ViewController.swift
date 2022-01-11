//
//  ViewController.swift
//  quiz-game
//
//  Created by ihlas on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Quiz") as? Quiz
        if let viewController = vc {
           navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

