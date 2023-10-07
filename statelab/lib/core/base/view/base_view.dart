import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseStatefulView<T extends Store> extends StatefulWidget {
  const BaseStatefulView({
    Key? key,
    required this.viewModel,
    required this.onModelReady,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);
  final T viewModel;
  final void Function(T model) onModelReady;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final VoidCallback? onDispose;

  @override
  _BaseStatefulViewState<T> createState() => _BaseStatefulViewState<T>();
}

class _BaseStatefulViewState<T extends Store>
    extends State<BaseStatefulView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
