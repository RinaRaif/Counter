//
//  ViewController.swift
//  Counter
//
//  Created by Рина Райф on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var history = "История изменений:\n"

    let currentDate = Date()
    var dateFormatter = DateFormatter()
    var formattedDate: String = ""
    
    @IBOutlet weak var ButtonSub: UIButton!
    @IBOutlet weak var ButtonAdd: UIButton!
    @IBOutlet weak var ButtonReset: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textHistory: UITextView!
    
     func updateHistoryLabel(with text: String) {
        history += "\(text)\n"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "Значение счетчика: \(count)"
        textHistory.text = "\(history)"
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
       
        // Do any additional setup after loading the view.
    }

    @IBAction func buttotAdd(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счетчика: \(count)"
        
        let currentDate = Date()
        formattedDate = dateFormatter.string(from: currentDate)
        
        updateHistoryLabel(with: "Текущая дата и время: \(formattedDate) значение изменено на +1")
         textHistory.text = history

    }
    @IBAction func buttonSub(_ sender: Any) {
        if count > 0 {
            count -= 1
            countLabel.text = "Значение счетчика: \(count)"
            
            let currentDate = Date()
            formattedDate = dateFormatter.string(from: currentDate)

            updateHistoryLabel(with: "Текущая дата и время: \(formattedDate) значение изменено на -1")
            textHistory.text = history

        } else {
            updateHistoryLabel(with: "Текущая дата и время: \(formattedDate) попытка уменьшить значение счётчика ниже 0")
                    textHistory.text = history
        }
    }
    @IBAction func buttonReset(_ sender: Any) {
        count = 0
        countLabel.text = "Значение счетчика: \(count)"
        
        let currentDate = Date()
        formattedDate = dateFormatter.string(from: currentDate)

        updateHistoryLabel(with: "Текущая дата и время: \(formattedDate) значение сброшено")
            textHistory.text = history
    }
 
}


