import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_loader.dart';
import 'package:mocktail/mocktail.dart';

class MockCatalogLoader extends Mock implements CatalogLoader {}

void main() {
  group('CatalogBloc', () {
    late MockCatalogLoader mockLoader;
    late CatalogBloc bloc;

    const mockJson = '''
    [
      {"id": "1", "name": "Item 1", "price": 10.0},
      {"id": "2", "name": "Item 2", "price": 20.0}
    ]
    ''';

    setUp(() {
      mockLoader = MockCatalogLoader();
      bloc = CatalogBloc(mockLoader);
    });

    tearDown(() => bloc.close());

    test('initial state is CatalogLoading', () {
      expect(bloc.state, CatalogLoading());
    });

    blocTest<CatalogBloc, CatalogState>(
      'emits [CatalogLoading, CatalogLoaded] when loading succeeds',
      build: () {
        when(
          () => mockLoader.loadCatalogJson(),
        ).thenAnswer((_) async => mockJson);
        return bloc;
      },
      act: (bloc) => bloc.add(LoadCatalog()),
      expect:
          () => [
            CatalogLoading(),
            isA<CatalogLoaded>().having(
              (s) => s.items.length,
              'items length',
              2,
            ),
          ],
    );

    blocTest<CatalogBloc, CatalogState>(
      'emits [CatalogLoading, CatalogError] when loading fails',
      build: () {
        when(() => mockLoader.loadCatalogJson()).thenThrow(Exception('fail'));
        return bloc;
      },
      act: (bloc) => bloc.add(LoadCatalog()),
      expect: () => [CatalogLoading(), isA<CatalogError>()],
    );
  });
}
