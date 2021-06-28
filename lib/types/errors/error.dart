class error {
  final String message;
  error(this.message);
}

class notfound extends error {
  notfound() : super('not found');
}
