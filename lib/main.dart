import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'flutter_unified_error.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ErrorDemoPage(),
    );
  }
}

class ErrorDemoPage extends StatelessWidget {
  const ErrorDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unified Error Mapper')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              _button(
                context,
                'No Internet Error',
                () => throw const SocketException('No internet'),
              ),
              _button(context, '401 Unauthorized', () async {
                final dio = Dio();
                await dio.get('https://httpstat.us/401');
              }),
              _button(context, '500 Server Error', () async {
                final dio = Dio();
                await dio.get('https://httpstat.us/500');
              }),
              _button(
                context,
                'Unknown Error',
                () => throw Exception('Unknown'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        child: Text(title),
        onPressed: () async {
          try {
            await Future.microtask(onPressed);
          } catch (e) {
            final appError = ErrorMapper.map(e);
            final uiError = ErrorMapper.toUi(appError);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(uiError.message)));
          }
        },
      ),
    );
  }
}
