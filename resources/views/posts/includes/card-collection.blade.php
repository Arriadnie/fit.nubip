
@foreach($posts as $post)
    @include('posts.includes.postCard', ['post' => $post])
@endforeach
