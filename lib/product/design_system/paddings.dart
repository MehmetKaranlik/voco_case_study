import 'package:flutter/material.dart';
import 'package:voco_case_study/product/design_system/widget_sizes.dart';

class Paddings extends EdgeInsets {
  const Paddings.horizontalSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingL);
  const Paddings.horizontal18Symmetric()
      : super.symmetric(
            horizontal: WidgetSizes.spacingM + WidgetSizes.spacingXSS);
  const Paddings.horizontalNormalSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingS);
  const Paddings.horizontalMediumSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingM);
  const Paddings.horizontalHighSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXxl4);
  const Paddings.horizontalLowSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXsMid);
  const Paddings.horizontalVeryLowSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXxs);
  const Paddings.horizontalLowXss()
      : super.symmetric(
            horizontal: WidgetSizes.spacingXxs + WidgetSizes.spacingXSS);

  const Paddings.horizontalCustom(double value)
      : super.symmetric(horizontal: value);

  const Paddings.verticalZero() : super.symmetric(vertical: WidgetSizes.zero);
  const Paddings.verticalSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingL);
  const Paddings.verticalMediumHighSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxl2);
  const Paddings.verticalMediumSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingM);
  const Paddings.verticalHigh()
      : super.symmetric(vertical: WidgetSizes.spacingXxl4);
  const Paddings.verticalVeryLowSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxs);
  const Paddings.verticalNormalSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXl);
  const Paddings.verticalLowSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXsMid);
  const Paddings.verticalCustom(double value)
      : super.symmetric(vertical: value);

  const Paddings.general()
      : super.only(
            right: WidgetSizes.spacingL,
            left: WidgetSizes.spacingL,
            top: WidgetSizes.spacingL);

  const Paddings.generalCard()
      : super.only(
            right: WidgetSizes.spacingS,
            left: WidgetSizes.spacingS,
            top: WidgetSizes.spacingMx,
            bottom: WidgetSizes.spacingMx);

  const Paddings.allNormal() : super.all(WidgetSizes.spacingXl);
  const Paddings.all() : super.all(WidgetSizes.spacingL);
  const Paddings.allLow() : super.all(WidgetSizes.spacingXsMid);
  const Paddings.allVeryLow() : super.all(WidgetSizes.spacingXs);
  const Paddings.allVeryLowX() : super.all(WidgetSizes.spacingXSs);
  const Paddings.allMedium() : super.all(WidgetSizes.spacingM);

  const Paddings.generalLowAll() : super.all(WidgetSizes.spacingXsMid);
  const Paddings.generalAllNormal() : super.all(WidgetSizes.spacingS);
  const Paddings.generalAllLow() : super.all(WidgetSizes.spacingS);

  const Paddings.generalCardAll() : super.all(WidgetSizes.spacingS);

  const Paddings.generalCardOnlyRight()
      : super.only(right: WidgetSizes.spacingXs);

  const Paddings.generalIconAll() : super.all(WidgetSizes.spacingXxs);
  const Paddings.generalIconLowAll() : super.all(WidgetSizes.spacingXxs);
  const Paddings.generalIconVeryLowAll() : super.all(WidgetSizes.spacingXSS);
  const Paddings.generalCircleAll() : super.all(WidgetSizes.spacingXs);
  const Paddings.generalSnackbarAll() : super.all(WidgetSizes.spacingM);

  const Paddings.onlyLeftIcon() : super.only(left: WidgetSizes.spacingXl);

  const Paddings.onlyLeft() : super.only(left: WidgetSizes.spacingM);
  const Paddings.onlyLeftHigh() : super.only(left: WidgetSizes.spacingXxl2);
  const Paddings.onlyLeftLow() : super.only(left: WidgetSizes.spacingS);
  const Paddings.onlyLeftVeryLow() : super.only(left: WidgetSizes.spacingXs);
  const Paddings.onlyLeftVeryLowX() : super.only(left: WidgetSizes.spacingXxs);

  const Paddings.onlyBottomMedium() : super.only(bottom: WidgetSizes.spacingS);
  const Paddings.onlyBottomNormal() : super.only(bottom: WidgetSizes.spacingXl);
  const Paddings.onlyBottom() : super.only(bottom: WidgetSizes.spacingM);
  const Paddings.onlyBottomLow() : super.only(bottom: WidgetSizes.spacingXsMid);
  const Paddings.onlyBottomVeryLow()
      : super.only(bottom: WidgetSizes.spacingXxs);
  const Paddings.onlyBottomHigh() : super.only(bottom: WidgetSizes.spacingXxl3);

  const Paddings.onlyTopMedium() : super.only(top: WidgetSizes.spacingS);
  const Paddings.onlyTop() : super.only(top: WidgetSizes.spacingXsMid);
  const Paddings.onlyTopNormalMedium()
      : super.only(top: WidgetSizes.spacingXxl3 / 2);
  const Paddings.onlyTopLow() : super.only(top: WidgetSizes.spacingXxs);
  const Paddings.onlyTopLowNormal()
      : super.only(top: WidgetSizes.spacingXxl3 / 2);
  const Paddings.onlyTopNormal() : super.only(top: WidgetSizes.spacingXl);
  const Paddings.onlyTopNormalX()
      : super.only(top: WidgetSizes.spacingXxl2 - WidgetSizes.spacingXSS);
  const Paddings.onlyTopHigh() : super.only(top: WidgetSizes.spacingXxl3);

  const Paddings.onlyRight() : super.only(right: WidgetSizes.spacingM);
  const Paddings.onlyRightMedium() : super.only(right: WidgetSizes.spacingL);
  const Paddings.onlyRightNormal() : super.only(right: WidgetSizes.spacingXl);
  const Paddings.onlyRightLow() : super.only(right: WidgetSizes.spacingXsMid);
  const Paddings.onlyRightVeryLow() : super.only(right: WidgetSizes.spacingXSs);
}
