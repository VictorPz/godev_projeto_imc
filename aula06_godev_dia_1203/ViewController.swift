//
//  ViewController.swift
//  aula06_godev_dia_1203
//
//  Created by Victor Pizetta on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var imc: Double = 0
    
    //MARK: - IBOutlets
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var resultadoTitleLabel: UILabel!
    @IBOutlet weak var resultadoMessageLabel: UILabel!
    @IBOutlet weak var visualIndicator: UIImageView!
    @IBOutlet weak var resultStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultStackView.isHidden = true
        delegates()
    }
    
    func delegates() {
        pesoTextField.delegate = self
        alturaTextField.delegate = self
    }
    
    //MARK: -IBAction
    
    @IBAction func calcularButton(_ sender: UIButton) {
        
        if let peso = Double(pesoTextField.text!), let altura = Double(alturaTextField.text!), altura > 0 {
            imc = peso / (altura*altura)
            resultados()
        }
    }
    
    func resultados() {
        
        var message: String = ""
        var isHidden = false
        
        switch imc {
            case ..<0:
            isHidden = true
            case  0..<18.5:
            message = "Você está abaixo do seu peso ideal"
            visualIndicator.tintColor = .warning
            case 18.5...24.9:
            message = "Você está no seu peso ideal"
            visualIndicator.tintColor = .ideal
            case 25.0...29.9:
            message = "Você está com sobrepeso"
            visualIndicator.tintColor = .warning
            message = "Você está com obesidade GRAU 1"
            visualIndicator.tintColor = .danger
            case 35...39.9:
            message = "Você está com obesidade GRAU 2"
            visualIndicator.tintColor = .danger
            default:
            message = "Você está com obesidade GRAU 3"
            visualIndicator.tintColor = .danger
        }
        resultadoTitleLabel.text = "O seu IMC é: \(String(format: "%.1f", imc))"
        resultadoMessageLabel.text = message
        resultStackView.isHidden = isHidden
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension UIColor {
    
    static let warning: UIColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    static let ideal: UIColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    static let danger: UIColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    
}
