//
//  ViewController.swift
//  Counter
//
//  Created by Artem Krasnov on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var resetCountButton: UIButton!
    
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
    
    @IBAction private func plusCount(_ sender: UIButton) {
        playAnimateButton(sender: sender)
        countResult+=1
        resultLabel.text = messageResult
        historyTextView.text += getHistoryMessage(count: "+1")
        scrollTextViewToBottom(textView: historyTextView)
    }
    
    @IBAction private func minusCount(_ sender: UIButton) {
        playAnimateButton(sender: sender)
        if countResult == 0 {
            historyTextView.text += "\n\(currentDate): попытка уменьшить значение счётчика ниже 0"
            scrollTextViewToBottom(textView: historyTextView)
            return
        }
        countResult-=1
        resultLabel.text = messageResult
        historyTextView.text += getHistoryMessage(count: "-1")
        scrollTextViewToBottom(textView: historyTextView)
    }
    
    @IBAction private func resetCount() {
        countResult = 0
        resultLabel.text = "0"
        historyTextView.text += "\n\(currentDate): значение сброшено"
        scrollTextViewToBottom(textView: historyTextView)
    }
    
    private func scrollTextViewToBottom(textView: UITextView) {
        UIView.animate(withDuration: 0.3) {
            textView.alpha = 0.5
        }
        
        let bottom = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible(bottom)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
            UIView.animate(withDuration: 0.3) {
                textView.alpha = 1.0
            }
        }
    }
    
    private func playAnimateButton(sender: UIButton) -> Void {
        UIView.animate(withDuration: 0.3) {
            sender.alpha = 0.5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0
            }
        }
    }
}

