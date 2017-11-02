//: Playground - noun: a place where people can play

import UIKit

print("Hello,Algorithm!")

func randomItems(range: Int) -> [Int] {
    var items = [Int]()
    while items.count < range {
        items.append(Int(arc4random() % 100))
    }
    return items
}
var items = [59, 97, 8, 50, 51, 49, 9, 98, 48, 67, 79, 47, 91, 30, 60, 97, 50, 76, 60, 44, 57, 5, 25, 18, 3, 57, 2, 55, 38, 38, 24, 2, 47, 6, 49, 80, 9, 63, 49, 84, 75, 67, 5, 68, 78, 76, 76, 68, 37, 25, 93, 67, 35, 60, 76, 87, 25, 32, 60, 68, 39, 25, 14, 58, 80, 87, 25, 5, 44, 33, 46, 83, 55, 97, 18, 43, 44, 20, 54, 68, 16, 23, 8, 50, 72, 56, 5, 88, 87, 62, 70, 38, 9, 85, 41, 42, 76, 78, 58, 7]

// MARK - 选择排序（升序）
/*
 1、从第一个元素开始遍历查找最小值，存放在开始位置
 2、从第二位元素开始遍历数组查找最小值，存放在开始位置
 3、以此类推，直至最后最后第二个元素
 */
func selectionSort(items: inout [Int]) {
    for i in 0 ..< items.count - 1 {
        var min = i
        for j in i+1 ..< items.count {
            if items[min] > items[j] {
                min = j
            }
        }
        let temp = items[min]
        items[min] = items[i]
        items[i] = temp
    }
    
    for i in items {
        i
    }
}

//items = randomItems(range: 100)
//selectionSort(items: &items)

// MARK - 冒泡（升序）
func bubbleSort(items: inout [Int]) {
    for i in 0 ..< items.count {
        for j in 0 ..< items.count - 1 - i {
            if items[j] > items[j+1] {
                let temp = items[j]
                items[j] = items[j+1]
                items[j+1] = temp
            }
        }
    }
    for i in items {
        i
    }
}
//items = randomItems(range: 1000)
//bubbleSort(items: &items)

// MARK - 插入排序（升序）

func insertSort(items: inout [Int]) {
    for i in 1 ..< items.count {
        let value = items[i]
        var j = i - 1
        while j >= 0 && items[j] > value {
            items[j+1] = items[j]
            j -= 1
        }
        items[j+1] = value
    }
    for i in items {
        i
    }
}
//items = randomItems(range: 100)
//insertSort(items: &items)

// MARK - 希尔排序（升序）

func shellSort(items: inout [Int]) {
    var j: Int
    var section = items.count / 2
    while section > 0 {
        for i in 0 ..< section {
            j = i + section
            while j < items.count {
                if items[j] < items[j - section] {
                    let temp = items[j]
                    var k = j - section
                    while k >= 0 && items[k] > temp {
                        items[k+section] = items[k]
                        k -= section
                    }
                    items[k + section] = temp
                }
                j += section
            }
        }
        section /= 2
    }
    for i in items {
        i
    }
}
//items = randomItems(range: 6)
//shellSort(items: &items)


//MARK:- 快速排序（升序）
/*
 步骤：
 1、从数列中挑出最后元素，称为 “基准”（pivot），
 2、重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
 3、递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
 */
func quickSort(arr: inout [Int]) {
    func partition(startIndex: Int, _ endIndex: Int) -> Int {
        var i = startIndex - 1
        let key = arr[endIndex]
        for j in startIndex ..< endIndex {
            if arr[j] < key {
                i = i + 1
                let temp = arr[j]
                arr[j] = arr[i]
                arr[i] = temp
            }
        }
        arr[endIndex] = arr[i + 1]
        arr[i + 1] = key
        return i + 1
    }
    
    func internalQuickSort(startIndex: Int, _ endIndex: Int) {
        if startIndex < endIndex {
            let q = partition(startIndex:startIndex, endIndex)
            internalQuickSort(startIndex:startIndex, q - 1)
            internalQuickSort(startIndex:q + 1, endIndex)
        }
    }
    internalQuickSort(startIndex: 0, arr.count - 1)
}

