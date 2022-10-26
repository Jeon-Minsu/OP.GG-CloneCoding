//
//  LabelBuilder.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2022/10/26.
//

import UIKit

final class LabelBuilder {
    
    // MARK: Properties
    
    private var label = UILabel()
    
    // MARK: - Initizliers
    
    init() {}
    
    // MARK: - Methods
    
    func build() -> UILabel {
        return label
    }
    
    func setupConstraintsAutomatic(_ bool: Bool) -> LabelBuilder {
        label.translatesAutoresizingMaskIntoConstraints = bool
        
        return self
    }
    
    func setupLabelText(
        text: String? = "",
        color: UIColor? = .label,
        alpha: CGFloat = 1
    ) -> LabelBuilder {
        label.text = text
        label.textColor = color
        label.alpha = alpha
        
        return self
    }
    
    func setupLabelTextAttributes(
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 1,
        font: UIFont.TextStyle = .body
    ) -> LabelBuilder {
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.font = .preferredFont(forTextStyle: font)
        
        return self
    }
    
    func setupLabelBackgroundColor(_ color: UIColor?) -> LabelBuilder {
        label.backgroundColor = color
        
        return self
    }
    
    func setupPriority(
        hugging: UILayoutPriority = .init(250),
        compression: UILayoutPriority = .init(750),
        axis: NSLayoutConstraint.Axis
    ) -> LabelBuilder {
        label.setContentHuggingPriority(hugging, for: axis)
        label.setContentCompressionResistancePriority(compression, for: axis)
        
        return self
    }
    
    func setupLayer(
        cornerRadius: CGFloat = 0,
        width: CGFloat = 0,
        color: CGColor? = UIColor.black.cgColor
    ) -> LabelBuilder {
        label.layer.cornerRadius = cornerRadius
        label.layer.borderWidth = width
        label.layer.borderColor = color
        
        return self
    }
    
    func setupClipsToBounds(_ bool: Bool) -> LabelBuilder {
        label.clipsToBounds = bool
        
        return self
    }
}

// MARK: - Extension

extension LabelBuilder {
    func setupMainCellTitleLabel(text: String) -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(text: text)
            .setupLabelTextAttributes(font: .title3)
        
        return builder
    }
    
    func setupMainCellDescriptionLabel(text: String) -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(text: text, color: Design.Color.descriptionLabelTextColor)
            .setupLabelTextAttributes(alignment: .center, numberOfLines: 2, font: .footnote)
        
        return builder
    }
    
    func setupSkinOnSaleLabel(textColor: UIColor?, font: UIFont.TextStyle = .caption2) -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(color: textColor)
            .setupLabelTextAttributes(font: font)
        
        return builder
    }
    
    func setupSaleDiscountRateLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(color: .white)
            .setupLabelTextAttributes(alignment: .center, font: .caption1)
            .setupLayer(cornerRadius: 5)
            .setupClipsToBounds(true)
            .setupLabelBackgroundColor(Design.Color.discountRateBackgroundColor)
        
        return builder
    }
    
    func setupTodayTMICellDescriptionLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(color: .label)
            .setupLabelTextAttributes(numberOfLines: 3)
        
        return builder
    }
    
    func setupSettingsStickyHeaderTitleLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(text: Design.settingsStickyHeaderTitleLabel, color: .label)
            .setupLabelTextAttributes(alignment: .left, font: .largeTitle)
        
        return builder
    }
    
    func setupSettingsTitleLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(text: Design.settingsTitleLabelText)
            .setupLabelTextAttributes(font: .headline)
            .setupPriority(hugging: .defaultHigh, axis: .horizontal)
        
        return builder
    }
    
    func setupSettingsIndicatorLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelText(text: Design.settingsIndicatorLabelText, color: .systemGray)
            .setupLabelTextAttributes(alignment: .right, font: .subheadline)
            .setupPriority(compression: .defaultLow, axis: .horizontal)
        
        return builder
    }
    
    func setupPushNotificationTitleLabel() -> LabelBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupLabelTextAttributes(font: .headline)
        
        return builder
    }
}

private enum Design {
    static let otherGamestitleLabelText = "다른 게임 전적 보기"
    static let settingsStickyHeaderTitleLabel = "설정"
    static let settingsTitleLabelText = "Title Label"
    static let settingsIndicatorLabelText = "Indicator Label"
    
    enum Color {
        static let descriptionLabelTextColor = UIColor(named: "IconColor")
        static let discountRateBackgroundColor = UIColor(named: "LoseColor")
    }
}