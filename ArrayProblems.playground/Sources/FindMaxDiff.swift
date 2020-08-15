import Foundation

///Maximum difference between two elements such that larger element appears after the smaller number
public func findMaxDiff(arr:[Int]) -> Int {
    
    var maxDiff = arr[1] - arr[0]
    var smalestElememt = arr[0]
    for elemet in arr {
        if elemet - smalestElememt > maxDiff {
            maxDiff = elemet - smalestElememt
        }
        if elemet < smalestElememt {
            smalestElememt = elemet
        }
    }
    
    return maxDiff
}
