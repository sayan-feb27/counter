//
//  ViewController.swift
//  Counter
//
//  Created by Саян Бадарчы on 19.11.2023.
//

import UIKit

enum CounterAction {
    case reset
    case increase
    case decrease
}

class ViewController: UIViewController {

    private var _counter: Int = 0
    var counter: Int {
        get { return _counter }
        set {
            _counter = max(newValue, 0)
        }
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func increaseCounter(_ sender: Any) {
        changeCounter(action: .increase)
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        changeCounter(action: .decrease)
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        changeCounter(action: .reset)
    }
    
    func changeCounter(action: CounterAction) {
        var logEntry: String
        
        switch action {
        case .decrease:
            logEntry = counter - 1 < 0 ? "попытка уменьшить значение счётчика ниже 0" : "значение изменено на -1"
            counter = counter - 1 < 0 ? 0 : counter - 1
        case .increase:
            logEntry = "значение изменено на +1"
            counter += 1
        case .reset:
            logEntry = "значение сброшено"
            counter = 0
        }
        updateCounterText()
        logNewEntry(logEntry)
    }
    
    func updateCounterText() {
        counterLabel.text = counter > 0 ? "Значение счётчика: \(counter)" : "0"
    }
    
    func logNewEntry(_ entry: String) {
        let now = Date()
        historyTextView.text += "[\(now.formatted(date: .numeric, time: .shortened))]: \(entry)\n"
    }
}

