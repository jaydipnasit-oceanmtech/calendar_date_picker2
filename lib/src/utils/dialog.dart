import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Future<List<DateTime?>?> showCalendarDatePicker2Dialog({
  required BuildContext context,
  required CalendarDatePicker2Config config,
  required Size dialogSize,
  List<DateTime?> value = const [],
  BorderRadius? borderRadius,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  bool useSafeArea = true,
  Color? dialogBackgroundColor,
  RouteSettings? routeSettings,
  String? barrierLabel,
  TransitionBuilder? builder,
  EdgeInsets? insetPadding,
}) {
  var dialog = AlertDialog(
    alignment: Alignment.center,
    actionsOverflowButtonSpacing: 0,
    contentPadding: EdgeInsets.zero,
    
    insetPadding: insetPadding ?? const EdgeInsets.all(10),
    backgroundColor: Colors.transparent,
    // backgroundColor: dialogBackgroundColor ?? Colors.white,
    content: Container(
      decoration: BoxDecoration(
        color: dialogBackgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      width: dialogSize.width,
      height: dialogSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalendarDatePicker2WithActionButtons(
            value: value,
            config: config,
          ),
        ],
      ),
    ),
  );

  return showDialog<List<DateTime?>>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
  );
}
