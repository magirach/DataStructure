import Foundation

///Find the element that appears once in a sorted array
///Given a sorted array in which all elements appear twice (one after one) and one element appears only once.

public func findSingleElement(arr:[Int], low: Int, high: Int) -> Int? {
    var output: Int? = 0
    
    if low > high {
        output = nil
    } else if low == high {
        output = arr[low]
    } else {
        let mid = low + (high - low) / 2
        print(mid)
        if mid % 2 == 0 {
            if arr[mid] == arr[mid + 1] {
                output = findSingleElement(arr: arr, low: mid + 2, high: high)
            } else {
                output = findSingleElement(arr: arr, low: low, high: mid)
            }
        } else {
            if arr[mid] == arr[mid - 1] {
                output = findSingleElement(arr: arr, low: mid + 1, high: high)
            } else {
                output = findSingleElement(arr: arr, low: low, high: mid - 1)
            }
        }
    }
    
    return output
}
