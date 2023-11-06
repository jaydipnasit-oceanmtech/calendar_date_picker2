import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class CalendarDatePicker2WithActionButtons extends StatefulWidget {
  const CalendarDatePicker2WithActionButtons({
    required this.value,
    required this.config,
    this.onValueChanged,
    this.onDisplayedMonthChanged,
    this.onCancelTapped,
    this.onOkTapped,
    Key? key,
  }) : super(key: key);

  final List<DateTime?> value;
  final ValueChanged<List<DateTime?>>? onValueChanged;
  final ValueChanged<DateTime>? onDisplayedMonthChanged;
  final CalendarDatePicker2Config config;
  final Function? onCancelTapped;
  final Function? onOkTapped;

  @override
  State<CalendarDatePicker2WithActionButtons> createState() => _CalendarDatePicker2WithActionButtonsState();
}

class _CalendarDatePicker2WithActionButtonsState extends State<CalendarDatePicker2WithActionButtons> {
  List<DateTime?> _values = [];
  List<DateTime?> _editCache = [];

  @override
  void initState() {
    _values = widget.value;
    _editCache = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarDatePicker2WithActionButtons oldWidget) {
    var isValueSame = oldWidget.value.length == widget.value.length;

    if (isValueSame) {
      for (var i = 0; i < oldWidget.value.length; i++) {
        var isSame = (oldWidget.value[i] == null && widget.value[i] == null) ||
            DateUtils.isSameDay(oldWidget.value[i], widget.value[i]);
        if (!isSame) {
          isValueSame = false;
          break;
        }
      }
    }

    if (!isValueSame) {
      _values = widget.value;
      _editCache = widget.value;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MediaQuery.removePadding(
          context: context,
          child: CalendarDatePicker2(
            value: _editCache,
            config: widget.config,
            onValueChanged: (values) {
              _editCache = values;
              Navigator.pop(context, values);
            },
            onDisplayedMonthChanged: widget.onDisplayedMonthChanged,
          ),
        ),
        SizedBox(height: 10),
        widget.config.displayOkCancleButon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildCancelButton(Theme.of(context).colorScheme, localizations),
                  _buildOkButton(Theme.of(context).colorScheme, localizations),
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget _buildCancelButton(ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => setState(() {
        Navigator.pop(context);
        // }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          localizations.cancelButtonLabel.toUpperCase(),
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildOkButton(ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => setState(() {

      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          localizations.okButtonLabel.toUpperCase(),
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
