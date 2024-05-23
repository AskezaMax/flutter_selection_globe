import 'package:flutter/material.dart';

class SelectionGlobe extends StatelessWidget {
  final List<List<String>> listOfDetails;
  final FixedExtentScrollController _outerController = FixedExtentScrollController();

  SelectionGlobe({required this.listOfDetails});

  @override
  Widget build(BuildContext context) {
    return _horizontalWheelList(
      listOfDetails.map((details) {return _verticalWheelList(details);}).toList(),
      _outerController,
    );
  }

  Widget _verticalWheelList(List<String> numbers) {
    final FixedExtentScrollController controller = FixedExtentScrollController();

    return SizedBox(
      width: 70,
      height: 500,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 95,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: numbers.map((number) {
            return Container(
              padding: const EdgeInsets.all(5.0),
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _legoImage(number),
                  const SizedBox(height: 5.0),
                  Text(
                    number,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _horizontalWheelList(List<Widget> items, FixedExtentScrollController controller) {
    return RotatedBox(
      quarterTurns: 1,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 80,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: items.map((item) {
            return RotatedBox(
              quarterTurns: -1,
              child: item,
            );
          }).toList(),
        ),
      ),
    );
  }

  Image _legoImage(String number) {
    return Image.network(
      'https://img.bricklink.com/ItemImage/PN/3/$number.png',
      width: 50,
      height: 50,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(Icons.error, color: Colors.red, size: 40);
      },
    );
  }
}