class error {
  final String message;
  error(this.message);
}

class notfound extends error {
  notfound() : super('not found');
}

class candidatesFound extends error {
  candidatesFound() : super('there is one more candidates found');
}
