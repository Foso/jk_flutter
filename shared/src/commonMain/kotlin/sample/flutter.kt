package sample


class BuildContext
data class Post(val name: String)

open class Widget {

}

class AppBar(title: Text)

class Scaffold(appBar: AppBar? = null, body: Widget = Widget()) : StatefulWidget() {

}

class Future<T>

class Text(var data: String) : Widget()

class Center(child: Widget = Widget()) : Widget()


class AsyncSnapshot<T> {
    val data: T? = null

}

class FutureBuilder<T>(future: Future<T>, builder: (context: BuildContext, snapshot: AsyncSnapshot<T>) -> Widget) : StatefulWidget()

abstract class StatelessWidget : Widget() {
    abstract fun build(context: BuildContext): Widget
}


abstract class StatefulWidget : Widget() {


}


abstract class ProgressIndicator : StatefulWidget()
class CircularProgressIndicator : ProgressIndicator()


fun fetchPost(): Future<Post> {
    throw Exception("")
}
