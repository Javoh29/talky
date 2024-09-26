enum Statuses {
  initial,
  loading,
  completed,
  error;

  bool get isLoading => this == loading;

  bool get isCompleted => this == completed;

  bool get isError => this == error;
}
