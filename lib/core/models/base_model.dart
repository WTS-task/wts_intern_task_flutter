import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class IBaseModelListener {
  void onModelUpdated();

  void onModelError(String error);

  void onModelMessage(String error);
}

abstract class SafeChangeNotifier extends ChangeNotifier {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

/// Базовая модель.
///
abstract class BaseModel extends SafeChangeNotifier {
  BaseModel() {
    subscribeToEvents();
  }

  // final AppModel appModel;

  late final List<StreamSubscription> _subscriptions = [];
  final List<IBaseModelListener> _modelListeners = [];

  String? _lastError;

  /// Для отображения ошибок на экране
  String? get lastError => _lastError;

  bool get hasError => lastError != null;

  @override
  void dispose() {
    super.dispose();
    _unsubscribeFromEvents();
  }

  /// Добавляет слушателя к модели (интерфейс реализует прослушивание как обновления так и ошибки)
  @mustCallSuper
  void addModelListener(IBaseModelListener listener) {
    if (_modelListeners.contains(listener)) {
      if (kDebugMode) {
        throw Exception('Listener already added');
      }
      return;
    }
    _modelListeners.add(listener);
    addListener(listener.onModelUpdated);
  }

  /// Удаляет слушателя из модели
  @mustCallSuper
  void removeModelListener(IBaseModelListener listener) {
    if (!_modelListeners.contains(listener)) {
      if (kDebugMode) {
        throw Exception("Listener doesn't exist");
      }
      return;
    }
    _modelListeners.remove(listener);
    removeListener(listener.onModelUpdated);
  }

  @mustCallSuper
  void subscribeToEvents() {
    // implement for subscribe events
  }

  void _unsubscribeFromEvents() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  /// Вызывает оповешении слушателей об обновлении моделей
  /// и сбрасывает состояние ошибки (опционально)
  void notifyModelListeners({bool resetError = true}) {
    if (isDisposed) {
      return;
    }
    if (resetError) {
      clearError();
    }
    notifyListeners();
  }

  /// Используется для оповещения слушателей об ошибках
  void addError(String? error, {bool saveError = true}) {
    if (error == null) return;
    if (saveError) {
      _lastError = error;
    }
    _notifyModelError(error);
  }

  /// Сбрасывает состояние ошибки без оповещения об изменении модели
  void clearError() {
    _lastError = null;
  }

  void _notifyModelError(String error) {
    if (isDisposed) {
      return;
    }
    notifyListeners();
    for (final listener in _modelListeners) {
      listener.onModelError(error);
    }
  }

  /// Используется для оповещения слушателей о сообщениях
  void addMessage(String message) {
    _notifyModelMessage(message);
  }

  void _notifyModelMessage(String message) {
    if (isDisposed) {
      return;
    }
    notifyListeners();
    for (final listener in _modelListeners) {
      listener.onModelMessage(message);
    }
  }
}
