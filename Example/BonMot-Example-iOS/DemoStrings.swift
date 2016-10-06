//
//  DemoStrings.swift
//
//  Created by Brian King on 8/26/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import BonMot

enum DemoStrings {
    static let colorString = NSAttributedString.composed(of: [
        "I want to be different. If everyone is wearing ",
        " black, ".styled(with: .color(.white),
                          .backgroundColor(.black),
                          .font(UIFont(name: "SuperClarendon-Black", size: 20)!)),
        " I want to be wearing ",
        " red. ".styled(with: .color(.white),
                        .backgroundColor(.raizlabsRed),
                        .font(UIFont(name: "SuperClarendon-Black", size: 20)!)),
        "\nMaria Sharapova ".styled(with: .color(.raizlabsRed),
                                    .font(UIFont(name: "SuperClarendon-Black", size: 20)!)),
        UIImage(named: "Tennis Racket")!.styled(with:
            .color(.raizlabsRed), .baselineOffset(-4.0))
        ], baseStyle: .style(
            .font(UIFont(name: "GillSans-Light", size: 20)!),
            .lineHeightMultiple(1.8),
            .color(.darkGray)
        ))

    static let colorStringXML: NSAttributedString = {
        let content = "I want to be different. If everyone is wearing <black> black, </black> I want to be wearing <red> red. </red>\n<signed>Maria Sharapova</signed> <racket/>"
        let racket = UIImage(named: "Tennis Racket")!.styled(with:
            .color(.raizlabsRed), .baselineOffset(-4.0))

        return content.styled(with: .style(
                .font(UIFont(name: "GillSans-Light", size: 20)!),
                .lineHeightMultiple(1.8),
                .color(.darkGray),
                .xmlRules([
                    .style("black", .style(
                        .color(.white),
                        .backgroundColor(.black),
                        .font(UIFont(name: "SuperClarendon-Black", size: 20)!)
                        )),
                    .style("red", .style(
                        .color(.white),
                        .backgroundColor(.raizlabsRed),
                        .font(UIFont(name: "SuperClarendon-Black", size: 20)!)
                        )),
                    .style("signed", .style(
                        .color(.raizlabsRed),
                        .font(UIFont(name: "SuperClarendon-Black", size: 20)!)
                        )),
                    .enter(element: "racket", insert: racket)
                    ])
            )
        )
    }()

    static let trackingString = "Adults are always asking kids what they want to be when they grow up because they are looking for ideas.\n—Paula Poundstone"
        .styled(with: .tracking(.adobe(300)),
                .font(UIFont(name: "Avenir-Book", size: 18)!),
                .adapt(.control))

    static let lineHeightString = "I used to love correcting people’s grammar until I realized what I loved more was having friends.\n—Mara Wilson"
        .styled(with: .font(UIFont(name: "AmericanTypewriter", size: 17.0)!),
                .lineHeightMultiple(1.8),
                .adapt(.control)
    )

    static let proportionalStyle = AttributedStringStyle.style(
        .font(UIFont(name: "EBGaramond12-Regular", size: 24)!),
        .adapt(.control)
    )

    static let proportionalStrings: [NSAttributedString] = [
        "Proportional Uppercase\n1111111111\n0123456789".styled(with: proportionalStyle.derive(
            .fontFeature(NumberSpacing.proportional),
            .fontFeature(NumberCase.upper))),
        "Proportional Lowercase\n1111111111\n0123456789".styled(with: proportionalStyle.derive(
            .fontFeature(NumberSpacing.proportional),
            .fontFeature(NumberCase.lower))),
        "Monospaced Uppercase\n1111111111\n0123456789".styled(with: proportionalStyle.derive(
            .fontFeature(NumberSpacing.monospaced),
            .fontFeature(NumberCase.upper))),
        "Monospaced Lowercase\n1111111111\n0123456789".styled(with: proportionalStyle.derive(
            .fontFeature(NumberSpacing.monospaced),
            .fontFeature(NumberCase.lower))),
        ]

