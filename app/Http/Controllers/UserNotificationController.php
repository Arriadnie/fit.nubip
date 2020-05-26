<?php

namespace App\Http\Controllers;

use App\Models\UserNotification;
use Illuminate\Http\Request;

class UserNotificationController extends Controller
{

    public function service(Request $request)
    {
        if ($request["methodName"] == "getNotifications") {
            $notifications = $this->_getNotifications();
            $response = response()->json($notifications);
        }
        else if ($request["methodName"] == "setShown") {
            $response = response()->json($this->_setShown());
        }
        else {
            $response = response()->json(array(), 404);
        }

        return $response;
    }

    private function _getNotifications() {
        $items = UserNotification::currentUsers()->orderBy('created_at', 'desc')->take(15)->get();

        if (count($items) > 0) {
            $viewResult = view('notifications.index', [
                'items' => $items
            ])->render();
        }
        else {
            $viewResult = '';
        }
        return [
            'view' => $viewResult
        ];
    }

    private function _setShown() {
        UserNotification::
            currentUsers()
            ->update(['is_shown' => true]);
    }

}
