final store = stringMapStoreFactory.store("store");

Future<SomeObject> findFirst(String someValue) async {
    final filter fl = Filter.equals("someField", someValue);
    final f = Finder(filter: fl);
    return await store.findFirst(_db, finder: f);
}