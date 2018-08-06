//
//  ViewController.swift
//  RealmTest
//
//  Created by Kohei Adachi on 2018/07/30.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    let realmData = RealmStudent()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        realmData.id = 1
        realmData.age = 20
        realmData.name = "John"
//        self.save()
        self.read()
        print(Realm.Configuration.defaultConfiguration.fileURL!)//リレーションファイルの場所
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func update(_ sender: Any) {
        update()
        
    }
    // データを保存するための処理
    func save() {
        do {
            let realm = try Realm()  // Realmのインスタンスを作成します。
            try! realm.write {
                realm.add(self.realmData)  // 作成した「realm」というインスタンスにrealmDataを書き込みます。
            }
        } catch {
            print("Exception error")
        }
    }
    
    // データを更新するための処理
    func update() {
        do {
            let realm = try! Realm()
            let obj = realm.object(ofType: RealmStudent.self, forPrimaryKey: 1)
            try! realm.write {
                obj?.name = "aaaaa"
                print("udpate")
            }
        } catch {
            
        }
    }
    
    // データを削除するための処理
    func delete() {
        do {
            let realm = try! Realm()
            let data = realm.objects(RealmStudent.self).last!
            try realm.write {
                realm.delete(data)  //「RealStudent」というモデルの中のデータを削除します。
            }
        } catch {
            
        }
    }
    func read(){ //レコード取得
        do {
            let realm = try! Realm()
//            let obj = realm.objects(RealmStudent.self).last!
            let obj = try? realm.object(ofType: RealmStudent.self, forPrimaryKey: 2)
            print(obj??.name)
            print(obj??.age)
//            print(obj?.name)
//            print(obj?.age)
        } catch  {
            print("")
        }
    }
    
    
    
}
    



