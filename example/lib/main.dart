import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final today = DateUtils.dateOnly(DateTime.now());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalendarDatePicker2 Demo',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
        Locale('he', ''),
        Locale('es', ''),
        Locale('ru', ''),
        Locale('ko', ''),
        Locale('hi', ''),
      ],
      home: const MyHomePage(title: 'CalendarDatePicker2 Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DateTime?> _dialogCalendarPickerValue = [
    DateTime.now(),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  List<DateTime?> dateTime = [DateTime.now()];

  Color test = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          rangePicker(),
          dialog(context),
        ],
      ),
    );
  }

  Widget dialog(BuildContext context) {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      displaySingleButton: true,
      firstDate: DateTime.now(),
    );
    return ElevatedButton(
      onPressed: () async {
        final values = await showCalendarDatePicker2Dialog(
          context: context,
          config: config,
          dialogSize: const Size(400, 360),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          borderRadius: BorderRadius.circular(15),
          value: _dialogCalendarPickerValue,
        );
        if (values != null) {
          dateTime = values;
          setState(() {});
        }
      },
      child: Text('$dateTime'),
    );
  }

  Widget rangePicker() {
    final config =
        CalendarDatePicker2Config(calendarType: CalendarDatePicker2Type.range, cancleButtonTextColor: Colors.green);
    return CalendarDatePicker2WithActionButtons(
      config: config,
      value: _rangeDatePickerValueWithDefaultValue,
      onValueChanged: (dates) => setState(() => _rangeDatePickerValueWithDefaultValue = dates),
    );
  }
}