    static let indentationStrings: [NSAttributedString] = [
        NSAttributedString.composed(of: [
            UIImage(named: "robot")!,
            Tab.headIndent(4.0),
            "“It’s OK to ask for help. When doing a final exam, all the work must be yours, but in engineering, the point is to get the job done, and people are happy to help. Corollaries: You should be generous with credit, and you should be happy to help others.”"
            ], baseStyle: .style(
                .font(UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)!),
                .adapt(AdaptiveStyle.control)
        )),
        NSAttributedString.composed(of: [
            "🍑 →",
            Tab.headIndent(4.0),
            "You can also use strings (including emoji) for bullets as well, and they will still properly indent the appended text by the right amount."
            ], baseStyle: .style(
                .font(UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)!),
                .color(.darkGray),
                .adapt(AdaptiveStyle.control)
        )),
        ({
            let style = AttributedStringStyle.style(
                .font(UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)!),
                .adapt(AdaptiveStyle.control)
            )
            let bullet = NSAttributedString.composed(of: ["🍑 →", Tab.headIndent(4.0)])
            let rules: [XMLStyleRule] = [
                .style("li", style),
                .enter(element: "li", insert: bullet),
                .exit(element: "li", insert: "\n")
            ]

            let xml = "<li>This row is defined with XML</li><li>Each row is represented with an &lt;li&gt; tag</li><li>Attributed strings define the string to use for bullets</li><li>The text style is also specified for the &lt;li&gt; tags</li>"
            guard let string = try? NSAttributedString.composed(ofXML: xml, rules: rules) else {
                fatalError("Unable to load XML \(xml)")
            }
            return string
        })()
    ]

    static let imageString = NSAttributedString.composed(of: [
        "2".styled(with: .baselineOffset(8)),
        UIImage(named: "bee")!,
        UIImage(named: "oar")!,
        UIImage(named: "knot")!,
        "2".styled(with: .baselineOffset(8)),
        UIImage(named: "bee")!
        ], baseStyle: .style(
            .font(UIFont(name: "HelveticaNeue-Bold", size: 24)!),
            .adapt(.control)
        ))

    static let noSpaceTextStyle = AttributedStringStyle.style(
        .font(.systemFont(ofSize: 17)),
        .adapt(.control),
        .color(.darkGray),
        .baselineOffset(10)
    )
    static let noSpaceString = NSAttributedString.composed(
        of: [
            ("barn", "This"),
            ("bee", "string"),
            ("bug", "is"),
            ("circuit", "separated"),
            ("cut", "by"),
            ("discount", "images"),
            ("gift", "and"),
            ("pin", "no-break"),
            ("robot", "spaces"),
            ].map() {
                return NSAttributedString.composed(of: [UIImage(named: $0)!, Special.noBreakSpace, $1.styled(with: noSpaceTextStyle)]) },
        separator: " ")

    static let heartsString = NSAttributedString.composed(of: (0..<20).makeIterator().map() { i in
        let offset: CGFloat = 15 * sin((CGFloat(i) / 20.0) * 7.0 * CGFloat(M_PI))
        return "❤️".styled(with: .baselineOffset(offset))
    })

    static func CustomStoryboard(identifier theIdentifier: String) -> AttributedStringStyle {
        // Embed an attribute for the storyboard identifier to link to. This is
        // a good example of custom attributes, even if this might not be the best
        // UIKit design pattern.
        return AttributedStringStyle.style(.initialAttributes(["Storyboard": theIdentifier]))
    }

    static let dynamcTypeUIKit = DemoStrings.CustomStoryboard(identifier: "CatalogViewController")
        .attributedString(from: "Dynamic UIKit elements with custom fonts")
    static let preferredFonts = DemoStrings.CustomStoryboard(identifier: "PreferredFonts")
        .attributedString(from: "Preferred Fonts")

}
