//
//  Extensions.swift
//  NetflixClone
//
//  Created by Atharva Dagaonkar on 15/06/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
