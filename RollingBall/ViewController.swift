//
//  ViewController.swift
//  RollingBall
//
//  Created by Van Ho Si on 9/27/17.
//  Copyright © 2017 Van Ho Si. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let duration: TimeInterval = 0.01
    let imageBall = UIImage(named: "ball.png")
    var ball = UIImageView()
    var radians: CGFloat = 0.0
    let dentaAngle: CGFloat = 0.1
    var ballRadious: CGFloat = 0.0
    var check: Bool = false
    
    var methodMove: String = ""
    var posisionXX: CGFloat = 0
    var positionYY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBall()
        self.rollingBall()
        
        
//        Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(self.rollingBall), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(self.rollingBallAdvance), userInfo: nil, repeats: true)
    }

    func addBall(){
        ball = UIImageView(image: imageBall)
        ballRadious = 32.0
        ball.center = CGPoint(x: ball.frame.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
//        ball.center = CGPoint(x: self.view.bounds.size.width - ball.frame.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        self.view.addSubview(ball)
    }
    
    @objc func rollingBall(){
        var positionX: CGFloat = 0
        if(ball.center.x <= ballRadious){
            check = false
        }else if(ball.center.x + ballRadious >= self.view.bounds.size.width){
            check = true
        }
        
        if(!check){
            radians = radians + dentaAngle
            positionX = ball.center.x + dentaAngle * ballRadious
            
        }else{
            radians = radians - dentaAngle
            positionX = ball.center.x - dentaAngle * ballRadious
        }
        
        ball.transform = CGAffineTransform.init(rotationAngle: radians)
        self.ball.center = CGPoint(x: positionX, y: ball.center.y)
        
    }
    
    @objc func rollingBallAdvance(){
        
        switch methodMove {
            case "down":
                
                radians = radians - dentaAngle
                positionYY = ball.center.y + dentaAngle * ballRadious
                if(ball.center.y + ballRadious >= self.view.bounds.size.height){
                    methodMove = "left"
                }
                
                break
            
            case "left":
                
                radians = radians - dentaAngle
                posisionXX = ball.center.x - dentaAngle * ballRadious
                if(ball.center.x <= ballRadious){
                    methodMove = "up"
                }
                
                break
            
            case "up":
                
                radians = radians - dentaAngle
                positionYY = ball.center.y - dentaAngle * ballRadious
                if(ball.center.y <= ballRadious){
                    methodMove = "right"
                }
                
                break
            
            case "right":
                
                radians = radians - dentaAngle
                posisionXX = ball.center.x + dentaAngle * ballRadious
                if(ball.center.x + ballRadious >= self.view.bounds.size.width){
                    methodMove = "down"
                }
                
                break
            
            default:
                
                radians = radians + dentaAngle
                posisionXX = ball.center.x + dentaAngle * ballRadious
                positionYY = ball.center.y
                if(ball.center.x + ballRadious >= self.view.bounds.size.width){
                    methodMove = "down"
                }
                
                break
        }
        
        ball.transform = CGAffineTransform.init(rotationAngle: radians)
        self.ball.center = CGPoint(x: posisionXX, y: positionYY)
    }
    
}

