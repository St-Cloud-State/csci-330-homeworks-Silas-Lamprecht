#include <iostream>
#include <stack>
#include <vector>

using namespace std;

// Partition function 
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high]; // Choose the last element as pivot
    int i = low - 1;

    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

// Iterative Quicksort
void quickSortIterative(vector<int>& arr) {
    int low = 0, high = arr.size() - 1;
    stack<pair<int, int>> s; //creates the stack
    s.push({low, high});

    while (!s.empty()) {
         // Retrieve the top range from the stack and remove it
        pair<int, int> top = s.top();  
        s.pop();
        low = top.first;
        high = top.second;
        // Partition the current subarray and get the pivot index
        if (low < high) {
            int pivot = partition(arr, low, high);

            // push right subarray first so left subarray is processed first
            if (pivot + 1 < high) {
                s.push({pivot + 1, high});
            }
            if (low < pivot - 1) {
                s.push({low, pivot - 1});
            }
        }
    }
}

int main() {
    //display unsorted array
    vector<int> arr = {10, 7, 8, 9, 1, 5, 13, 3};
    cout << "Original array: ";
    for (int num : arr) cout << num << " ";
    cout << endl;
    //run quick sort funtction on the array
    quickSortIterative(arr);
    //display the sorted array 
    cout << "Sorted array: ";
    for (int num : arr) cout << num << " ";
    cout << endl;
    return 0;
}
