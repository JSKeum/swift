//
//  PlayingCardView.swift
//  playingCard
//
//  Created by JSKeum on 2019/10/15.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    
    var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    var suit: String = "❤️" { didSet { setNeedsDisplay(); setNeedsLayout()} }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout()} }

    private func centeredAttributedString(_ string: String, fontSize: CGFloat )-> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle:  paragraphStyle, .font: font])
        
    }
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(rankString+"\n"+suit, fontSize: cornerFontSize)
    }

    private lazy var upperLeftCornerLabel = createCornerLabel()
    private lazy var lowerRightCornerLabel = createCornerLabel()
    
    private func createCornerLabel() -> UILabel {
       let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    private func configureCornerLabel(_ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        
        label.sizeToFit()
        label.isHidden = !isFaceUp
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
    }
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
              roundedRect.addClip()
              UIColor.white.setFill()
              roundedRect.fill()
        

//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 120.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//        path.lineWidth = 20.0
//        UIColor.blue.setStroke()
//        UIColor.yellow.setFill()
//        path.stroke()
//        path.fill()
        
      
        
        // Drawing code
    }
    

}

extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusBoundsHeight: CGFloat = 0.04
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusBoundsHeight
    }
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    private var rankString: String {
        switch rank {
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return "?"
        }
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}