//items = randomItems(range: 1000)
quickSort(arr: &items)

//MARK:- 堆排序(降序)
/*
步骤：
1、按堆的定义将数组R[0..n]调整为堆（这个过程称为创建初始堆），交换R[0]和R[n]；
2、将R[0..n-1]调整为堆，交换R[0]和R[n-1]；
3、重复上述过程，直到交换了R[0]和R[1]为止。
*/
func heapSort(arr: inout [Int]) {
    
    func buildheap(arr: inout [Int]) {
        let length = arr.count
        let heapsize = length
        var nonleaf = length / 2 - 1
        while nonleaf >=  0 {
            heapify(arr: &arr, i: nonleaf, heapsize: heapsize)
            nonleaf -= 1
        }
        
    }
    
    func heapify(arr: inout [Int], i : Int, heapsize: Int){
        var smallest = i
        let left = 2*i+1
        let right = 2*i+2
        if(left < heapsize){
            if(arr[i] > arr[left]){
                smallest = left
            }
            else {
                smallest = i
            }
        }
        if(right < heapsize){
            if(arr[smallest] > arr[right]){
                smallest = right
            }
        }
        if(smallest != i){
            var temp: Int
            temp = arr[i]
            arr[i] = arr[smallest]
            arr[smallest] = temp
            heapify(arr: &arr,i: smallest,heapsize: heapsize)
        }
        
    }
    
    func internalHeapSort(arr: inout [Int]) {
        var heapsize = arr.count
        buildheap(arr: &arr)
        for _ in 0 ..< arr.count - 1 {
            var temp: Int
            temp = arr[0]
            arr[0] = arr[heapsize - 1]
            arr[heapsize - 1] = temp
            heapsize = heapsize - 1
            heapify(arr: &arr, i: 0, heapsize: heapsize)
            
        }
        
    }
    internalHeapSort(arr: &arr)
    
    for i in arr {
        i
    }
}

//items = randomItems(range: 1000)
//heapSort(arr: &items)


//MARK:- 归并排序（升序）
/*
 步骤：
 1. 申请空间，创建两个数组，长度分别为两个有序数组的长度
 2. 设定两个指针，最初位置分别为两个已经排序序列的起始位置
 3. 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
 4. 重复步骤3直到某一指针达到序列尾
 5. 将另一序列剩下的所有元素直接复制到合并序列尾
 */
func mergeSort(arr: inout [Int]) {
    
    func merge (arr: inout [Int], low: Int, mid: Int, high: Int, temp: inout [Int]) {
        var i = low
        var j = mid + 1
        let m = mid
        let n = high
        var k = 0
        
        while (i <= m && j <= n) {
            if (arr[i] <=  arr[j])
            {
                temp[k] = arr[i]
                k += 1
                i += 1
            }
            else
            {
                temp[k] = arr[j]
                k += 1
                j += 1
            }
        }
        
        while i <= m {
            temp[k] = arr[i]
            k += 1
            i += 1
        }
        
        while j <=  n {
            temp[k] = arr[j]
            k += 1
            j += 1
        }
        
        for f in 0 ..< k {
            arr[low + f] = temp[f]
        }
        
    }
    
    func internalMergeSort(arr: inout [Int], low: Int, high: Int, temp: inout [Int]) {
        if high <= low {
            return
        }
        let mid = low + (high - low) / 2
        // 左边有序
        internalMergeSort(arr: &arr, low: low, high: mid, temp: &temp)
        // 右边有序
        internalMergeSort(arr: &arr, low: mid + 1, high: high, temp: &temp)
        // 将两边合起来
        merge(arr: &arr, low: low, mid: mid, high: high, temp: &temp)
    }
    
    var temp: [Int] = arr// 辅助数组
    internalMergeSort(arr: &arr, low: 0, high: arr.count - 1, temp: &temp)
}

//items = randomItems(range: 1000)
//mergeSort(arr: &items)

