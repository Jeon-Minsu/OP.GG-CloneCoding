//
//  CustomButtonBuilder.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit

final class CustomButtonBuilder {

    // MARK: Properties

    private var button = UIButton()

    // MARK: - Initizliers

    init() {}

    // MARK: - Methods

    func build() -> UIButton {
        return button
    }

    func setupConstraintsAutomatically(_ bool: Bool) -> CustomButtonBuilder {
        button.translatesAutoresizingMaskIntoConstraints = bool

        return self
    }

    func setupColor(
        tint: UIColor? = .systemBackground,
        background: UIColor? = .systemBackground
    ) -> CustomButtonBuilder {
        button.tintColor = tint
        button.backgroundColor = background

        return self
    }

    func setupImage(
        image: UIImage?,
        state: UIControl.State = .normal,
        textStyle: UIFont.TextStyle = .body,
        scale: UIImage.SymbolScale = .default
    ) -> CustomButtonBuilder {
        button.setImage(image, for: state)
        button.setPreferredSymbolConfiguration(.init(textStyle: textStyle, scale: scale), forImageIn: state)

        return self
    }

    func setupTitle(
        name: String?,
        state: UIControl.State = .normal,
        font: UIFont? = UIFont().withSize(12),
        color: UIColor? = .black
    ) -> CustomButtonBuilder {
        button.setTitle(name, for: state)
        button.titleLabel?.font = font
        button.setTitleColor(color, for: state)

        return self
    }

    func setupInset(
        titleInset: UIEdgeInsets,
        contentInset: UIEdgeInsets
    ) -> CustomButtonBuilder {
        button.titleEdgeInsets = titleInset
        button.contentEdgeInsets = contentInset

        return self
    }

    func setupPriority(
        hugging: UILayoutPriority = .init(250),
        compression: UILayoutPriority = .init(750),
        axis: NSLayoutConstraint.Axis
    ) -> CustomButtonBuilder {
        button.setContentHuggingPriority(hugging, for: axis)
        button.setContentCompressionResistancePriority(compression, for: axis)

        return self
    }

    func setupLayer(
        cornerRadius: CGFloat = 0,
        width: CGFloat = 0,
        color: CGColor? = UIColor.black.cgColor
    ) -> CustomButtonBuilder {
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = width
        button.layer.borderColor = color

        return self
    }

    func setupSemanticContentAttribute(direction: UISemanticContentAttribute) -> CustomButtonBuilder {
        button.semanticContentAttribute = direction

        return self
    }

    func setupHorizontalAlignment(direction: UIControl.ContentHorizontalAlignment) -> CustomButtonBuilder {
        button.contentHorizontalAlignment = direction

        return self
    }
}

// MARK: - Extension

extension CustomButtonBuilder {
    func setupLanguageButton() -> CustomButtonBuilder {
        let builder = self
            .setupConstraintsAutomatically(false)
            .setupColor(tint: Design.Color.language, background: Design.Color.sub)
            .setupImage(image: Design.Image.chevronDown)
            .setupTitle(name: "KR", font: .preferredFont(forTextStyle: .headline), color: Design.Color.language)
            .setupInset(titleInset: Design.Inset.languageButtonTitle, contentInset: Design.Inset.languageButtonContent)
            .setupPriority(hugging: .defaultHigh, compression: .defaultHigh, axis: .horizontal)
            .setupLayer(cornerRadius: Design.laguageButtonCornerRadius)
            .setupSemanticContentAttribute(direction: .forceRightToLeft)

        return builder
    }

    func setupSortButton() -> CustomButtonBuilder {
        let builder = self
            .setupConstraintsAutomatically(false)
            .setupPriority(hugging: .defaultHigh, compression: .defaultHigh, axis: .horizontal)
            .setupImage(image: Design.Image.sortIcon)

        return builder
    }

    func setupSearchButton() -> CustomButtonBuilder {
        let builder = self
            .setupConstraintsAutomatically(false)
            .setupColor(tint: Design.Color.language)
            .setupImage(image: Design.Image.search, textStyle: .title3, scale: .default)
            .setupTitle(name: Design.searchButtonTitle, font: .preferredFont(forTextStyle: .footnote), color: Design.Color.language)
            .setupInset(titleInset: Design.Inset.summonerSearchButtonTitle, contentInset: Design.Inset.summonerSearchButtonContent)
            .setupPriority(hugging: .defaultHigh, compression: .defaultHigh, axis: .horizontal)
            .setupLayer(cornerRadius: Design.laguageButtonCornerRadius, width: Design.languageButtonLayerWidth, color: Design.Color.layer)
            .setupHorizontalAlignment(direction: .left)

        return builder
    }
}

private enum Design {
    enum Color {
        static let main = UIColor(named: "PrimitiveColor")
        static let sub = UIColor(named: "SecondaryColor")
        static let sortIcon = UIColor(named: "IconColor") ?? .systemBackground
        static let language = UIColor(named: "LanguageColor")
        static let layer = language?.cgColor.copy(alpha: 0.5)
    }

    enum Image {
        static let logo = UIImage(named: "OP.GGMainLogo")
        static let sortIcon = UIImage(named: "SortIcon")?.withTintColor(Color.sortIcon)
        static let chevronDown = UIImage(systemName: "chevron.down")
        static let search = UIImage(systemName: "magnifyingglass")
    }

    enum Inset {
        static let languageButtonTitle = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        static let languageButtonContent = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 8)
        static let summonerSearchButtonTitle = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        static let summonerSearchButtonContent = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)
    }

    static let searchButtonTitle = "소환사 검색"
    static let laguageButtonCornerRadius: CGFloat = 4
    static let languageButtonLayerWidth: CGFloat = 1
}
