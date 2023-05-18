//
//  ViewController.swift
//  Calculator
//
//  Created by FILIN INTEND on 18.05.2023.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
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
    
    private func initialize() {
        view.backgroundColor = .black
        let labelCalculator = UILabel()
        labelCalculator.text = "0"
        labelCalculator.textColor = .white
        labelCalculator.font = Constants.Fonf.fontLabel
        view.addSubview(labelCalculator)
        labelCalculator.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(220)
        }
        
    
        let buttonAC = createButtons(setTitle: "AC", backgroundColor: Constants.Colors.colorOptions)
        let buttonNegative = createButtons(setTitle: "+/-", backgroundColor: Constants.Colors.colorOptions)
        let buttonPercent = createButtons(setTitle: "%", backgroundColor: Constants.Colors.colorOptions)
        let buttonDivision = createButtons(setTitle: "/", backgroundColor: Constants.Colors.colorOptions)
        let stackViewAC = createStackViews(but1: buttonAC, but2: buttonNegative, but3: buttonPercent, but4: buttonDivision)
        view.addSubview(stackViewAC)
        stackViewAC.snp.makeConstraints { make in
            make.top.equalTo(labelCalculator.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
        let buttonSeven = createButtons(setTitle: "7", backgroundColor: Constants.Colors.colorNumbers)
        let buttonEight = createButtons(setTitle: "8", backgroundColor: Constants.Colors.colorNumbers)
        let buttonNine = createButtons(setTitle: "9", backgroundColor: Constants.Colors.colorNumbers)
        let buttonMultiply = createButtons(setTitle: "X", backgroundColor: Constants.Colors.colorOptions)
        let stackView7 = createStackViews(but1: buttonSeven, but2: buttonEight, but3: buttonNine, but4: buttonMultiply)
        view.addSubview(stackView7)
        stackView7.snp.makeConstraints { make in
            make.top.equalTo(stackViewAC.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
        let buttonFour = createButtons(setTitle: "4", backgroundColor: Constants.Colors.colorNumbers)
        let buttonFive = createButtons(setTitle: "5", backgroundColor: Constants.Colors.colorNumbers)
        let buttonSix = createButtons(setTitle: "6", backgroundColor: Constants.Colors.colorNumbers)
        let buttonMinus = createButtons(setTitle: "-", backgroundColor: Constants.Colors.colorOptions)
        let stackView4 = createStackViews(but1: buttonFour, but2: buttonFive, but3: buttonSix, but4: buttonMinus)
        view.addSubview(stackView4)
        stackView4.snp.makeConstraints { make in
            make.top.equalTo(stackView7.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }
        
        
        let buttonOne = createButtons(setTitle: "1", backgroundColor: Constants.Colors.colorNumbers)
        let buttonTwo = createButtons(setTitle: "2", backgroundColor: Constants.Colors.colorNumbers)
        let buttonThree = createButtons(setTitle: "3", backgroundColor: Constants.Colors.colorNumbers)
        let buttonPlus = createButtons(setTitle: "+", backgroundColor: Constants.Colors.colorOptions)
        let stackView1 = createStackViews(but1: buttonOne, but2: buttonTwo, but3: buttonThree, but4: buttonPlus)
        view.addSubview(stackView1)
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(stackView4.snp.bottom).inset(-16)
            make.left.equalToSuperview()
            make.height.equalTo(80)
            make.right.equalToSuperview()
        }

        
        let buttonZero = createButtons(setTitle: "0", backgroundColor: Constants.Colors.colorNumbers)
        let buttonComma = createButtons(setTitle: ",", backgroundColor: Constants.Colors.colorOptions)
        let buttonResult = createButtons(setTitle: "=", backgroundColor: Constants.Colors.colorNumbers)
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
enum Constants{
    enum Colors {
        static var colorNumbers: UIColor? { UIColor(named: "Numbers")}
        static var colorOptions: UIColor? { UIColor(named: "Options")}
    }

    enum Fonf {
        static var fontNumbers: UIFont? { UIFont.systemFont(ofSize: 38)}
        static var fontLabel: UIFont? { UIFont.systemFont(ofSize: 100)}
    }
}



