class Error {
  final String message;
  Error(this.message);
}

class NotFound extends Error {
  NotFound() : super('not found');
}

class CandidatesFound extends Error {
  CandidatesFound() : super('there is one more candidates found');
}
