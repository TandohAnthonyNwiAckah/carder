import 'dart:async';

import 'package:carder/carder.dart';
import 'package:carder/src/controller/controller_event.dart';

/// A controller that can be used to trigger swipes on a CardSwiper widget.
class CarderController {
  final _eventController = StreamController<ControllerEvent>.broadcast();

  /// Stream of events that can be used to swipe the card.
  Stream<ControllerEvent> get events => _eventController.stream;

  /// Swipe the card to a specific direction.
  void swipe(CardSwiperDirection direction) {
    _eventController.add(ControllerSwipeEvent(direction));
  }

  // Undo the last swipe
  void undo() {
    _eventController.add(const ControllerUndoEvent());
  }

  // Change the top card to a specific index.
  void moveTo(int index) {
    _eventController.add(ControllerMoveEvent(index));
  }

  Future<void> dispose() async {
    await _eventController.close();
  }
}
