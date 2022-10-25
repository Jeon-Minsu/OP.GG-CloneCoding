//
//  SettingsCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import SwiftUI

final class PushNotificationCell: UITableViewCell, CellCustomizable {
    
    // MARK: Properties
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let gameInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private let communityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private let separtorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Design.languageColor
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        
        return label
    }()
    
    private let firstContentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondContentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let firstContentSwitchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = .systemBlue
        
        return switchButton
    }()
    
    private let secondContentSwitchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = .systemBlue
        
        return switchButton
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupContent(with indexPath: IndexPath) {
        setupTitleLabel(with: SettingSection(rawValue: indexPath.section)?.array[0])
        setupFirstContentTitleLabel(with: SettingSection(rawValue: indexPath.section)?.array[1])
        setupSecondContentTitleLabel(with: SettingSection(rawValue: indexPath.section)?.array[2])
    }
    
    func setupTitleAttributes(font: UIFont?, color: UIColor?) {
        setupTitleFont(font)
        setupTitleColor(color)
    }
    
    private func setupTitleLabel(with text: String?) {
        titleLabel.text = text
    }
    
    private func setupFirstContentTitleLabel(with text: String?) {
        firstContentTitleLabel.text = text
    }
    
    private func setupSecondContentTitleLabel(with text: String?) {
        secondContentTitleLabel.text = text
    }
    
    private func setupTitleFont(_ font: UIFont?) {
        titleLabel.font = font
    }
    
    private func setupTitleColor(_ color: UIColor?) {
        titleLabel.textColor = color
    }
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.secondaryColor)
        setupUserInterationEnabled(false)
        setupSelectionStyle(.none)
    }
    
    private func setupSubviews() {
        addSubview(totalStackView)
        [titleLabel, gameInformationStackView, separtorView, communityStackView]
            .forEach { totalStackView.addArrangedSubview($0) }
        [firstContentTitleLabel, firstContentSwitchButton]
            .forEach { gameInformationStackView.addArrangedSubview($0) }
        [secondContentTitleLabel, secondContentSwitchButton]
            .forEach { communityStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            totalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            totalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            totalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            separtorView.heightAnchor.constraint(equalToConstant: 0.2)
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupUserInterationEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }
    
    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = .none
    }
}

// MARK: - Namespace

private enum Design {
    static let languageColor = UIColor(named: "LanguageColor")
    static let secondaryColor = UIColor(named: "SecondaryColor")
}