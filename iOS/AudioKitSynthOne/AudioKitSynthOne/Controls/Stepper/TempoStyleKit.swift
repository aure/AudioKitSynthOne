//
//  TempoStyleKit.swift
//  AudioKitSynthOne
//
//  Created by Matthew Fecher on 11/4/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

import UIKit

public class TempoStyleKit: NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawTempoStepper(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 82, height: 77), resizing: ResizingBehavior = .aspectFit, valuePressed: CGFloat = 0, text: String = "120 bpm") {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 82, height: 77), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 82, y: resizedFrame.height / 77)

        //// Color Declarations
        let selectedColor = UIColor(red: 0.369, green: 0.369, blue: 0.388, alpha: 1.000)
        let offColor = UIColor(red: 0.306, green: 0.306, blue: 0.325, alpha: 1.000)
        let btnBack = UIColor(red: 0.212, green: 0.208, blue: 0.216, alpha: 1.000)
        let textColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1.000)

        //// Variable Declarations
        let downSeleted = valuePressed == 1 ? selectedColor : offColor
        let upSelected = valuePressed == 2 ? selectedColor : offColor

        //// Button
        //// btnMinus Drawing
        let btnMinusPath = UIBezierPath(roundedRect: CGRect(x: 3.5, y: 38.5, width: 35, height: 32), cornerRadius: 1)
        downSeleted.setFill()
        btnMinusPath.fill()
        UIColor.black.setStroke()
        btnMinusPath.lineWidth = 1
        btnMinusPath.stroke()

        //// btnPlus Drawing
        let btnPlusPath = UIBezierPath(roundedRect: CGRect(x: 43.5, y: 38.5, width: 35, height: 32), cornerRadius: 1)
        upSelected.setFill()
        btnPlusPath.fill()
        UIColor.black.setStroke()
        btnPlusPath.lineWidth = 1
        btnPlusPath.stroke()

        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: 61.5, y: 54.5)
        context.rotate(by: -270 * CGFloat.pi / 180)

        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 3.5, y: -5.5))
        rectanglePath.addLine(to: CGPoint(x: -3.5, y: -0))
        rectanglePath.addLine(to: CGPoint(x: 3.5, y: 5.5))
        textColor.setFill()
        rectanglePath.fill()

        context.restoreGState()

        //// Rectangle 4 Drawing
        context.saveGState()
        context.translateBy(x: 20.5, y: 55.5)
        context.rotate(by: -90 * CGFloat.pi / 180)

        let rectangle4Path = UIBezierPath()
        rectangle4Path.move(to: CGPoint(x: 3.5, y: -5.5))
        rectangle4Path.addLine(to: CGPoint(x: -3.5, y: 0))
        rectangle4Path.addLine(to: CGPoint(x: 3.5, y: 5.5))
        textColor.setFill()
        rectangle4Path.fill()

        context.restoreGState()

        //// tempoBackground Drawing
        let tempoBackgroundRect = CGRect(x: 3.5, y: 0.5, width: 75, height: 33)
        let tempoBackgroundPath = UIBezierPath(roundedRect: tempoBackgroundRect, cornerRadius: 1)
        btnBack.setFill()
        tempoBackgroundPath.fill()
        UIColor.black.setStroke()
        tempoBackgroundPath.lineWidth = 1
        tempoBackgroundPath.stroke()
        let tempoBackgroundStyle = NSMutableParagraphStyle()
        tempoBackgroundStyle.alignment = .center
        let tempoBackgroundFontAttributes = [
            NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-Regular", size: 15)!,
            NSAttributedStringKey.foregroundColor: textColor,
            NSAttributedStringKey.paragraphStyle: tempoBackgroundStyle
        ]

        let tempoBackgroundTextHeight: CGFloat = text.boundingRect(with: CGSize(width: tempoBackgroundRect.width,
                                                                                height: CGFloat.infinity),
                                                                   options: .usesLineFragmentOrigin,
                                                                   attributes: tempoBackgroundFontAttributes,
                                                                   context: nil).height
        context.saveGState()
        context.clip(to: tempoBackgroundRect)
        text.draw(in: CGRect(x: tempoBackgroundRect.minX,
                             y: tempoBackgroundRect.minY + (tempoBackgroundRect.height - tempoBackgroundTextHeight) / 2,
                             width: tempoBackgroundRect.width, height: tempoBackgroundTextHeight),
                  withAttributes: tempoBackgroundFontAttributes)
        context.restoreGState()

        context.restoreGState()

    }

    @objc(TempoStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
