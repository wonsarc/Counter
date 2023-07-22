//
//  ViewController.swift
//  Counter
//
//  Created by Artem Krasnov on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var resetCountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var countResult: Int = 0
    private var messageResult: String {
        return "Значение счётчика: \(countResult)"
    }
    private var currentDate: String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: currentDateTime)
    }
    
    private func getHistoryMessage(count: String) -> String {
        return "\n\(currentDate): значение изменено на \(count)"
    }
    
    @IBAction func plusCount(_ sender: Any) {
        countResult+=1
        resultLabel.text = messageResult
        historyTextView.text += getHistoryMessage(count: "+1")    }
    
    @IBAction func minusCount(_ sender: Any) {
        if countResult == 0 {
            historyTextView.text += "\n\(currentDate): попытка уменьшить значение счётчика ниже 0"
            return
        }
        countResult-=1
        resultLabel.text = messageResult
        historyTextView.text += getHistoryMessage(count: "-1")
    }
    
    @IBAction func resetCount() {
        countResult = 0
        resultLabel.text = "0"
        historyTextView.text += "\n\(currentDate): значение сброшено"
    }
}
