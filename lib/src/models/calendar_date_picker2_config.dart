import 'dart:core';

import 'package:flutter/material.dart';

enum CalendarDatePicker2Type {
  single,
  // multi,
  range,
}

typedef CalendarDayTextStylePredicate = TextStyle? Function({
  required DateTime date,
});

typedef CalendarDayBuilder = Widget? Function({
  required DateTime date,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isToday,
});

typedef CalendarYearBuilder = Widget? Function({
  required int year,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isCurrentYear,
});

typedef CalendarModePickerTextHandler = String? Function({
  required DateTime monthDate,
});

class CalendarDatePicker2Config {
  CalendarDatePicker2Config({
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    // colors
    this.themeColor,
    this.arrowColor,
    this.currentDayBoarderColor,
    this.selectedDateBoxColor,
    this.selectedYearBoxColor,
    //  styles
    this.yearNameTextStyle,
    this.weekNameTextStyle,
    this.notSelectedDataTextStyle,
    this.selectedDataTextStyle,
    this.notSelectedYearTextStyle,
    this.selectedYearTextStyle,
    this.monthNameTextStyle,
    // classes
    this.selectableDayPredicate,
    this.calendarType,
    this.dayBuilder,
    this.modePickerTextHandler,
    this.yearBuilder,
    this.dayTextStylePredicate,
    // size
    this.controlsHeight,
    // bool
    this.disableModePicker,
  })  : firstDate = DateUtils.dateOnly(firstDate ?? DateTime(1970)),
        lastDate = DateUtils.dateOnly(lastDate ?? DateTime(DateTime.now().year + 100)),
        currentDate = currentDate ?? DateUtils.dateOnly(DateTime.now()),
        calendarViewMode = calendarViewMode ?? DatePickerMode.day;

  // datatime

  DateTime? firstDate;
  DateTime? lastDate;
  DateTime? currentDate;
  DatePickerMode? calendarViewMode;

  // color

  Color? themeColor;
  Color? arrowColor;
  Color? currentDayBoarderColor;
  Color? selectedDateBoxColor;
  Color? selectedYearBoxColor;

  // style

  TextStyle? yearNameTextStyle;
  TextStyle? weekNameTextStyle;
  TextStyle? notSelectedDataTextStyle;
  TextStyle? selectedDataTextStyle;
  TextStyle? notSelectedYearTextStyle;
  TextStyle? selectedYearTextStyle;
  TextStyle? monthNameTextStyle;

  // classes

  SelectableDayPredicate? selectableDayPredicate;
  CalendarDatePicker2Type? calendarType;
  CalendarDayBuilder? dayBuilder;
  CalendarModePickerTextHandler? modePickerTextHandler;
  CalendarYearBuilder? yearBuilder;
  CalendarDayTextStylePredicate? dayTextStylePredicate;

  // size

  double? controlsHeight;

  // bool

  bool? disableModePicker;
}

