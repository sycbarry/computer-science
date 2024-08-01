# Merge Sort Algorithm

Merge sort is a divide-and-conquer algorithm that was invented by John von Neumann in 1945. It is a comparison-based sorting algorithm that is used to sort a list of elements. Merge sort is a stable sorting algorithm and has a time complexity of O(n log n).


``` python
def split(array):

    # Base case ( array is a single unit in length )
    if len(array) <= 1:
        return array

    # make a mid point
    mid = len(array) // 2

    # build the left and right arrays
    # populate the two arrays with data from the original array
    left = [ array[i] for i in range(0, mid) ]
    right = [ array[i] for i in range(mid, len(array)) ]

    # recursively split the array
    split(left)
    split(right)

    # merge the two arrays
    merge(array, left, right)

def merge(array, left, right):
    
        # initialize the pointers
        i = j = k = 0
    
        # merge the two arrays
        while i < len(left) and j < len(right):
            if left[i] < right[j]:
                array[k] = left[i]
                i += 1
            else:
                array[k] = right[j]
                j += 1
            k += 1
    
        # merge the remaining elements
        while i < len(left):
            array[k] = left[i]
            i += 1
            k += 1
    
        while j < len(right):
            array[k] = right[j]
            j += 1
            k += 1
```


