import SwiftUI

class TimerViewModel: ObservableObject {
    @Published private var timerModel: TimerModel = TimerModel(seconds: 0)
    private var timer: Timer?
    
    public var currentValue: Int {
        self.timerModel.seconds
    }
    
    public func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timerModel = self.timerModel.increment
        }
    }
    
    public func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    public func reset() {
        self.timerModel = TimerModel(seconds: 0)
    }
}
