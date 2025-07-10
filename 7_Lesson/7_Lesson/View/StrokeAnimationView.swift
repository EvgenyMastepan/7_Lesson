//
//  StrokeAnimationView.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import UIKit

class StrokeAnimationView: UIView {
    
    //MARK: --  ОПять экспериментальная дичь с анимацией.
    
    private var strokeLayers: [CAShapeLayer] = []
    private var currentStroke = 0
    private var animationTimer: Timer?
    private var completion: (() -> Void)?
    
    func animate(strokeOrder: [String], duration: TimeInterval = 0.8, completion: (() -> Void)? = nil) {
        reset()
        self.completion = completion
        
        // Создаем слои для каждой черты
        strokeOrder.forEach { path in
            let layer = CAShapeLayer()
            layer.path = createPath(from: path).cgPath
            layer.strokeColor = UIColor.white.cgColor
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = 3
            layer.lineCap = .round
            layer.lineJoin = .round
            layer.strokeEnd = 0
            self.layer.addSublayer(layer)
            strokeLayers.append(layer)
        }
        
        animateNextStroke()
    }
    
    private func createPath(from string: String) -> UIBezierPath {
        let path = UIBezierPath()
        let points = string.components(separatedBy: " ").map {
            $0.replacingOccurrences(of: "M", with: "")
             .replacingOccurrences(of: "L", with: "")
             .components(separatedBy: ",")
        }
        
        if points.count > 1 {
            path.move(to: pointFrom(points[0]))
            for i in 1..<points.count {
                path.addLine(to: pointFrom(points[i]))
            }
        }
        
        return path
    }
    
    private func pointFrom(_ pair: [String]) -> CGPoint {
        let x = CGFloat(Double(pair[0]) ?? 0)
        let y = CGFloat(Double(pair[1]) ?? 0)
        return CGPoint(x: x, y: y)
    }
    
    private func animateNextStroke() {
        guard currentStroke < strokeLayers.count else {
            currentStroke = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.completion?()
                self.animateNextStroke() // Цикличность
            }
            return
        }
        
        let layer = strokeLayers[currentStroke]
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.currentStroke += 1
            self.animateNextStroke()
        }
        layer.strokeEnd = 1
        layer.add(animation, forKey: "stroke")
        CATransaction.commit()
    }
    // Обновляем
    func reset() {
        strokeLayers.forEach { $0.removeFromSuperlayer() }
        strokeLayers.removeAll()
        currentStroke = 0
        animationTimer?.invalidate()
    }
}
