
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:croquis_campus/main.dart';

void main() {
  testWidgets('La pantalla del campus se muestra correctamente',
      (WidgetTester tester) async {

    await tester.pumpWidget(const CroquisCampusApp());

    expect(find.text('Mapa del campus'), findsOneWidget);

    expect(find.text('TecNM Campus Tlalpan'), findsOneWidget);

    expect(find.byIcon(Icons.apartment), findsOneWidget);
  });
}
