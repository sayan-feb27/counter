//
//  ViewController.swift
//  Counter
//
//  Created by Саян Бадарчы on 19.11.2023.
//

import UIKit

class ViewController: UIViewController {

    private var _counter: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(_counter)"
        }
    }
    var counter: Int {
        get { return _counter }
        set {
            _counter = max(newValue, 0)
        }
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func increaseCounter(_ sender: Any) {
        counter += 1
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        counter -= 1
    }
    
}

