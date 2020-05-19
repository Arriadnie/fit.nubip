<ol class="dd-list">

    @foreach ($items as $item)

        <li class="dd-item" data-id="{{ $item->id }}">
            <div class="pull-right item_actions">
                @if(view()->exists('voyager::' . $dataType->slug . '.partial.row-actions'))
                    @include('voyager::' . $dataType->slug . '.partial.row-actions')
                @else
                    @include('voyager::base-with-items.partial.row-actions')
                @endif
            </div>
            <div class="dd-handle">
                @if($isModelTranslatable)
                    @include('voyager::multilingual.input-hidden', [
                        'isModelTranslatable' => true,
                        '_field_name'         => $columns['titleColumn'] . $item->id,
                        '_field_trans'        => json_encode($item->getTranslationsOf($columns['titleColumn']))
                    ])
                @endif
                <span>{{ $item[$columns['titleColumn']] }}</span>
                @if($columns['subTitleColumn'])
                    <small class="url">{{ $columns['subTitleDisplayColumn'] ? $item->{$columns['subTitleColumn']}[$columns['subTitleDisplayColumn']] : $item->{$columns['subTitleColumn']} }}</small>
                @endif

            </div>
            @if($childConf)
                @if(!$item[$childConf['childItemsProperty']]->isEmpty())
                    @if(view()->exists('voyager::' . $dataType->slug . '.partial.items-list'))
                        @include('voyager::' . $dataType->slug . '.partial.items-list', [
                            'items' => $item[$childConf['childItemsProperty']],
                            'isModelTranslatable' => $isModelTranslatable
                        ])
                    @else
                        @include('voyager::base-with-items.partial.items-list', [
                            'items' => $item[$childConf['childItemsProperty']],
                            'isModelTranslatable' => $isModelTranslatable
                        ])
                    @endif
                @endif
            @endif

        </li>

    @endforeach

</ol>
