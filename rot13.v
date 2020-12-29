/* ASCII ROT13 */
import os

fn is_letter(c byte) bool {
	if c < 123 && c > 96 {
		return true
	}
	if c < 91 && c > 64 {
		return true
	}

	return false
}

fn to_upper(c byte) byte {
	if c < 123 && c > 96 {
		return (c - 32)
	}
	return c
}

fn rot13(input string) string {
	mut result := []byte{}
	for c in input {
		if is_letter(c) {
			letter_index := byte(to_upper(c) - 64)
			if letter_index <= 13 {
				result << byte(letter_index + 77) // 64 + 13 = 77
			} else {
				result << byte((letter_index - 13) + 64)
			}
		} else {
			result << c
		}
	}

	return string(result)
}

fn main() {
	println("Please enter the sentence you'd like to encrypt/decrypt:")
	input := os.get_line()
	result := rot13(input)

	println("Result: " + result)
}
