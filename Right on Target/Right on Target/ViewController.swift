//
//  ViewController.swift
//  Right on Target
//
//  Created by Georgiy on 06.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // загаданное число
    var number = 0
    
    // раунд
    var round = 1
    
    // сумма очков за раунд
    var points = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func checkNumber(_ sender: Any) {
 
        let numSlider = Int(slider.value)
            
        if numSlider > number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50 }
            
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена",
                                          message: "Вы заработали \(self.points) очков",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
            
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        number = Int.random(in: 1...50)
        label.text = String(number)
        print("viewDidLoad")
    }
}
