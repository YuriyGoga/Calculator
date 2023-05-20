//
//  ViewController.swift
//  Calculator
//
//  Created by FILIN INTEND on 18.05.2023.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    @objc func onOne() { addDigit("1") }
    @objc func onTwo() { addDigit("2") }
    @objc func onThree() { addDigit("3") }
    @objc func onFour() { addDigit("4") }
    @objc func onFive() { addDigit("5") }
    @objc func onSix() { addDigit("6") }
    @objc func onSeven() { addDigit("7") }
    @objc func onEight() { addDigit("8") }
    @objc func onNine() { addDigit("9") }
    @objc func onZero() { addDigit("0") }
    @objc func onAC() {
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        resultLabel.text = "0"
    }
    @objc func onNegative() { addDigit("0") }
    @objc func onPercent() { addDigit("0") }
    @objc func onDivision() {
        operation = .divide
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @objc func onMultiply() {
        operation = .multiply
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @objc func onMinus() {
        operation = .substract
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @objc func onPlus() {
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @objc func onComma() { addDigit(",") }
    @objc func onResult() { calculate() }

    
//MARK: - Calculator properties
    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Int = 0
    var newValue: Int = 0
    
//MARK: - Calculation Functions

    func getInteger() -> Int {
        return Int(resultLabel.text!) ?? 0
    }

    func calculate() {
        guard let operation = operation else { return }
        if previousOperation != operation {
            newValue = getInteger()
        }
        result = operation.makeOperation(result: result, newValue: newValue)
        previousOperation = operation
        resultLabel.text = "\(result)"
        isNewValue = true
    }

    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
        var digits = resultLabel.text
        digits?.append(digit)
        resultLabel.text = digits
    }
    
//MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(resultLabel)
        makeConstraints()
        initialize()
    }
    
//MARK: - Create Label
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.labelCalculator
        label.textColor = .white
        label.font = Constants.Fonf.fontLabel
        return label
    }()
    
    func makeConstraints() {
        resultLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().inset(200)
        }
    }
    //MARK: - Create Buttons
    func createButtons(setTitle: String, backgroundColor: UIColor?) -> UIButton {
        let button = UIButton()
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgroundColor ?? .white
        button.layer.cornerRadius = 35
        button.titleLabel?.font = Constants.Fonf.fontNumbers
        return button
    }
    
    //MARK: - Create StackViews
    func createStackViews(but1: UIButton?, but2: UIButton?, but3: UIButton?, but4: UIButton?) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.backgroundColor = .black
        stackView.addArrangedSubview(but1 ?? UIButton())
        stackView.addArrangedSubview(but2 ?? UIButton())
        stackView.addArrangedSubview(but3 ?? UIButton())
        stackView.addArrangedSubview(but4 ?? UIButton())
        return stackView
        
    }

   
//MARK: - Create Buttons
    
