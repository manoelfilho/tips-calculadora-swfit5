import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorTip()
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPercentual: Int = 0
    
    override func viewDidLoad() {
        tenPcButton.isSelected = true
        selectedPercentual = 10
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.titleLabel?.text! == "0%" {
            
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
            selectedPercentual = 0
            
        }else if sender.titleLabel?.text! == "10%" {
            
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
            selectedPercentual = 10
            
        }else{
            
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
            selectedPercentual = 20
            
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        
        let valueOfBill = Float(billTextField.text ?? "0")
        let numberOfPersons = Int(splitNumberLabel.text ?? "0")
        let percentual = selectedPercentual
        
        if valueOfBill != nil {
            calculatorBrain.calculate(valueOfBill!, numberOfPersons!, percentual)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultController
            destinationVC.tip = calculatorBrain.tip
        }
    }
    
}

