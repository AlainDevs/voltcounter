// File: lib/views/info_screen.dart
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Volt Counter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How it works',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'The amount of electricity consumed by an electrical appliance (energy consumption) '
              'is calculated by multiplying its power by the duration of use. Energy consumption is '
              'usually measured in kilo-Watt-hours (kWh), which is commonly expressed as "one unit of electricity".',
            ),
            const SizedBox(height: 16),
            const Text(
              'For example, if a 1,500W electric heater is used for 2 hours, its energy consumption is:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('1,500W × 2h = 3,000Wh = 3 kWh'),
            ),
            const SizedBox(height: 16),
            const Text(
              'The electricity tariff is calculated by multiplying the total energy consumption by the '
              'price per unit of electricity (kWh).',
            ),
            const SizedBox(height: 16),
            const Text(
              'Therefore, the more appliances a household has, and/or the higher the power rating or '
              'the longer duration of use, the more expensive the tariff is.',
            ),
            const SizedBox(height: 24),
            Text(
              'Calculations used in this app',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text('Cost per hour = (Watts / 1000) × Price per kWh'),
            const SizedBox(height: 8),
            const Text('Cost per day = Cost per hour × 24'),
            const SizedBox(height: 8),
            const Text('Cost per month = Cost per day × 30'),
            const SizedBox(height: 8),
            const Text('Cost per year = Cost per day × 365'),
          ],
        ),
      ),
    );
  }
}