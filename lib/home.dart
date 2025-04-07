/*
Page to display the main interface of the application.
it displays the all widgets horizontally.
It allows the user to select the car model and price form a dropdown.
The user selects the warranty years form a radio group
The user can add car insurance via checkbox
The total price is automatically calculated when one of the widget's state changes
It uses a helper library called car.dart, which includes:
  - cars: list of cars
  - Car class
  - dropdown widget class
  - radio group widget class
 */

import 'package:flutter/material.dart';
import 'car.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPrice = cars.first.getTotalPrice(); // holds total car price
  Car car = cars.first; // set the first car to be displayed

  void updateCar(Car car) {
    // updates car price when the user selects a car form the dropdown
    setState(() {
      this.car = car;
      totalPrice = car.getTotalPrice();
    });
  }

  void updateWarranty(int warranty) {
    // updates warranty years when the user clicks on a radio buttons
    setState(() {
      car.warranty = warranty;
      totalPrice = car.getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: [
              const SizedBox(height: 20.0),
              const Text('Select Model', style: TextStyle(fontSize: 25.0)),
              const SizedBox(height: 10.0),
              MyDropdownMenuWidget(updateCar: updateCar),
              const SizedBox(height: 10.0),
              WarrantyWidget(updateWarranty: updateWarranty, car: car),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Insurance', style: TextStyle(fontSize: 18.0)),
                  Checkbox(value: car.insurance, onChanged: (bool? value) {
                    setState(() {
                      car.insurance = value as bool;
                      totalPrice = car.getTotalPrice();
                  });
              })]),
              const SizedBox(height: 10.0),
              Text('Total Price: $totalPrice', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
            ])));
  }
}
