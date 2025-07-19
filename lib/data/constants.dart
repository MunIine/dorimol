enum Sorting {
  popularity,
  priceAsc,
  priceDesc,
  newMethod,
  saleMethod;

  String get value {
    switch (this) {
      case Sorting.popularity:
        return 'popularity';
      case Sorting.priceAsc:
        return 'price_asc';
      case Sorting.priceDesc:
        return 'price_desc';
      case Sorting.newMethod:
        return 'new';
      case Sorting.saleMethod:
        return 'sale';
    }
  }

  String get presentationValue {
    switch (this) {
      case Sorting.popularity:
        return 'Сортировка по популярности';
      case Sorting.priceAsc:
        return 'По возрастанию цены';
      case Sorting.priceDesc:
        return 'По убыванию цены';
      case Sorting.newMethod:
        return 'По новинкам';
      case Sorting.saleMethod:
        return 'По скидкам';
    }
  }

  static Sorting get defaultSorting => Sorting.popularity;
}