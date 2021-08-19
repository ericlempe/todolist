class GerenciaDeEstado<T> {
  late T _state;
  var _listens = <Function(T state)>[];

  GerenciaDeEstado({required T initialState}) {
    this._state = initialState;
  }

  get state => _state;

  void setState(T state) {
    _state = state;
    _update();
  }

  void _update() {
    for(var i = 0; i < _listens.length; i++) {
      _listens[i](_state);
    }
  }

  void listen(void Function(T state) onUpdate) {
    _listens.add(onUpdate);
  }
}
