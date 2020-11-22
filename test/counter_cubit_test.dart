import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });


    group('Increment', () {
      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
        expect: const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..increment()..increment(),
        expect: const <int>[1, 2],
      );

      blocTest<CounterCubit, int>(
        'emits [102] when state is 101',
        build: () => CounterCubit(),
        seed: 101,
        act: (cubit) => cubit.increment(),
        expect: const <int>[102],
      );
    });

    group('decrement', () {
      blocTest<CounterCubit, int>(
        'emits [-1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
        expect: const <int>[-1],
      );

      blocTest<CounterCubit, int>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..decrement()..decrement(),
        expect: const <int>[-1, -2],
      );

      blocTest<CounterCubit, int>(
        'emits [101] when state is 102',
        build: () => CounterCubit(),
        seed: 102,
        act: (cubit) => cubit.decrement(),
        expect: const <int>[101],
      );
    });
  });
}