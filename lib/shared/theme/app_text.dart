import 'package:flutter/material.dart';

import 'app_theme.dart';

extension TextExt on Text {
  // ignore: unnecessary_this
  Text get label => Text(this.data!, style: AppTheme.textStyles.label);
}
