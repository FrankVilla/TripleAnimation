//
//  ViewController.swift
//  Animation Loop
//
//  Created by KOVIGROUP on 23/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a circle shape layer
        let circleLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(circleLayer)
        
        
        // create a square shape layer
        let squareLayer = CAShapeLayer()
        let squarePath = UIBezierPath(rect: CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 100, height: 100))
        squareLayer.path = squarePath.cgPath
        squareLayer.fillColor = UIColor.green.cgColor
        
        
        // create a triangle shape layer
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: view.center.x, y: view.center.y - 50))
        trianglePath.addLine(to: CGPoint(x: view.center.x - 50, y: view.center.y + 50))
        trianglePath.addLine(to: CGPoint(x: view.center.x + 50, y: view.center.y + 50))
        trianglePath.close()
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor.blue.cgColor
        
        // animate the layers in a loop
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = circlePath.cgPath
        animation.toValue = squarePath.cgPath
        animation.duration = 10.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        circleLayer.add(animation, forKey: "circleToSquare")
        
        animation.fromValue = squarePath.cgPath
        animation.toValue = trianglePath.cgPath
        triangleLayer.add(animation, forKey: "squareToTriangle")
        
        // add the layers to the view's layer hierarchy
        view.layer.addSublayer(squareLayer)
        view.layer.addSublayer(triangleLayer)
        view.layer.addSublayer(circleLayer)
    }
}

