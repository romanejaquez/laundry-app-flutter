import 'package:flutter/material.dart';

mixin BaseContext {

  late BuildContext context;

  setContext(BuildContext c) {
    context = c;
  }
}