part of '../calendar_date_picker2.dart';

class _DatePickerModeToggleButton extends StatefulWidget {
  const _DatePickerModeToggleButton({
    required this.mode,
    required this.title,
    required this.onTitlePressed,
    required this.config,
  });

  final DatePickerMode mode;

  final String title;

  final VoidCallback onTitlePressed;

  final CalendarDatePicker2Config config;

  @override
  _DatePickerModeToggleButtonState createState() => _DatePickerModeToggleButtonState();
}

class _DatePickerModeToggleButtonState extends State<_DatePickerModeToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.mode == DatePickerMode.year ? 0.5 : 0,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(_DatePickerModeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mode == widget.mode) {
      return;
    }

    if (widget.mode == DatePickerMode.year) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.config.controlsHeight ?? _subHeaderHeight),
      alignment: Alignment.center,
      child: Semantics(
        label: MaterialLocalizations.of(context).selectYearSemanticsLabel,
        excludeSemantics: true,
        button: true,
        child: SizedBox(
          width: 250,
          height: (widget.config.controlsHeight ?? _subHeaderHeight),
          child: InkWell(
            onTap: widget.config.disableModePicker == true ? null : widget.onTitlePressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: widget.config.monthNameTextStyle ??
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
