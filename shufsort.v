/* This program prints an array containing the numbers 1-10, shuffles it, prints
   it again, sorts it using quicksort, then prints it once more. */

import rand

fn shuffle(mut arr []int, low int, high int) {
	for i in low .. high {
		j := rand.intn(high - low) + low

		tmp := arr[i]
		arr[i] = arr[j]
		arr[j] = tmp
	}
}

fn partition(mut arr []int, low int, high int) int {
	pivot := arr[high]
	mut i := (low - 1)

	for j in low .. high {
		if arr[j] < pivot {
			i++

			tmp := arr[i]
			arr[i] = arr[j]
			arr[j] = tmp
		}
	}

	tmp := arr[i + 1]
	arr[i + 1] = arr[high]
	arr[high] = tmp
	return i + 1
}

fn qsort(mut arr []int, low int, high int) {
	if low < high {
		pi := partition(mut arr, low, high)

		qsort(mut arr, low, pi - 1)
		qsort(mut arr, pi + 1, high)
	}
}

fn main() {
	mut arr := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
	println(arr)
	shuffle(mut arr, 0, arr.len - 1)
	println(arr)
	qsort(mut arr, 0, arr.len - 1)
	println(arr)
}
