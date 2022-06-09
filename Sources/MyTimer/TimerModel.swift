import SwiftUI

struct TimerModel {
    var seconds: Int
    
    var increment: TimerModel {
        TimerModel(seconds: self.seconds + 1)
    }
}
