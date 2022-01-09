import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kitabi_app/book_model/bookmodel.dart';
import '../book_services/service2.dart';

class SearchedBookController extends GetxController {
  var getbooks = <BookModel>[].obs;
  var isLoading = true.obs;
  SearchedBookServices service = SearchedBookServices();
  SearchedBookServices searchedBook = SearchedBookServices();
  @override
  void onInit() {
    callSearchedBooksList();
    super.onInit();
  }

  void callSearchedBooksList() async {
    try {
      var result2 = await searchedBook.getSearchedBooks();
      isLoading.value = true;
      if (result2 != null) {
        getbooks.assignAll(result2);
      } else {
        print('Null');
      }
    } finally {
      isLoading.value = false;
    }

    update();
  }
}
