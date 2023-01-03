import 'package:flutter/material.dart';

class CustomStep extends Step {
  CustomStep({
    required Widget title,
    required Widget content,
    StepState? state = StepState.indexed,
    bool isActive = false,
  }) : super(title: title, content: content, state: state!, isActive: isActive);
}
