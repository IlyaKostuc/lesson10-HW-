//
//  ViewController.swift
//  lesson10(HW)
//
//

import UIKit

enum Operation {
    case division
    case multiplication
    case minus
    case plus
}

class ViewController: UIViewController {
    
    // MARK: - Private properties
    private var colorDeafault: UIColor { #colorLiteral(red: 1, green: 0.5834030509, blue: 0.006479345262, alpha: 1) }
    private var operation: Operation?
    private var firstValue: Int = 0
    private var secondValue: Int = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    @IBOutlet var numberCalculator: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - IBActions
    @IBAction func numbers(_ sender: UIButton) {
        guard var value = lblNumber.text else { return }
        
        if lblNumber.text!.count < 15 {
            value += "\(sender.tag)"
            lblNumber.text = value
        }
    }
    
    @IBAction func tapPlus(_ sender: UIButton) {
        guard let value = lblNumber.text, let valueInt = Int(value) else { return }
        
        firstValue = Int(valueInt)
        
        lblNumber.text = ""
        operation = .plus
        
        plus.backgroundColor = .white
        plus.tintColor = colorDeafault
    }
    
    @IBAction func tapMinus(_ sender: UIButton) {
        guard let value = lblNumber.text, let valueInt = Int(value) else { return }
        
        firstValue = Int(valueInt)
        
        operation = .minus
        lblNumber.text = ""
        
        minus.backgroundColor = .white
        minus.tintColor = colorDeafault
    }
    
    @IBAction func tapMultiplication(_ sender: UIButton) {
        guard let value = lblNumber.text, let valueInt = Int(value) else { return }
        
        firstValue = Int(valueInt)
        
        operation = .multiplication
        lblNumber.text = ""
        
        multiplication.backgroundColor = .white
        multiplication.tintColor = colorDeafault
    }
    
    @IBAction func tapDivision(_ sender: UIButton) {
        guard let value = lblNumber.text, let valueInt = Int(value) else { return }
        
        firstValue = Int(valueInt)
        
        operation = .division
        lblNumber.text = ""
        
        division.backgroundColor = .white
        division.tintColor = colorDeafault
    }
    
    @IBAction func tapModule(_ sender: UIButton) {
        
    }
    
    @IBAction func tapEquals(_ sender: UIButton) {
        guard let value = lblNumber.text, let valueInt = Int(value) else { return }
        
        secondValue = Int(valueInt)
        
        equal.tintColor = colorDeafault
        equal.backgroundColor = .white
        
        plus.backgroundColor = colorDeafault
        plus.tintColor = .white
        
        minus.backgroundColor = colorDeafault
        minus.tintColor = .white
        
        multiplication.backgroundColor = colorDeafault
        multiplication.tintColor = .white
        
        division.backgroundColor = colorDeafault
        division.tintColor = .white
        
        
        //MARK: - Operation
        switch operation {
        case .division:
            if firstValue != 0 && secondValue != 0 {
                let result = firstValue / secondValue
                lblNumber.text = "\(result)"
            }
        case .multiplication:
            let result = firstValue * secondValue
            lblNumber.text = "\(result)"
        case .minus:
            let result = firstValue - secondValue
            lblNumber.text = "\(result)"
        case .plus:
            let result = firstValue + secondValue
            lblNumber.text = "\(result)"
        case .none:
            break
        }
    }
    
    @IBAction func tapDeleteNumber(_ sender: UIButton) {
        lblNumber.text = ""
        
        equal.tintColor = .white
        equal.backgroundColor = colorDeafault
        
        plus.backgroundColor = colorDeafault
        plus.tintColor = .white
        
        minus.backgroundColor = colorDeafault
        minus.tintColor = .white
        
        multiplication.backgroundColor = colorDeafault
        multiplication.tintColor = .white
        
        division.backgroundColor = colorDeafault
        division.tintColor = .white
    }
    
    @IBAction func comma(_ sender: UIButton) {
        guard var value = lblNumber.text else { return }
        
        value += ","
        lblNumber.text = value
        
        sender.isEnabled = false
    }
    
    // MARK: - Private methods
    private func setupUI() {
        for view in numberCalculator {
            view.layer.cornerRadius = 35
        }
        lblNumber.font = .systemFont(ofSize: 70)
        view.backgroundColor = .black
    }
}
