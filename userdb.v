struct User {
	name string
	os string
}

fn main() {
	users := [ User{"Alice", "Debian"}, User{"Bob", "Manjaro"}, User{"Charlie", "Windows"} ]

	for user in users {
		println('$user.name uses $user.os')
	}
}
