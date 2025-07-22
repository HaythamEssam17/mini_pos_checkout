part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
  @override
  List<Object> get props => [];
}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<Item> items;
  const CatalogLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class CatalogError extends CatalogState {
  final String error;
  const CatalogError(this.error);

  @override
  List<Object> get props => [error];
}
