enum MCTTimerState {
  stopped,
  play,
  paused;
}

MCTTimerState resolve(String name) {
  return MCTTimerState.values.firstWhere((element) => element.name == name);
}
