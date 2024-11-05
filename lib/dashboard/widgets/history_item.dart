import 'package:flutter/material.dart';
import 'package:workinax/extension/date_extension.dart';
import 'package:workinax/extension/duration_extension.dart';
import 'package:workinax/extension/string_extension.dart';
import 'package:workinax/model/work_clock.dart';
import 'package:workinax/theme/colors.dart';
import 'package:workinax/widgets/rounded_text.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(this.workClock, {super.key});

  final WorkClock workClock;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedText(
            workClock.date.formatDayMonth,
            color: AppColor.lightBlue,
          ),
          ClockIn(
            label: [workClock.startWorkTime, workClock.endWorkTime].formatRange,
          ),
          BreakTime(
            label: workClock.totalBreakTime.formatShortDuration,
          ),
          TotalHours(
            label: [workClock.endWorkTime, workClock.startWorkTime].formatHoursDiff,
          ),
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow(
      {super.key,
      required this.icon,
      required this.label,
      this.color,
      this.outlined = false});

  final IconData icon;
  final String? label;
  final Color? color;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: Icon(icon, size: 24)),
        const SizedBox(width: 4),
        Flexible(
            child: RoundedText(
          label.orNA,
          color: color,
          outlined: outlined,
        )),
      ],
    );
  }
}

class ClockIn extends StatelessWidget {
  const ClockIn({super.key, this.label});

  final String? label;
  @override
  Widget build(BuildContext context) {
    return IconRow(
      icon: Icons.history_toggle_off_rounded,
      label: label,
    );
  }
}

class Overtime extends StatelessWidget {
  const Overtime({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return IconRow(
      icon: Icons.more_time_rounded,
      label: label,
      color: AppColor.lightGreen,
      outlined: true,
    );
  }
}

class BreakTime extends StatelessWidget {
  const BreakTime({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return IconRow(
      icon: Icons.coffee_outlined,
      label: label,
      outlined: true,
    );
  }
}

class TotalHours extends StatelessWidget {
  const TotalHours({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return IconRow(
      icon: Icons.access_time_outlined,
      label: label,
      outlined: true,
    );
  }
}