func initialize() {
         
    let buttonAC = createButtons(setTitle: "AC", backgroundColor: Constants.Colors.colorOptions)
    buttonAC.addTarget(self, action: #selector(onAC), for: .touchUpInside)
    let buttonNegative = createButtons(setTitle: "+/-", backgroundColor: Constants.Colors.colorOptions)
    buttonNegative.addTarget(self, action: #selector(onNegative), for: .touchUpInside)
    let buttonPercent = createButtons(setTitle: "%", backgroundColor: Constants.Colors.colorOptions)
    buttonPercent.addTarget(self, action: #selector(onPercent), for: .touchUpInside)
    let buttonDivision = createButtons(setTitle: "/", backgroundColor: Constants.Colors.colorOptions)
    buttonDivision.addTarget(self, action: #selector(onDivision), for: .touchUpInside)
    let stackViewAC = createStackViews(but1: buttonAC, but2: buttonNegative, but3: buttonPercent, but4: buttonDivision)
    view.addSubview(stackViewAC)
    stackViewAC.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(330)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
    let buttonSeven = createButtons(setTitle: "7", backgroundColor: Constants.Colors.colorNumbers)
    buttonSeven.addTarget(self, action: #selector(onSeven), for: .touchUpInside)
    let buttonEight = createButtons(setTitle: "8", backgroundColor: Constants.Colors.colorNumbers)
    buttonEight.addTarget(self, action: #selector(onEight), for: .touchUpInside)
    let buttonNine = createButtons(setTitle: "9", backgroundColor: Constants.Colors.colorNumbers)
    buttonNine.addTarget(self, action: #selector(onNine), for: .touchUpInside)
    let buttonMultiply = createButtons(setTitle: "X", backgroundColor: Constants.Colors.colorOptions)
    buttonMultiply.addTarget(self, action: #selector(onMultiply), for: .touchUpInside)
    let stackView7 = createStackViews(but1: buttonSeven, but2: buttonEight, but3: buttonNine, but4: buttonMultiply)
    view.addSubview(stackView7)
    stackView7.snp.makeConstraints { make in
            make.top.equalTo(stackViewAC.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
    let buttonFour = createButtons(setTitle: "4", backgroundColor: Constants.Colors.colorNumbers)
    buttonFour.addTarget(self, action: #selector(onFour), for: .touchUpInside)
    let buttonFive = createButtons(setTitle: "5", backgroundColor: Constants.Colors.colorNumbers)
    buttonFive.addTarget(self, action: #selector(onFive), for: .touchUpInside)
    let buttonSix = createButtons(setTitle: "6", backgroundColor: Constants.Colors.colorNumbers)
    buttonSix.addTarget(self, action: #selector(onSix), for: .touchUpInside)
    let buttonMinus = createButtons(setTitle: "-", backgroundColor: Constants.Colors.colorOptions)
    buttonMinus.addTarget(self, action: #selector(onMinus), for: .touchUpInside)
    let stackView4 = createStackViews(but1: buttonFour, but2: buttonFive, but3: buttonSix, but4: buttonMinus)
    view.addSubview(stackView4)
    stackView4.snp.makeConstraints { make in
            make.top.equalTo(stackView7.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
    let buttonOne = createButtons(setTitle: "1", backgroundColor: Constants.Colors.colorNumbers)
    buttonOne.addTarget(self, action: #selector(onOne), for: .touchUpInside)
    let buttonTwo = createButtons(setTitle: "2", backgroundColor: Constants.Colors.colorNumbers)
    buttonTwo.addTarget(self, action: #selector(onTwo), for: .touchUpInside)
    let buttonThree = createButtons(setTitle: "3", backgroundColor: Constants.Colors.colorNumbers)
    buttonThree.addTarget(self, action: #selector(onThree), for: .touchUpInside)
    let buttonPlus = createButtons(setTitle: "+", backgroundColor: Constants.Colors.colorOptions)
    buttonPlus.addTarget(self, action: #selector(onPlus), for: .touchUpInside)
    let stackView1 = createStackViews(but1: buttonOne, but2: buttonTwo, but3: buttonThree, but4: buttonPlus)
    view.addSubview(stackView1)
    stackView1.snp.makeConstraints { make in
            make.top.equalTo(stackView4.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }

        
    let buttonZero = createButtons(setTitle: "0", backgroundColor: Constants.Colors.colorNumbers)
    buttonZero.addTarget(self, action: #selector(onZero), for: .touchUpInside)
    let buttonComma = createButtons(setTitle: ",", backgroundColor: Constants.Colors.colorOptions)
    buttonComma .addTarget(self, action: #selector(onComma), for: .touchUpInside)
    let buttonResult = createButtons(setTitle: "=", backgroundColor: Constants.Colors.colorNumbers)
    buttonResult.addTarget(self, action: #selector(onResult), for: .touchUpInside)
    let stackView0 = createStackViews(but1: nil, but2: nil, but3: buttonComma, but4: buttonResult)
    view.addSubview(stackView0)
    view.addSubview(buttonZero)
    stackView0.snp.makeConstraints { make in
            make.top.equalTo(stackView1.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
    buttonZero.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(80)
            make.left.equalToSuperview()
            make.top.equalTo(stackView1.snp.bottom).inset(-16)
        }
    
    }
   


}

//MARK: - Constants property

enum Constants{
    enum Colors {
        static var colorNumbers: UIColor? { UIColor(named: "Numbers")}
        static var colorOptions: UIColor? { UIColor(named: "Options")}
    }

    enum Fonf {
        static var fontNumbers: UIFont? { UIFont.systemFont(ofSize: 38)}
        static var fontLabel: UIFont? { UIFont.systemFont(ofSize: 100)}
    }
    enum Label{
        static var labelCalculator = "0"
    }
}


enum MathOperation {
    case sum, substract, multiply, divide
    
    func makeOperation(result: Int, newValue: Int) -> Int {
        switch self{
        case.sum: return (result + newValue)
        case.substract: return (result - newValue)
        case.multiply: return (result * newValue)
        case.divide: return (result / newValue)
        }
    }
}
