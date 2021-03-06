import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_interface_with_animation/app/modules/home/widgets/weather_details_widget.dart';
import 'package:weather_interface_with_animation/app/shared/themes/app_animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNight = false;
  bool isBookmark = false;
  String weatherMainAnimation = "clouds_night";
  String weatherMain = "Clouds";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          _buildCheckBoxNight(),
          _buildCheckBoxBookmark(),
          _builDropDown(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text("$weatherMain selecionado!!"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("OPEN"),
        onPressed: () {
          Get.bottomSheet(
            builder: (_) {
              return WeatherDetailsWidget(
                isNight: isNight,
                weatherMainAnimation: AppAnimation.lottie[weatherMainAnimation],
                description:
                    "Right now in 5°C and feels like -1°C outside. The Wind in blowing around 8.7 km/h and the preassure is 1009 hPa./h and the preassure is 1009 hPa.",
                actionButton: () {},
                isBookmark: isBookmark,
                cityName: "New York",
                temperature: "10",
                wind: "20",
                humidity: "56",
                weatherMain: weatherMain,
              );
            },
            isScrollControlled: true,
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String weatherMain in AppAnimation.lottie.keys) {
      items.add(
        DropdownMenuItem(value: weatherMain, child: Text(weatherMain)),
      );
    }
    return items;
  }

  Widget _buildCheckBoxNight() {
    return ListTile(
      title: Text("Night"),
      trailing: Checkbox(
        value: isNight,
        onChanged: (value) {
          setState(
            () {
              isNight = value;
            },
          );
        },
      ),
    );
  }

  Widget _buildCheckBoxBookmark() {
    return ListTile(
      title: Text("Bookmark"),
      trailing: Checkbox(
        value: isBookmark,
        onChanged: (value) {
          setState(
            () {
              isBookmark = value;
            },
          );
        },
      ),
    );
  }

  Widget _builDropDown() {
    return DropdownButton(
      value: weatherMainAnimation,
      items: getDropDownMenuItems(),
      onChanged: (value) {
        setState(
          () {
            weatherMainAnimation = value;
            List weather = value.split("_");
            if (weather[1].contains("day")) {
              isNight = false;
            } else {
              isNight = true;
            }
            weatherMain =
                '${weather[0][0].toUpperCase()}${weather[0].substring(1)}';
          },
        );
      },
    );
  }
}
