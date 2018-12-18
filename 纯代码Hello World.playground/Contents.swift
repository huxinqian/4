import UIKit

/*
 *代码版Hello World
 */
class ViewController: UIViewController{
    var label :UILabel!
    var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 1000))//定义一个View
        secondView.backgroundColor = UIColor.blue
        
        //创建label
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 44))
        label.text = "hello Swift"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        secondView.addSubview(label)
        
        //创建button
        btn = UIButton(frame: CGRect(x: 100, y: 400, width: 50, height: 37))
        btn.setTitle("Click", for: .normal)
        btn.backgroundColor = UIColor.brown
        btn.setTitleColor(UIColor.black, for: .highlighted)
        secondView.addSubview(btn)
        
        btn.addTarget(self,action: #selector(clicked),for: .touchUpInside)
    }
    @IBAction func clicked(){
        if label.text! == "Clicked"{
            label.text = "Hello World!"
            btn.setTitle("Click", for: .normal)
        }else{
            label.text = "Clicked"
            btn.setTitle("Hello", for: .normal)
        }
    }
}