// class CalendarDatePicker2WithActionButtonsConfig extends CalendarDatePicker2Config {
//   CalendarDatePicker2WithActionButtonsConfig({
//     CalendarDatePicker2Type? calendarType,
//     DateTime? firstDate,
//     DateTime? lastDate,
//     DateTime? currentDate,
//     DatePickerMode? calendarViewMode,
//     List<String>? weekdayLabels,
//     TextStyle? weekdayLabelTextStyle,
//     int? firstDayOfWeek,
//     double? controlsHeight,
//     Widget? lastMonthIcon,
//     Widget? nextMonthIcon,
//     TextStyle? controlsTextStyle,
//     TextStyle? dayTextStyle,
//     TextStyle? selectedDayTextStyle,
//     Color? selectedDayHighlightColor,
//     Color? selectedRangeHighlightColor,
//     TextStyle? disabledDayTextStyle,
//     TextStyle? todayTextStyle,
//     TextStyle? yearTextStyle,
//     TextStyle? selectedYearTextStyle,
//     TextStyle? selectedRangeDayTextStyle,
//     BorderRadius? dayBorderRadius,
//     BorderRadius? yearBorderRadius,
//     SelectableDayPredicate? selectableDayPredicate,
//     CalendarDayTextStylePredicate? dayTextStylePredicate,
//     CalendarDayBuilder? dayBuilder,
//     CalendarYearBuilder? yearBuilder,
//     bool? disableModePicker,
//     bool? centerAlignModePicker,
//     Widget? customModePickerIcon,
//     CalendarModePickerTextHandler? modePickerTextHandler,
//     bool rangeBidirectional = false,
//     this.gapBetweenCalendarAndButtons,
//     this.cancelButtonTextStyle,
//     this.cancelButton,
//     this.okButtonTextStyle,
//     this.okButton,
//     this.openedFromDialog,
//     this.closeDialogOnCancelTapped,
//     this.closeDialogOnOkTapped,
//     this.buttonPadding,
//   }) : super(
//           calendarType: calendarType,
//           firstDate: firstDate,
//           lastDate: lastDate,
//           currentDate: currentDate,
//           calendarViewMode: calendarViewMode,
//           weekdayLabels: weekdayLabels,
//           weekdayLabelTextStyle: weekdayLabelTextStyle,
//           firstDayOfWeek: firstDayOfWeek,
//           controlsHeight: controlsHeight,
//           lastMonthIcon: lastMonthIcon,
//           nextMonthIcon: nextMonthIcon,
//           controlsTextStyle: controlsTextStyle,
//           dayTextStyle: dayTextStyle,
//           selectedDayTextStyle: selectedDayTextStyle,
//           selectedRangeDayTextStyle: selectedRangeDayTextStyle,
//           selectedDayHighlightColor: selectedDayHighlightColor,
//           selectedRangeHighlightColor: selectedRangeHighlightColor,
//           disabledDayTextStyle: disabledDayTextStyle,
//           todayTextStyle: todayTextStyle,
//           yearTextStyle: yearTextStyle,
//           selectedYearTextStyle: selectedYearTextStyle,
//           dayBorderRadius: dayBorderRadius,
//           yearBorderRadius: yearBorderRadius,
//           selectableDayPredicate: selectableDayPredicate,
//           dayTextStylePredicate: dayTextStylePredicate,
//           dayBuilder: dayBuilder,
//           yearBuilder: yearBuilder,
//           disableModePicker: disableModePicker,
//           centerAlignModePicker: centerAlignModePicker,
//           customModePickerIcon: customModePickerIcon,
//           modePickerTextHandler: modePickerTextHandler,
//           rangeBidirectional: rangeBidirectional,
//         );

//   final double? gapBetweenCalendarAndButtons;
//   final TextStyle? cancelButtonTextStyle;
//   final Widget? cancelButton;
//   final TextStyle? okButtonTextStyle;
//   final Widget? okButton;
//   final bool? openedFromDialog;
//   final bool? closeDialogOnCancelTapped;
//   final bool? closeDialogOnOkTapped;
//   final EdgeInsets? buttonPadding;

