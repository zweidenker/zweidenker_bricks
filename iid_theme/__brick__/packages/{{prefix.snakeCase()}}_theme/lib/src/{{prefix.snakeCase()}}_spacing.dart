import 'package:flutter/material.dart';

class {{prefix.pascalCase()}}Spacers {
  {{prefix.pascalCase()}}Spacers._();

  static Widget withFactor(double factor) {
    return SizedBox(
      height: factor * baseSpace,
      width: factor * baseSpace,
    );
  }

  static const double baseSpace = {{defaultSpacing}};

  static const x0_5 = SizedBox(
    height: 0.5 * baseSpace,
    width: 0.5 * baseSpace,
  );

  static const x1 = SizedBox(
    height: 1 * baseSpace,
    width: 1 * baseSpace,
  );
  static const x1_5 = SizedBox(
    height: 1.5 * baseSpace,
    width: 1.5 * baseSpace,
  );
  static const x2 = SizedBox(
    height: 2 * baseSpace,
    width: 2 * baseSpace,
  );
  static const x3 = SizedBox(
    height: 3 * baseSpace,
    width: 3 * baseSpace,
  );
  static const x4 = SizedBox(
    height: 4 * baseSpace,
    width: 4 * baseSpace,
  );
}

class {{prefix.pascalCase()}}Paddings {
  {{prefix.pascalCase()}}Paddings._();

  static const double baseSpace = {{defaultSpacing}};

  static const hx1 = EdgeInsets.symmetric(horizontal: 1 * baseSpace);
  static const hx2 = EdgeInsets.symmetric(horizontal: 2 * baseSpace);
  static const hx3 = EdgeInsets.symmetric(horizontal: 3 * baseSpace);
  static const hx4 = EdgeInsets.symmetric(horizontal: 4 * baseSpace);

  static const vx1 = EdgeInsets.symmetric(vertical: 1 * baseSpace);
  static const vx2 = EdgeInsets.symmetric(vertical: 2 * baseSpace);
  static const vx3 = EdgeInsets.symmetric(vertical: 3 * baseSpace);
  static const vx4 = EdgeInsets.symmetric(vertical: 4 * baseSpace);

  static const ax0_5 = EdgeInsets.all(0.5 * baseSpace);
  static const ax1 = EdgeInsets.all(1 * baseSpace);
  static const ax2 = EdgeInsets.all(2 * baseSpace);
  static const ax3 = EdgeInsets.all(3 * baseSpace);
  static const ax4 = EdgeInsets.all(4 * baseSpace);
}
