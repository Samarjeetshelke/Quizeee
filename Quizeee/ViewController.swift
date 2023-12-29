//
//  ViewController.swift
//  Quizeee
//
//  Created by AL14 on 29/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Scr: UILabel!
    @IBOutlet weak var QueNo: UILabel!
    @IBOutlet weak var Que: UILabel!
    
    @IBOutlet weak var Op2: UIButton!
    @IBOutlet weak var Op4: UIButton!
    @IBOutlet weak var Op3: UIButton!
    @IBOutlet weak var Op1: UIButton!
    
    
    @IBOutlet weak var Pre: UIButton!
    
    @IBOutlet weak var Save: UIButton!
    
    
    
    
    
    
    var QueCounter : Int = 0
    var Scorex = 0
    
    class Question{
        
        var ques : String!
        var ans : Int!
        
        var opt1 : String!
        var opt2 : String!
        var opt3 : String!
        var opt4 : String!
        
        var uc:Int
        
        var b1 = true
        var b2 = true
        var b3 = true
        var b4 = true
        
        init(){
            self.ques = "This is Question"
            self.ans = 2
            self.opt1 = "This isOption 1"
            self.opt2 = "This isOption 2"
            self.opt3 = "This isOption 3"
            self.opt4 = "This isOption 4"
            self.uc = -1
        }
        
        init(ques:String,ans:Int,opt1:String,opt2:String,opt3:String,opt4:String){
            self.ques = ques
            self.ans = ans
            self.opt1 = opt1
            self.opt2 = opt2
            self.opt3 = opt3
            self.opt4 = opt4
            self.uc = -1
        }
        
    }
    /*
    
    var x = Question(ques:"Which of the folowing is the only enven prime number?",ans:2,opt1: "4",opt2: "2",opt3: "7",opt4:"8");
    var y = Question(ques:"Which of the folowing is not the multiple of 7?",ans:1,opt1: "4",opt2: "14",opt3: "35",opt4:"28");
    var z = Question(ques:"Which of the folowing is not prime nor Composite?",ans:1,opt1: "1",opt2: "2",opt3: "7",opt4:"8");
    
    */
    
    var arrayx:[Question] = [Question(ques:"Which of the folowing is the only enven prime number?",ans:2,opt1: "4",opt2: "2",opt3: "7",opt4:"8"),
        Question(ques:"Which of the folowing is not the multiple of 7?",ans:1,opt1: "4",opt2: "14",opt3: "35",opt4:"28"),
        Question(ques:"Which of the folowing is not prime nor Composite?",ans:1,opt1: "1",opt2: "2",opt3: "7",opt4:"8"),
        Question(ques:"Which of the folowing Laguage was known as oak?",ans:4,opt1: "C",opt2: "Swift",opt3: "C++",opt4:"java"),
        Question(ques:"     ",ans:4,opt1: " ",opt2: " ",opt3: " ",opt4:" ")]
    
    

    
    @IBAction func NextQS(_ sender: Any) {
        removeColor()
        
        QueCounter = QueCounter + 1;
        
        if QueCounter == 3 {
            Save.setTitle("Submit",for: .normal)
        }
        if QueCounter >= 4{
            performSegue(withIdentifier: "res" , sender:self)
         
        }
       
        setQuestion(objx:arrayx[QueCounter])
        
        setUC()
        
        enaOrdis(ob: arrayx[QueCounter])
    }
    
    
    func setUC(){
        if arrayx[QueCounter].uc != -1{
            if(arrayx[QueCounter].uc == 1){
                Op1.backgroundColor = .green
            }else if(arrayx[QueCounter].uc == 2){
                Op2.backgroundColor = .green
            }else if(arrayx[QueCounter].uc == 3){
                Op3.backgroundColor = .green
            }
            else{
                Op4.backgroundColor = .green
            }
        }
    }
    
    
    @IBAction func PreQS(_ sender: Any) {
        if QueCounter-1 < 0 {
            return
        }
        else{
            QueCounter = QueCounter - 1
            setQuestion(objx: arrayx[QueCounter])
            removeColor()
            setUC()
        }
    }
    
    
    func UpdateScore(){
        Scorex = Scorex + 1
        Scr.text = "Score:\(Scorex)"
    }
    
    func enaOrdis(ob:Question){
        Op1.isEnabled = ob.b1
        Op2.isEnabled = ob.b2
        Op3.isEnabled = ob.b3
        Op4.isEnabled = ob.b4
    }
   
    
    
    
    func setQuestion(objx:Question){
        QueNo.text = "Question \(QueCounter+1)"
        Que.text = objx.ques
        Op1.setTitle(objx.opt1,for: .normal)
        Op2.setTitle(objx.opt2,for: .normal)
        Op3.setTitle(objx.opt3,for: .normal)
        Op4.setTitle(objx.opt4,for: .normal)
    }
    
    func setUserAns(objx:Question,uans:Int){
        objx.uc = uans
    }
    
    
    func removeColor(){
        Op1.backgroundColor = .cyan
        Op2.backgroundColor = .cyan
        Op3.backgroundColor = .cyan
        Op4.backgroundColor = .cyan
    }
    
    
    @IBAction func Opt1Clicked(_ sender: Any) {
        setUserAns(objx: arrayx[QueCounter], uans:1)
        
        if arrayx[QueCounter].ans == 1 {
            UpdateScore();
        }
        Op1.backgroundColor = .green
        
        var ob = arrayx[QueCounter]
        ob.uc =  1
        ob.b2 = false
        ob.b3 = false
        ob.b4 = false
        
    }
    
    
    @IBAction func Opt2Clicked(_ sender: Any) {
        setUserAns(objx: arrayx[QueCounter], uans:2)
        
        if arrayx[QueCounter].ans == 2 {
            UpdateScore();
        }
        Op2.backgroundColor = .green
        
        var ob = arrayx[QueCounter]
        
        ob.uc =  2
        ob.b1 = false
        ob.b3 = false
        ob.b4 = false
        
    }
    
    
    @IBAction func Opt3Clicked(_ sender: Any) {
        setUserAns(objx: arrayx[QueCounter], uans:3)
        
        if arrayx[QueCounter].ans == 3 {
            UpdateScore();
        }
        Op3.backgroundColor = .green
        
        var ob = arrayx[QueCounter]
        ob.uc =  3
        ob.b2 = false
        ob.b1 = false
        ob.b4 = false
    }
    
    @IBAction func Opt4Clicked(_ sender: Any) {
        setUserAns(objx: arrayx[QueCounter], uans:4)
        
        if arrayx[QueCounter].ans == 4 {
            UpdateScore();
        }
        Op4.backgroundColor = .green
        
        var ob = arrayx[QueCounter]
        ob.uc =  4
        ob.b2 = false
        ob.b3 = false
        ob.b1 = false
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion(objx: arrayx[QueCounter])
        // Do any additional setup after loading the view.
    }

    
   
}



class newclass : UIViewController {
   
    
    @IBOutlet weak var x: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
}

