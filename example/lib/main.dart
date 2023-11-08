import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/gestures.dart';
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
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2),
  ];

  List<DateTime?> dateTime = [DateTime.now()];

  final config = CalendarDatePicker2Config(
    calendarType: CalendarDatePicker2Type.single,
    // displayOkCancleButon: false,
  );

  Color test = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final values = await showCalendarDatePicker2Dialog(
              context: context,
              config: config,
              dialogSize: const Size(400, 450),
              borderRadius: BorderRadius.circular(15),
              value: _dialogCalendarPickerValue,
              dialogBackgroundColor: Colors.white,
            );
            if (values != null) {
              dateTime = values;
              setState(() {});
            }
          },
          child: Text('$dateTime'),
        ),
      ),
      // body: Container(
      //   height: 200,
      //   color: Colors.amber,
      //   child: PageView(
      //     pageSnapping: true,
      //     children: [
      //       Text("data"),
      //       Text("data1"),
      //     ],
      //   ),
      // ),
    );
  }

  Widget buildDefaultRangeDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      themeColor: Colors.cyan.shade900,
    );
    return CalendarDatePicker2(
      config: config,
      value: _rangeDatePickerValueWithDefaultValue,
      onValueChanged: (dates) => setState(() => _rangeDatePickerValueWithDefaultValue = dates),
    );
  }
}
