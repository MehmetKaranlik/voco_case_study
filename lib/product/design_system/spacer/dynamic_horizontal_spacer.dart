import 'package:flutter/material.dart';
import 'package:voco_case_study/product/design_system/widget_sizes.dart';

/// Returns a [SizedBox] with the given [width].
class HorizontalSpace extends SizedBox {
  @override
  final double width;
  const HorizontalSpace({Key? key, required this.width}) : super(key: key);

  /// Returns a [SizedBox] with the 8px width.
  const HorizontalSpace.xxSmall({Key? key})
      : this(key: key, width: WidgetSizes.spacingXs);

  /// Returns a [SizedBox] with the 12px width.
  const HorizontalSpace.xSmall({Key? key})
      : this(key: key, width: WidgetSizes.spacingS);

  /// Returns a [SizedBox] with the 16px width.
  const HorizontalSpace.standard({Key? key})
      : this(key: key, width: WidgetSizes.spacingM);

  /// Returns a [SizedBox] with the 20px width.
  const HorizontalSpace.small({Key? key})
      : this(key: key, width: WidgetSizes.spacingL);

  /// Returns a [SizedBox] with the 40px width.
  const HorizontalSpace.medium({Key? key})
      : this(key: key, width: WidgetSizes.spacingXxl4);

  /// Returns a [SizedBox] with the 60px width.
  const HorizontalSpace.large({Key? key})
      : this(key: key, width: WidgetSizes.spacingXxl8);

  /// Returns a [SizedBox] with the 100px width.
  const HorizontalSpace.xLarge({Key? key})
      : this(key: key, width: WidgetSizes.spacingXxl12);
}
