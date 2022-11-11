//
//  PpmTableViewCell.swift
//  Air Quality
//
//  Created by Максим Юрисов on 10.11.2022.
//

import Foundation
import UIKit

class PpmTableViewCell: UITableViewCell{
  

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    let mapImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 13
             img.clipsToBounds = true
            return img
         }()
    
    let cityLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor =  .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    let ppmLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
          //  label.textColor =  .blue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(mapImageView)
        containerView.addSubview(cityLabel)
        containerView.addSubview(ppmLabel)
        self.contentView.addSubview(containerView)
        
        
        
        mapImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        mapImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        mapImageView.widthAnchor.constraint(equalToConstant:20).isActive = true
        mapImageView.heightAnchor.constraint(equalToConstant:20).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.mapImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        cityLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo:self.ppmLabel.leadingAnchor).isActive = true
        cityLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true
        ppmLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        ppmLabel.leadingAnchor.constraint(equalTo:self.cityLabel.trailingAnchor).isActive = true
        ppmLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true
        ppmLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        
        
     }
}
