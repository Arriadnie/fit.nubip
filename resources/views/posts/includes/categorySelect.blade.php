
@foreach($categories as $category)

    <option value="{{ $category->id }}"
        @if(isset($dataTypeContent->category_id) && $dataTypeContent->category_id == $category->id)
            @foreach($dataTypeContent->categories as $postCategory)
                @if ($category->id == $postCategory->id)
                    selected="selected"
                @endif
            @endforeach
        @endif
    >
        {{ $delimiter }}{{ $category->name }}
    </option>

    @if(count($category->children) > 0)
        @include('posts.includes.categorySelect', [
            'categories' => $category->children,
            'delimiter' => $delimiter . ' - '
        ])
    @endif

@endforeach
