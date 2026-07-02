enum AnimationDuration {
  NONE(Duration.zero),
  SHORT(Duration(milliseconds: 150)),
  MEDIUM(Duration(milliseconds: 350)),
  LONG(Duration(milliseconds: 500));

  final Duration value;

  const AnimationDuration(this.value);
}
