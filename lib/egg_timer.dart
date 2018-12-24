import 'dart:async';

class EggTimer {
  final Duration maxTime;
  final Function onTimerUpdate;
  final Stopwatch stopwatch = new Stopwatch();
  Duration _currentTime = const Duration(seconds: 0);
  Duration lastStartTime = const Duration(seconds: 0);
  EggTimerState state = EggTimerState.ready;

  EggTimer({
    this.maxTime,
    this.onTimerUpdate,
  });

  get currentTime {
    return _currentTime;
  }

  set currentTime(newTime) {
    if (state == EggTimerState.ready) {
      _currentTime = newTime;
      lastStartTime = currentTime;
    }
  }

  resume() {
    state = EggTimerState.running;
    stopwatch.start();
    _tick();
  }

  pause() {}

  _tick() {
    _currentTime = lastStartTime - stopwatch.elapsed;

    if (_currentTime.inSeconds > 0) {
      new Timer(const Duration(seconds: 1), _tick);
    } else {
      state = EggTimerState.ready;
    }

    if (onTimerUpdate != null) {
      onTimerUpdate();
    }
  }
}

enum EggTimerState { ready, running, paused }
