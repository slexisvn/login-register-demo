enum FormStatus {
  pure,
  submissionInProgress,
  submissionSuccess,
  submissionFailure
}

extension FormStatusX on FormStatus {
  bool get isSubmissionFailure => this == FormStatus.submissionFailure;
}
