import 'package:flutter/material.dart';
import 'package:ignite_flutter_todo_list/gerencia_de_estado.dart';

class BuilderWidget<T> extends StatefulWidget {
  final GerenciaDeEstado<T> controller;
  final Widget Function(BuildContext context, T state) builder;

  BuilderWidget({
    required this.controller,
    required this.builder,
  });

  @override
  _BuilderWidgetState<T> createState() => _BuilderWidgetState<T>();
}

class _BuilderWidgetState<T> extends State<BuilderWidget<T>> {
  @override
  void initState() {
    widget.controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
