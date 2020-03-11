//
//  ViewController.swift
//  Challenge81FixedWidthFlexibleHeight
//
//  Created by Herve Desrosiers on 2020-03-11.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ViewMetrics {
        static let labelFontSize: CGFloat = 24.0
        static let buttonFontSize: CGFloat = 18.0
        static let spacing: CGFloat = 8.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(engineStackView)
        let margin = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            engineStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            engineStackView.topAnchor.constraint(equalTo: margin.topAnchor),
            engineStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
        ])
    }
    
    private let titleLabel = UILabel.customLabel(text: "Engine Power", backgroundColor: .white, font: .systemFont(ofSize: ViewMetrics.labelFontSize))
    private let lowButton: UIButton = {
        let title = NSLocalizedString("Low", comment: "Low")
        let button = UIButton.makeButton(title: title, color: .red, fontSize: ViewMetrics.buttonFontSize)
        return button
    }()
    private let mediumButton: UIButton = {
        let title = NSLocalizedString("Medium", comment: "Medium")
        let button = UIButton.makeButton(title: "Medium", color: .yellow, fontSize: ViewMetrics.buttonFontSize)
        return button
    }()
    private let highButton: UIButton = {
        let title = NSLocalizedString("High", comment: "High")
        let button = UIButton.makeButton(title: "High", color: .green, fontSize: ViewMetrics.buttonFontSize)
        return button
    }()
    
    private lazy var engineStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, lowButton, mediumButton, highButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = ViewMetrics.spacing
        return sv
    }()

}

extension UILabel {
    static func customLabel(text: String, backgroundColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = backgroundColor
        label.font = font
        label.numberOfLines = 0
        return label
    }
}

private extension UIButton {
    static func makeButton(title: String, color: UIColor, fontSize: CGFloat) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return button
    }
}
