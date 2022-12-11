enum PlayerState {
  // 0
  waiting,

  // 1
  running,

  // 2
  jumping,

  // 3
  crashed,
}

enum PlayerMode {
  // 0
  normal,

  // 1
  large,

  // 3
  power,
}

int getPlayerStatus(PlayerState playerState, PlayerMode playerMode) {
  return playerState.index * 10 + playerMode.index;
}
