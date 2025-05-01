import 'package:flutter/material.dart';

//files
import '../../../../core/utils/colors.dart';

class Counter extends StatefulWidget {
  final String name;
  final void Function(int value)? onChange;
  int count;
  Counter({super.key, required this.name, this.onChange, required this.count});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          height: 35,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: black),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => widget.onChange!(--widget.count)),
                  child: Icon(
                    Icons.remove,
                    color: primary,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.count.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => widget.onChange!(++widget.count)),
                  child: Icon(
                    Icons.add,
                    color: primary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
