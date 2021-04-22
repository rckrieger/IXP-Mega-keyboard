//
//  IxpBrowser.swift
//  imessageapp
//
//  Created by Rebecca Krieger on 4/21/21.
//
import UIKit
import Messages

class IxpController:MSStickerBrowserViewController {
    var stickers = [MSSticker]()
      
      func changeBrowserViewBackgroundColor(color: UIColor){
        stickerBrowserView.backgroundColor = color
      }

      func loadStickers(){
        
        createSticker(asset: "red", localizedDescription:"Red IXP")
        createSticker(asset: "pug", localizedDescription:"IXP pug")
        createSticker(asset: "LT", localizedDescription:"Leadership Team")
        createSticker(asset: "Win32", localizedDescription:"A whole old world")

            // createSticker(asset: "Australian", localizedDescription:"IXP puppy")
        
      }
      
      func createSticker(asset: String, localizedDescription: String){
        guard let stickerPath = Bundle.main.path(forResource:asset, ofType:"png") else {
          print("couldn't create the sticker path for", asset)
          return
        }
        
        // we use URL so, it's possible to use image from network
        let stickerURL = URL(fileURLWithPath:stickerPath)
        
        let sticker: MSSticker
        do {
          
          try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
          // localizedDescription for accessibility
          
          stickers.append(sticker)
        }catch {
          print(error)
          return
        }
        
      }
      
      override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int{
        return stickers.count
      }

      override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker{

        return stickers[index] as MSSticker
        
      }
}
