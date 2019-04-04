//
//  URLSchemes.swift
//  URLSchemes
//
//  Created by mac on 2019/4/4.
//  Copyright © 2019 Jason. All rights reserved.
//

import UIKit

//key:LSApplicationQueriesSchemes

public class URLSchemes: NSObject {
    
    lazy var models = [schemesModel]()
    
    public func checkApp(completion:@escaping ((_ apps:[String])->())) {
        
        var apps = [String]()
        
        loadURLSchemes {[weak self] in
            
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                
                for model in self.models{
                    
                    let url = URL(string: "\(model.schemes ?? "")://")!
                    
                    if UIApplication.shared.canOpenURL(url) {
                        apps.append(model.app ?? "")
                    }
                    
                    
                }
                
                completion(apps)
                
            }
            
        }
        
    }
    
    
    
    
    /// 获取schemes列表
    func loadURLSchemes(completion:@escaping ()->()) {
        
        DispatchQueue.global().async {
            
            let bundle = Bundle(for: URLSchemes.self)
            
            let plistPath = bundle.path(forResource: "schemes.plist", ofType: nil) ?? ""
            
            let array = NSArray(contentsOfFile: plistPath) as? [[String:String]] ?? []
            
            self.models.removeAll()
            
            for dic in array {
                
                let model = schemesModel(schemes: dic.keys.first, app: dic.values.first)
                
                self.models.append(model)
                
            }
            
            completion()
            
        }
        
    }
    
    
}
