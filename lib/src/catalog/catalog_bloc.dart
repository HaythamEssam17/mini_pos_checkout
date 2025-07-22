import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'catalog_loader.dart';
import 'item.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogLoader catalogLoader;

  CatalogBloc(this.catalogLoader) : super(CatalogLoading()) {
    on<LoadCatalog>(_onLoadCatalog);
  }

  Future<void> _onLoadCatalog(
    LoadCatalog event,
    Emitter<CatalogState> emit,
  ) async {
    try {
      emit(CatalogLoading());
      final catalogJson = await catalogLoader.loadCatalogJson();
      final List<dynamic> decoded = json.decode(catalogJson);
      final items = decoded.map((e) => Item.fromJson(e)).toList();
      emit(CatalogLoaded(items));
    } catch (e) {
      emit(CatalogError('Failed to load catalog'));
    }
  }
}
