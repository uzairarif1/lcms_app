import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lcms_app/Utils/routeNames.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:provider/provider.dart';
import '../Data/response/status.dart';
import '../Utils/drawer.dart';
import '../model/Auth_model.dart';
import '../view_model/hearing_vm.dart';
import '../view_model/user_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Event {
  final String caseName;
  final String date;

  Event(this.caseName, this.date);
}

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTime _selectedDay;
  Map<DateTime, List<Event>> _events = {}; // Events data from model

  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final model = Provider.of<Hearing_VM>(context, listen: false);
    model.fetchListApi(userViewModel);
    print(model);
    _selectedDay = DateTime.now(); // Set initial selected day
    // Populate _events map based on model data
    if (model.HearingsList.data != null && model.HearingsList.data!.hearings != null) {
      //print("Has Data");
      for (var hearing in model.HearingsList.data!.hearings!) {
        if (hearing.date != null) {
          try {
            DateTime date = DateFormat("yyyy-MM-dd").parse(hearing.date.toString());
            if (_events.containsKey(date)) {
              _events[date]!.add(Event(hearing.caseName!, hearing.date!)); // Add hearing to existing date
            } else {
              _events[date] = [Event(hearing.caseName!, hearing.date!)]; // Create new list for date
            }
          } catch (e) {
            print("Invalid date format: ${hearing.date}");
            // Handle the invalid date format error
          }
        } else {
          print("Null date value");
          // Handle the null date value error
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lastDay = DateTime.utc(2023, 12, 31); // Update lastDay to a future date

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(fontFamily: 'Roboto_Slab_Bold', fontSize: 24),
          ),
          centerTitle: true,
        ),
        drawer: NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.drawerheadColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Hearing Schedule',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Roboto_Slab_Bold'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TableCalendar(
                  calendarFormat: CalendarFormat.month,
                  focusedDay: _selectedDay,
                  firstDay: DateTime.utc(2022, 1, 1),
                  lastDay: lastDay,
                  eventLoader: _getEventsForDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _selectedDay = focusedDay;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildEventList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }
  List<Widget> _buildEventList() {
    List<Widget> eventWidgets = [];

    if (_events.containsKey(_selectedDay)) {
      eventWidgets = _events[_selectedDay]!.map((event) => ListTile(
        title: Text(event.date),
        subtitle: Text(event.caseName),
      )).toList();
    }
    return eventWidgets;
  }



}
