//
//  FileSystemDelegate.swift
//  file-system-events
//
//  Created by 葉冠暉 on 2021/2/14.
//  Copyright © 2021 葉冠暉. All rights reserved.
//

import Foundation
import EonilFSEvents


class FileSystemDelegate{
    
    private func process(fileSystemEvent e: EonilFSEventsEvent) {
        
        var print_string:String=""
        
        if (e.flag?.contains(EonilFSEventsEventFlags.itemIsDir))!{
            print_string="Dir[\(e.path)]"
        }
        else if (e.flag?.contains(EonilFSEventsEventFlags.itemIsFile))!{
            print_string="File[\(e.path)]"
        }
        
        if (e.flag?.contains(EonilFSEventsEventFlags.itemCreated))!{
            print_string+=" CREATE!"
        }
        else if (e.flag?.contains(EonilFSEventsEventFlags.itemRenamed))!{
            print_string+=" RENAMED!"
        }
        else if (e.flag?.contains(EonilFSEventsEventFlags.itemModified))!{
            print_string+=" MODIFIED!"
        }
        else if (e.flag?.contains(EonilFSEventsEventFlags.itemRemoved))!{
            print_string+=" REMOVED!"
        }
        
        
        print(print_string)
        
    }
    
    init(path:String) {
        do{
            try  EonilFSEvents.startWatching(paths: [path], for: ObjectIdentifier(self), with: process)
        }catch{
            print("出現錯誤 ： \(error)")
        }
        
    }
}
