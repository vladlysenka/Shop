// Created by Vlad Lysenka 09.08.2024

import SwiftUI

extension Double {
    func toOnePrice() -> String {
        return String(format: "%.1f", self)
    }
    
    /// Форматирует число как цену с двумя знаками после запятой.
    func toPrice() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Разбивает число на целую и дробную части для отображения цены.
    /// - Возвращает кортеж, где:
    ///   - `whole` — целая часть числа.
    ///   - `fraction` — дробная часть, если она есть, иначе `nil`.
    func splitPrice() -> (whole: String, fraction: String?) {
        let intPart = String(Int(self))
        let fracPart = Int((self - Double(Int(self))) * 100)
        
        // Если дробная часть равна 0, возвращаем nil для дробной части
        return fracPart > 0 ? (intPart, String(fracPart)) : (intPart, nil)
    }
}