//   @override
//   CalendarDatePicker2WithActionButtonsConfig copyWith({
//     CalendarDatePicker2Type? calendarType,
//     DateTime? firstDate,
//     DateTime? lastDate,
//     DateTime? currentDate,
//     DatePickerMode? calendarViewMode,
//     List<String>? weekdayLabels,
//     TextStyle? weekdayLabelTextStyle,
//     int? firstDayOfWeek,
//     double? controlsHeight,
//     Widget? lastMonthIcon,
//     Widget? nextMonthIcon,
//     TextStyle? controlsTextStyle,
//     TextStyle? dayTextStyle,
//     TextStyle? selectedDayTextStyle,
//     TextStyle? selectedRangeDayTextStyle,
//     Color? selectedDayHighlightColor,
//     Color? selectedRangeHighlightColor,
//     TextStyle? disabledDayTextStyle,
//     TextStyle? todayTextStyle,
//     TextStyle? yearTextStyle,
//     TextStyle? selectedYearTextStyle,
//     BorderRadius? dayBorderRadius,
//     BorderRadius? yearBorderRadius,
//     SelectableDayPredicate? selectableDayPredicate,
//     CalendarDayTextStylePredicate? dayTextStylePredicate,
//     CalendarDayBuilder? dayBuilder,
//     CalendarYearBuilder? yearBuilder,
//     bool? disableModePicker,
//     bool? centerAlignModePicker,
//     Widget? customModePickerIcon,
//     CalendarModePickerTextHandler? modePickerTextHandler,
//     double? gapBetweenCalendarAndButtons,
//     TextStyle? cancelButtonTextStyle,
//     Widget? cancelButton,
//     TextStyle? okButtonTextStyle,
//     Widget? okButton,
//     bool? openedFromDialog,
//     bool? closeDialogOnCancelTapped,
//     bool? closeDialogOnOkTapped,
//     EdgeInsets? buttonPadding,
//     bool? rangeBidirectional,
//   }) {
//     return CalendarDatePicker2WithActionButtonsConfig(
//       calendarType: calendarType ?? this.calendarType,
//       firstDate: DateUtils.dateOnly(firstDate ?? this.firstDate),
//       lastDate: DateUtils.dateOnly(lastDate ?? this.lastDate),
//       currentDate: currentDate ?? this.currentDate,
//       calendarViewMode: calendarViewMode ?? this.calendarViewMode,
//       weekdayLabels: weekdayLabels ?? this.weekdayLabels,
//       weekdayLabelTextStyle: weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
//       firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
//       controlsHeight: controlsHeight ?? this.controlsHeight,
//       lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
//       nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
//       controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
//       dayTextStyle: dayTextStyle ?? this.dayTextStyle,
//       selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
//       selectedRangeDayTextStyle: selectedRangeDayTextStyle ?? this.selectedRangeDayTextStyle,
//       selectedDayHighlightColor: selectedDayHighlightColor ?? this.selectedDayHighlightColor,
//       selectedRangeHighlightColor: selectedRangeHighlightColor ?? this.selectedRangeHighlightColor,
//       disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
//       todayTextStyle: todayTextStyle ?? this.todayTextStyle,
//       yearTextStyle: yearTextStyle ?? this.yearTextStyle,
//       selectedYearTextStyle: selectedYearTextStyle ?? this.selectedYearTextStyle,
//       dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
//       yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
//       selectableDayPredicate: selectableDayPredicate ?? this.selectableDayPredicate,
//       dayTextStylePredicate: dayTextStylePredicate ?? this.dayTextStylePredicate,
//       dayBuilder: dayBuilder ?? this.dayBuilder,
//       yearBuilder: yearBuilder ?? this.yearBuilder,
//       disableModePicker: disableModePicker ?? this.disableModePicker,
//       centerAlignModePicker: centerAlignModePicker ?? this.centerAlignModePicker,
//       customModePickerIcon: customModePickerIcon ?? this.customModePickerIcon,
//       modePickerTextHandler: modePickerTextHandler ?? this.modePickerTextHandler,
//       rangeBidirectional: rangeBidirectional ?? this.rangeBidirectional,
//       gapBetweenCalendarAndButtons: gapBetweenCalendarAndButtons ?? this.gapBetweenCalendarAndButtons,
//       cancelButtonTextStyle: cancelButtonTextStyle ?? this.cancelButtonTextStyle,
//       cancelButton: cancelButton ?? this.cancelButton,
//       okButtonTextStyle: okButtonTextStyle ?? this.okButtonTextStyle,
//       okButton: okButton ?? this.okButton,
//       openedFromDialog: openedFromDialog ?? this.openedFromDialog,
//       closeDialogOnCancelTapped: closeDialogOnCancelTapped ?? this.closeDialogOnCancelTapped,
//       closeDialogOnOkTapped: closeDialogOnOkTapped ?? this.closeDialogOnOkTapped,
//       buttonPadding: buttonPadding ?? this.buttonPadding,
//     );
//   }
// }
