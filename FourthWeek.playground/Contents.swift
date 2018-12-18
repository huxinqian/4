import UIKit
import PlaygroundSupport

/*
 *文件缓存处理
 */
let manager = FileManager.default
let docPath = manager.urls(for: .documentDirectory, in: .userDomainMask).first?.path
//输出Documentw路径，方便查看
print(docPath!)

//图片文件夹
let file = docPath?.appending("/image")

//若该文件夹存在，访问图片文件
if manager.fileExists(atPath: file!){
    let img = file?.appending("/img.png") //图片文件
    if(manager.fileExists(atPath: img!)){
        //图片存在、则显示在界面上来
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: img!))
            let image = UIImage(data: data)
            let imgView = UIImageView(image: image)
            imgView.frame = CGRect(x: 0, y: 100, width: 400, height: 300)
            imgView.image = image
            UIImageView.addSubview(imgView)
        }catch{
            print(error)
        }
    }
    else{
        //图片不存在，从网络上面重新下载一个图片放入
        let url = URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
        do{
            let data = try Data(contentsOf: url!)
            try data.write(to: URL(fileURLWithPath: img!),options: .atomicWrite)
            print("文件不存在，已重新创建")
        }catch{
            print(error)
        }
    }
}
    //文件夹不存在，重新创建文件夹
else{
    do{
        try manager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
        print("文件夹不存在，已重新创建")
    }catch{
        print(error)
    }
}


/*
 *自定制视图
 */
//创建自定义的UIView
class MyView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setStroke()//蓝色边界
        path.stroke()

        UIColor.yellow.setFill()//黄色填充
        path.fill()

        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
    }
}

//在ViewController中使用自定义的UIView创建一个椭圆
let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 400))//定义一个View
view.backgroundColor = UIColor.purple
let oval = MyView(frame: CGRect(x: 100, y: 100, width: 250, height: 200))//自制椭圆
oval.backgroundColor = UIColor.clear
view.addSubview(oval)



