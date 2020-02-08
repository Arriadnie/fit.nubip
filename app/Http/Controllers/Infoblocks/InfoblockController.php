<?php

namespace App\Http\Controllers\Infoblocks;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use App\Models\Infoblocks\Infoblock;

use App\Models\Infoblocks\InfoblockItem;

class InfoblockController extends VoyagerBaseController
{
    public function builder($id)
    {
        $infoblock = Infoblock::findOrFail($id);

        $this->authorize('edit', $infoblock);

        $isModelTranslatable = Voyager::translatable(InfoblockItem::class);

        return Voyager::view('voyager::infoblocks.builder', compact('infoblock', 'isModelTranslatable'));
    }

    public function delete_item($infoblock, $id)
    {
        $item = InfoblockItem::findOrFail($id);

        $this->authorize('delete', $item);

        $item->deleteAttributeTranslation('title');

        $item->destroy($id);

        return redirect()
            ->route('voyager.infoblocks.builder', [$infoblock])
            ->with([
                'message'    => __('voyager::menu_builder.successfully_deleted'),
                'alert-type' => 'success',
            ]);
    }

    public function add_item(Request $request)
    {
        $model = app('App\Models\Infoblocks\Infoblock');

        $this->authorize('add', $model);

        $data = $this->prepareParameters(
            $request->all()
        );

        unset($data['id']);
        $data['order'] = InfoblockItem::highestOrderInfoblockItem();

        // Check if is translatable
        $_isTranslatable = Voyager::translatable(InfoblockItem::class);
        if ($_isTranslatable) {
            // Prepare data before saving the menu
            $trans = $this->prepareInfoblockTranslations($data);
        }

        $infoblockItem = InfoblockItem::create($data);

        // Save menu translations
        if ($_isTranslatable) {
            $infoblockItem->setAttributeTranslations('title', $trans, true);
        }

        return redirect()
            ->route('voyager.infoblocks.builder', [$data['infoblock_id']])
            ->with([
                'message'    => __('voyager::menu_builder.successfully_created'),
                'alert-type' => 'success',
            ]);
    }

    public function update_item(Request $request)
    {
        $id = $request->input('id');
        $data = $this->prepareParameters(
            $request->except(['id'])
        );

        $infoblockItem = InfoblockItem::findOrFail($id);

        $this->authorize('edit', $infoblockItem->infoblock);

        if (is_bread_translatable($infoblockItem)) {
            $trans = $this->prepareInfoblockTranslations($data);

            // Save menu translations
            $infoblockItem->setAttributeTranslations('title', $trans, true);
        }

        $infoblockItem->update($data);

        return redirect()
            ->route('voyager.infoblocks.builder', [$infoblockItem->infoblock_id])
            ->with([
                'message'    => __('voyager::menu_builder.successfully_updated'),
                'alert-type' => 'success',
            ]);
    }

    public function order_item(Request $request)
    {
        $infoblockItemOrder = json_decode($request->input('order'));

        $this->orderMenu($infoblockItemOrder, null);
    }

    private function orderMenu(array $infoblockItems, $parentId)
    {
        foreach ($infoblockItems as $index => $infoblockItem) {
            $item = InfoblockItem::findOrFail($infoblockItem->id);
            $item->order = $index + 1;
            //$item->parent_id = $parentId;
            $item->save();

            /*if (isset($menuItem->children)) {
                $this->orderMenu($menuItem->children, $item->id);
            }*/
        }
    }

    protected function prepareParameters($parameters)
    {
        /*switch (Arr::get($parameters, 'type')) {
            case 'route':
                $parameters['url'] = null;
                break;
            default:
                $parameters['route'] = null;
                $parameters['parameters'] = '';
                break;
        }

        if (isset($parameters['type'])) {
            unset($parameters['type']);
        }*/

        return $parameters;
    }

    /**
     * Prepare menu translations.
     *
     * @param array $data menu data
     *
     * @return JSON translated item
     */
    protected function prepareInfoblockTranslations(&$data)
    {
        $trans = json_decode($data['title_i18n'], true);

        // Set field value with the default locale
        $data['title'] = $trans[config('voyager.multilingual.default', 'en')];

        unset($data['title_i18n']);     // Remove hidden input holding translations
        unset($data['i18n_selector']);  // Remove language selector input radio

        return $trans;
    }






    public function editItem(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }
}
