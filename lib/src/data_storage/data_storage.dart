
import 'package:localstorage/localstorage.dart';



class LocalDataStorage{
final LocalStorage storage = new LocalStorage('localstorage_app');




void saveItem(String key , String value)
{
  storage.setItem(key, value);
}

}
