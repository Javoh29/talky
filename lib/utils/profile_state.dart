enum ProfileState {
  initial,
  create,
  completed;

  const ProfileState();

  static ProfileState fromString(String value) {
    return switch (value) {
      'create' => create,
      'completed' => completed,
      _ => initial,
    };
  }
}
