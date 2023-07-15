import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/counter_cubit.dart';

class CounterPage extends StatefulWidget {
  final String title;
  const CounterPage({super.key, required this.title});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => child!,
      child: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPageContent(title: widget.title),
      ),
    );
  }
}

class CounterPageContent extends StatelessWidget {
  final String title;
  const CounterPageContent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, _) {
                var cubit = CounterCubit.get(context);
                return Text(
                  '${cubit.counter}',
                  style: TextStyle(fontSize: 20.sp),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<CounterCubit>(context).increament(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
