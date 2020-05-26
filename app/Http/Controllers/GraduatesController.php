<?php

namespace App\Http\Controllers;

use App\Models\PeopleInfo\PeopleInfo;
use App\Models\PeopleInfo\PeopleInfoGroup;
use Illuminate\Http\Request;

class GraduatesController extends Controller
{
    public function index()
    {
        return view('graduates.index')->withShortcodes();;
    }

    public function info()
    {
        return view('graduates.graduate-info')->withShortcodes();;
    }

    public function saveInfo(Request $request) {
        $peopleInfo = new PeopleInfo();
        $peopleInfo->name = $request->input('name');
        $peopleInfo->description = $request->input('description');
        $peopleInfo->phone = $request->input('phone');
        $peopleInfo->email = $request->input('email');
        $peopleInfo->status = PeopleInfo::STATUS_NOT_PUBLISHED;
        $peopleInfo->save();
        $networks = [];
        foreach ($request->request as $key => $value) {
            if (substr($key, 0, 15) == "social-network-" && !is_null($value)) {
                $networks[substr($key, 15)] = ['value' => $value];
            }
        }
        $peopleInfo->socialNetworks()->sync($networks);
        $peopleInfo->groups()->sync([PeopleInfoGroup::GRADUATE_GROUP]);

        return redirect()->route('graduates')
            ->with([
                'messages' => [
                    [
                        'text' => __('graduates.create-success'),
                        'type' => 'success',
                    ]
                ],
            ]);
    }
}
